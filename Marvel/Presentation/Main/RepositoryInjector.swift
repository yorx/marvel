import SwiftUI

class RepositoryInjector: ObservableObject {
    var charactersRepository: CharactersRepository
    var comicsRepository: ComicsRepository
    
    static var local: RepositoryInjector {
        return RepositoryInjector(
            charactersRepository: CharactersLocalRepository(),
            comicsRepository: ComicsLocalRepository()
        )
    }
    
    init(charactersRepository: CharactersRepository, comicsRepository: ComicsRepository) {
        self.charactersRepository = charactersRepository
        self.comicsRepository = comicsRepository
    }
    
    init() {
        let config = EnvironmentConfiguration.shared
        guard let publicKey = config.publicKey, let privateKey = config.privateKey else {
            fatalError("Api keys are not configured")
        }
        let provider = NetworkServiceProvider()
        let requestBuilder = NetworkRequestBuilder(publicKey: publicKey, privateKey: privateKey)
        self.charactersRepository = CharactersNetworkRepository(provider: provider, requestBuilder: requestBuilder)
        self.comicsRepository = ComicsNetworkRepository(provider: provider, requestBuilder: requestBuilder)
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
