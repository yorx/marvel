import Foundation

struct ComicApiModel: Codable {
    let data: ComicListDataModel
    
    struct ComicListDataModel: Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results: [ComicListDataResult]
        
        struct ComicListDataResult: Codable {
            let id: Int
            let title: String
            let urls: [URLElement]
            let thumbnail: Thumbnail
            
            struct URLElement: Codable {
                let type: URLType
                let url: String
            }
            
            enum URLType: String, Codable {
                case detail
                case inAppLink
                case purchase
                case reader
            }
        }
    }
}
