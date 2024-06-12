import Foundation

struct ComicApiMapper {
    static func toDomain(_ comicList: ComicApiModel) -> [ComicModel] {
        return comicList.data.results.compactMap { comic in
            ComicModel(
                id: comic.id,
                image: ThumbnailMapper.toDomain(comic.thumbnail),
                resourceURL: Self.mapResourceURL(comic: comic)
            )
        }
    }
    
    private static func mapResourceURL(comic: ComicApiModel.ComicListDataModel.ComicListDataResult) -> URL? {
        guard let detailURL = comic.urls.first(where: { $0.type == .detail }) else {
            return nil
        }
        return URL(string: detailURL.url)
    }
}
