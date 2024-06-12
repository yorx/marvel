import Foundation

protocol ComicsRepository {
    func getCharacterComics(characterId: Int) async throws -> [ComicModel]
}
