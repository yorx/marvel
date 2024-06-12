import Foundation

protocol CharactersRepository {
    func getCharacters(page: Int) async throws -> [CharacterModel]
}
