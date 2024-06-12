import Foundation

class ComicsNetworkRepository: ComicsRepository {
    private static let comicEndpoint = "/v1/public/characters/{characterId}/comics"
    
    var provider: NetworkServiceProvider
    var requestBuilder: NetworkRequestBuilder
    
    init(provider: NetworkServiceProvider, requestBuilder: NetworkRequestBuilder) {
        self.provider = provider
        self.requestBuilder = requestBuilder
    }
    
    func getCharacterComics(characterId: Int) async throws -> [ComicModel] {
        let endpoint = Self.comicEndpoint.replace("{characterId}", replacement: "\(characterId)")
        let request = try requestBuilder.buildRequest(endpoint: endpoint, method: HttpMethod.get)
        let characterList: ComicApiModel = try await provider.fetchData(url: request)
        return ComicApiMapper.toDomain(characterList)
    }
}
