import SwiftUI

struct CharacterListBuilder: View {
    @Environment(\.repositoryInjector) var repositoryInjector
    
    var body: some View {
        CharacterListView(viewModel: CharacterListViewModel(repository: repositoryInjector!.charactersRepository))
    }
}
