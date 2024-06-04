import Foundation

struct CharacterApiMapper {
    static func toDomain(_ characterList: CharacterListApiModel) -> [CharacterModel] {
        return characterList.data.results.compactMap { character in
            CharacterModel(
                id: character.id,
                name: character.name,
                description: character.description
            )
        }
    }
}
