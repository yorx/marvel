import Foundation
enum NetworkProviderError: Error {
    case unknown
    case invalidRequest
    case server(code: Int)
}
