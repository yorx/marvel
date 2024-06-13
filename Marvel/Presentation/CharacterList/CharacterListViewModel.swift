import Foundation

final class CharacterListViewModel: ObservableObject {
    private var repository: CharactersRepository
    
    var actualPage: Int = 0
    @Published var viewState: ViewState = .empty
    @Published var characters: [CharacterModel] = []
    @Published var selectedCharacter: CharacterModel? = nil
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
 
    @MainActor
    public func loadInitialData() async {
        do {
            self.resetInformation()
            self.viewState = .loading
            let loadedCharacters = try await repository.getCharacters(page: actualPage)
            self.characters = loadedCharacters
            actualPage += 1
            self.viewState = .okey
        } catch {
            self.viewState = .error(error: .serviceError)
        }
    }
    
    @MainActor
    public func loadMore() async {
        do {
            self.viewState = .loading
            let loadedCharacters = try await repository.getCharacters(page: actualPage)
            self.characters += loadedCharacters
            actualPage+=1
            self.viewState = .okey
        } catch {
            self.viewState = .error(error: .serviceError)
        }
    }
    
    public func openDetail(id: Int) {
        guard let tappedCharacter = characters.first(where: { $0.id == id }) else {
            return
        }
        self.selectedCharacter = tappedCharacter
    }
    
    private func resetInformation() {
        self.characters = []
        self.actualPage = 0
    }
    
    private func fetchCharacters(page: Int) async throws -> [CharacterModel] {
        return try await repository.getCharacters(page: actualPage)
    }
}
