import Foundation

struct CharacterApiMapper: DomainMapper {
    static func toDomain(_ model: CharacterListApiModel) -> [CharacterModel] {
        return model.data.results.compactMap { character in
            CharacterModel(
                id: character.id, 
                image: ThumbnailMapper.toDomain(character.thumbnail),
                name: character.name,
                description: character.description
            )
        }
    }
}
