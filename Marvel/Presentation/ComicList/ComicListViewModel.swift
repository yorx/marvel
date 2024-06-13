import Foundation

final class ComicListViewModel: ObservableObject {
    @Published var viewState: ViewState = .empty
    @Published var comics: [ComicModel] = []
    
    private let repository: ComicsRepository
    private let characterId: Int
    
    init(repository: ComicsRepository, characterId: Int) {
        self.repository = repository
        self.characterId = characterId
    }
    
    @MainActor
    public func loadInitialData() async {
        do {
            self.viewState = .loading
            let comics = try await repository.getCharacterComics(characterId: self.characterId)
            self.comics = comics
            self.viewState = .okey
        } catch {
            self.viewState = .error(error: .serviceError)
        }
    }
}
