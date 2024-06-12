import Foundation

extension String {
    public func replace(_ original: String, replacement: String) -> String {
        guard let range = self.range(of: original) else {
            return self
        }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
