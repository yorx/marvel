import Foundation

struct CharacterLocalMapper {
    public static func toDomain(_ character: CharacterLocalModel) -> CharacterModel {
        CharacterModel(
            id: character.id,
            image: URL(string: character.image),
            name: character.name,
            description: character.description
        )
    }
}
