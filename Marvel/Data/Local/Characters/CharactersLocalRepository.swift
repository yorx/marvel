import Foundation

final class CharactersLocalRepository: CharactersRepository {
    func getCharacters(page: Int) async throws -> [CharacterModel] {
        let characters: [CharacterLocalModel] = try FileReader.shared.readJson(path: "characters")
        return characters.compactMap { CharacterLocalMapper.toDomain($0) }
    }
}
