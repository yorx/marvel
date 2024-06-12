import Foundation

class CharactersNetworkRepository: CharactersRepository {
    private static let charactersEndpoint = "/v1/public/characters"
    private static let characterDetailEndpoint = "/v1/public/characters/{characterId}"
    
    private let itemsPerPage: Int = 20
    
    var provider: NetworkServiceProvider
    var requestBuilder: NetworkRequestBuilder
    
    init(provider: NetworkServiceProvider, requestBuilder: NetworkRequestBuilder) {
        self.provider = provider
        self.requestBuilder = requestBuilder
    }
    
    func getCharacters(page: Int) async throws -> [CharacterModel] {
        let params = ["offset": "\(page*itemsPerPage)", "limit": "\(itemsPerPage)"]
        let request = try requestBuilder.buildRequest(endpoint: Self.charactersEndpoint, method: HttpMethod.get, urlParams: params)
        let characterList: CharacterListApiModel = try await provider.fetchData(url: request)
        return CharacterApiMapper.toDomain(characterList)
    }
    
    func getCharacterDetail(id: String) async throws -> CharacterDetailModel {
        return CharacterDetailModel()
    }
}
