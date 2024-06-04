import Foundation

struct CharacterListApiModel: Codable {
    let data: CharacterListDataClass
    
    struct CharacterListDataClass: Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results: [CharacterListResult]
        
        struct CharacterListResult: Codable {
            let id: Int
            let name, description: String
            let resourceURI: String
            let comics, series: ComicsCollectionApiModel
            let events: ComicsCollectionApiModel
        }
    }
}

struct ComicsCollectionApiModel: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}
