import Foundation

struct ComicModel: Identifiable {
    let id: Int
    let image: URL?
    let resourceURL: URL?
    
    public static let mockList: [ComicModel] = [
        ComicModel(
            id: 0,
            image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"),
            resourceURL: URL(string: "https://www.marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 1,
            image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"),
            resourceURL: URL(string: "https://www.marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 2,
            image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"),
            resourceURL: URL(string: "https://www.marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        ),
        ComicModel(
            id: 3,
            image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"),
            resourceURL: URL(string: "https://www.marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e")
        )
    ]
}
