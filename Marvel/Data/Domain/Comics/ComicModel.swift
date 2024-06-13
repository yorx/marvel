import Foundation

struct ComicModel: DomainModel, Identifiable {
    let id: Int
    let image: URL?
    let resourceURL: URL?
}
