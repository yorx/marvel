import SwiftUI

struct MainView: View {
    var repositoryInjector: RepositoryInjector
    
    init() {
        self.repositoryInjector = RepositoryInjector()
    }
    
    var body: some View {
        NavigationStack {
            CharacterListBuilder()
        }
        .inject(repositoryInjector)
    }
}

#Preview {
    MainView()
}
