import Foundation

struct CharacterModel: Identifiable, Hashable {
    let id: Int
    let image: URL?
    let name: String
    let description: String
}
