import SwiftUI

struct ComicListBuilder: View {
    @Environment(\.repositoryInjector) private var repositoryInjector
    var characterId: Int
    
    var elementWidth: CGFloat
    
    var body: some View {
        ComicListView(
            viewModel: ComicListViewModel(
                repository: repositoryInjector!.comicsRepository,
                characterId: self.characterId
            ),
            elementWidth: elementWidth
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
