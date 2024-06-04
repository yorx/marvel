import Foundation

protocol CharactersRepository {
    func getCharacters(page: Int) async throws -> [CharacterModel]
    func getCharacterDetail(id: String) async throws -> CharacterDetailModel
}
