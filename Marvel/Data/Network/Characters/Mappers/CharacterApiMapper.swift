import Foundation

struct CharacterApiMapper {
    private static var extensionSeparator: String = "."
    
    static func toDomain(_ characterList: CharacterListApiModel) -> [CharacterModel] {
        return characterList.data.results.compactMap { character in
            CharacterModel(
                id: character.id, 
                image: Self.mapThumbnail(character.thumbnail),
                name: character.name,
                description: character.description
            )
        }
    }
    
    private static func mapThumbnail(_ image: Thumbnail) -> URL? {
        return URL(string: image.path + Self.extensionSeparator + image.thumbnailExtension)
    }
}
