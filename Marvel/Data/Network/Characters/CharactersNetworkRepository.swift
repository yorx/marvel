import Foundation

class CharactersNetworkRepository: CharactersRepository {
    private static let charactersEndpoint = "/v1/public/characters"
    private static let characterDetailEndpoint = "/v1/public/characters/{characterId}"
    
    var provider: NetworkServiceProvider
    var requestBuilder: NetworkRequestBuilder
    
    init(provider: NetworkServiceProvider, requestBuilder: NetworkRequestBuilder) {
        self.provider = provider
        self.requestBuilder = requestBuilder
    }
    
    func getCharacters(page: Int) async throws -> [CharacterModel] {
        let request = try requestBuilder.buildRequest(endpoint: Self.charactersEndpoint, method: HttpMethod.get)
        let characterList: CharacterListApiModel = try await provider.fetchData(url: request)
        return CharacterApiMapper.toDomain(characterList)
    }
    
    func getCharacterDetail(id: String) async throws -> CharacterDetailModel {
        return CharacterDetailModel()
    }
}
