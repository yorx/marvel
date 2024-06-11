import Foundation
struct EnvironmentConfiguration {
    static let shared = EnvironmentConfiguration()
    
    let privateKey: String?
    let publicKey: String?
    
    private init() {
        guard let apiConfig = Bundle.main.infoDictionary else {
            fatalError("Couldn't read apiConfig file")
        }
        self.privateKey = apiConfig["PRIVATE_KEY"] as? String
        self.publicKey = apiConfig["PUBLIC_KEY"] as? String
    }
}
