import Foundation

struct NetworkRequestBuilder {
    private static let scheme = "https"
    private static let host = "gateway.marvel.com"
    private static let port = 443
    
    private static let publicKey = ""
    private static let privateKey = ""
    
    public static func buildRequest(endpoint: String, method: HttpMethod, urlParams: [String: Any] = [:]) throws -> URLRequest {
        var components = URLComponents()
        components.host = Self.host
        components.port = Self.port
        components.scheme = Self.scheme
        components.path = endpoint
        let authKeys = Self.getAuthKeys()
        let urlParams = urlParams.compactMap { URLQueryItem(name: $0.key, value: $0.value as? String) }
        components.queryItems = urlParams + authKeys
        guard let url = components.url else {
            throw NetworkProviderError.invalidRequest
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    
    private static func getAuthKeys() -> [URLQueryItem] {
        let timestamp = String(format: "%.0f", NSDate().timeIntervalSince1970)
        let hash = MD5(string: "\(timestamp)\(Self.privateKey)\(Self.publicKey)")
        let authKeys = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: Self.publicKey),
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
