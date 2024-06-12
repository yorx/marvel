import Foundation

struct CharacterApiMapper {
    static func toDomain(_ characterList: CharacterListApiModel) -> [CharacterModel] {
        return characterList.data.results.compactMap { character in
            CharacterModel(
                id: character.id, 
                image: ThumbnailMapper.toDomain(character.thumbnail),
                name: character.name,
                description: character.description
            )
        }
    }
}
