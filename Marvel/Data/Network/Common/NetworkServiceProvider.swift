import Foundation

class NetworkServiceProvider {
    var urlSession = URLSession.shared
    
    public func fetchData<T: Codable>(url: URLRequest) async throws -> T {
        let (data, response) = try await urlSession.data(for: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkProviderError.unknown
        }
        guard (200..<400).contains(httpResponse.statusCode) else {
            throw NetworkProviderError.server(code: httpResponse.statusCode)
        }
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
