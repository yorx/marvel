import SwiftUI

struct ComicListBuilder: View {
    @Environment(\.repositoryInjector) private var repositoryInjector
    var characterId: Int
    
    var body: some View {
        ComicListView(viewModel: ComicListViewModel(repository: repositoryInjector!.comicsRepository, characterId: self.characterId))
    }
}
