import Foundation

struct ThumbnailMapper {
    private static var extensionSeparator: String = "."
    
    public static func toDomain(_ image: Thumbnail) -> URL? {
        return URL(string: image.path + Self.extensionSeparator + image.thumbnailExtension)
    }
}
