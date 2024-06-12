import Foundation

final class FileReader {
    static var shared = FileReader()
    
    private var jsonDecoder = JSONDecoder()
    
    public func readJson<T: Codable>(path: String) throws -> T {
        guard let url = Bundle.main.url(forResource: path, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let content = try? jsonDecoder.decode(T.self, from: data)
        else {
            throw FileReaderError.notReadable
        }
        return content
    }
}
