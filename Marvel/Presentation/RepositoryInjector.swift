import SwiftUI

class RepositoryInjector: ObservableObject {
    var charactersRepository: CharactersRepository = CharactersNetworkRepository()
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
