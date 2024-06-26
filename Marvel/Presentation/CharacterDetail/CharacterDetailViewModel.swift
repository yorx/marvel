import Foundation

final class CharacterDetailViewModel: ObservableObject {
    var character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
    }
}
