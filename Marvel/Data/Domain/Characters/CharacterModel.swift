import Foundation

struct CharacterModel: DomainModel, Identifiable, Hashable {
    let id: Int
    let image: URL?
    let name: String
    let description: String
}

extension URL: DomainModel {}
