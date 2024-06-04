import Foundation

class CharacterListViewModel: ObservableObject {
    private var repository: CharactersRepository = CharactersNetworkRepository()
    
    var actualPage: Int = 0
    @Published var characters: [CharacterModel] = []
    
    @Published var selectedCharacter: CharacterModel? = nil
    
    init() {
        
    }
 
    @MainActor
    public  func loadInitialData() async {
        do {
            let loadedCharacters = try await repository.getCharacters(page: actualPage)
            self.characters += loadedCharacters
            actualPage+=1
        } catch {
            print("Error")
        }
    }
    
    public func openDetail(id: Int) {
        guard let tappedCharacter = characters.first(where: { $0.id == id }) else {
            return
        }
        self.selectedCharacter = tappedCharacter
    }
}
