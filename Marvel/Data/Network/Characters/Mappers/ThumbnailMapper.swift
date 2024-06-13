import Foundation

struct ThumbnailMapper: DomainMapper {
    private static var extensionSeparator: String = "."
    
    static func toDomain(_ model: Thumbnail) -> URL? {
        URL(string: model.path + Self.extensionSeparator + model.thumbnailExtension)
    }
}
