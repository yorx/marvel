import SwiftUI

struct CharacterListBuilder: View {
    @Environment(\.repositoryInjector) private var repositoryInjector
    
    var body: some View {
        CharacterListView(viewModel: CharacterListViewModel(repository: repositoryInjector!.charactersRepository))
    }
}
