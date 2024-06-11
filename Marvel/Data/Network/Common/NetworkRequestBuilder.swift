import Foundation

struct NetworkRequestBuilder {
    private static let scheme = "https"
    private static let host = "gateway.marvel.com"
    private static let port = 443
    
    private var publicKey: String
    private var privateKey: String
    
    init(publicKey: String, privateKey: String) {
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func buildRequest(endpoint: String, method: HttpMethod, urlParams: [String: Any] = [:]) throws -> URLRequest {
        var components = URLComponents()
        components.host = Self.host
        components.port = Self.port
        components.scheme = Self.scheme
        components.path = endpoint
        let authKeys = self.getAuthKeys()
        let urlParams = urlParams.compactMap { URLQueryItem(name: $0.key, value: $0.value as? String) }
        components.queryItems = urlParams + authKeys
        guard let url = components.url else {
            throw NetworkProviderError.invalidRequest
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    
    private func getAuthKeys() -> [URLQueryItem] {
        let timestamp = String(format: "%.0f", NSDate().timeIntervalSince1970)
        let hash = MD5(string: "\(timestamp)\(self.privateKey)\(self.publicKey)")
        let authKeys = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: self.publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        return authKeys
    }
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
