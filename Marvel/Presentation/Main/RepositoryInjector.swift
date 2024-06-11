import SwiftUI

class RepositoryInjector: ObservableObject {
    var charactersRepository: CharactersRepository
    
    init() {
        let config = EnvironmentConfiguration.shared
        guard let publicKey = config.publicKey, let privateKey = config.privateKey else {
            fatalError("Api keys are not configured")
        }
        let provider = NetworkServiceProvider()
        let requestBuilder = NetworkRequestBuilder(publicKey: publicKey, privateKey: privateKey)
        self.charactersRepository = CharactersNetworkRepository(provider: provider, requestBuilder: requestBuilder)
    }
}

private struct RepositoryInjectorKey: EnvironmentKey {
    static let defaultValue: RepositoryInjector? = nil
}

extension EnvironmentValues {
    var repositoryInjector: RepositoryInjector? {
        get { self[RepositoryInjectorKey.self] }
        set { self[RepositoryInjectorKey.self] = newValue }
    }
}

extension View {
    func inject(_ value: RepositoryInjector) -> some View {
        environment(\.repositoryInjector, value)
    }
}