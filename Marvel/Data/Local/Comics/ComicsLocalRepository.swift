import Foundation

final class ComicsLocalRepository: ComicsRepository {
    func getCharacterComics(characterId: Int) async throws -> [ComicModel] {
        return Self.mockList
    }
    
    private static let mockList: [ComicModel] = [
        ComicModel(
            id: 0,
            image: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806.jpg"),
            resourceURL: URL(string: "http://marvel.com/comics/issue/22506/avengers_the_initiative_2007_19?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 1,
            image: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"),
            resourceURL: URL(string: "http://marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 2,
            image: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/58dd057d304d1.jpg"),
            resourceURL: URL(string: "http://marvel.com/comics/issue/22299/avengers_the_initiative_2007_18?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 3,
            image: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/a0/58dd03dc2ec00.jpg"),
            resourceURL: URL(string: "http://marvel.com/comics/issue/21975/avengers_the_initiative_2007_17?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        )
    ]
    
}
