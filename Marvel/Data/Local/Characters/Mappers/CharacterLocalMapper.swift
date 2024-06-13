import Foundation

struct CharacterLocalMapper: DomainMapper {
    public static func toDomain(_ model: CharacterLocalModel) -> CharacterModel {
        CharacterModel(
            id: model.id,
            image: URL(string: model.image),
            name: model.name,
            description: model.description
        )
    }
}
