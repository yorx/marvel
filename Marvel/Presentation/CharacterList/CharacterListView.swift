import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
        contentView
            .task {
                guard self.viewModel.characters.isEmpty else {
                    return
                }
                await self.viewModel.loadInitialData()
            }
            .navigationDestination(item: self.$viewModel.selectedCharacter) { character in
                CharacterDetailBuilder(character: character)
            }
    }
    
    @ViewBuilder var contentView: some View {
        ScrollView {
            VStack(spacing: .zero) {
                if self.viewModel.characters.isEmpty {
                    emptyPlaceholder
                } else {
                    characterList
                }
            }
            .padding(.horizontal, Constants.horizontalMargin)
            
        }
        .background(Constants.backgroundColor)
        .navigationTitle("character_list_title")
        .toolbarBackground(Constants.navigationColor, for: .navigationBar)
        .refreshable {
            self.pullToRefresh()
        }
    }
    
    @ViewBuilder var emptyPlaceholder: some View {
        VStack(spacing: .zero) {
            if case .error = self.viewModel.viewState {
                GenericErrorView(retry: self.retryLoad)
            } else {
                Loader()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder var characterList: some View {
        VStack {
            LazyVGrid(columns: Constants.gridLayout, spacing: Constants.itemListSpacing){
                ForEach(self.viewModel.characters) { character in
                    Button {
                        self.viewModel.openDetail(id: character.id)
                    } label: {
                        CharacterCell(model: character)
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity)
                }
                GridRow(alignment: .center) {
                    Spacer()
                }
                .task {
                    loadMoreItems()
                }
            }
            if self.viewModel.viewState == .loading {
                Loader()
            }
        }

    }
    
    private func retryLoad() {
        Task {
            await self.viewModel.loadInitialData()
        }
    }
    
    private func pullToRefresh() {
        Task {
            await self.viewModel.loadInitialData()
        }
    }
    
    private func loadMoreItems() {
        guard self.viewModel.viewState != .loading  else {
            return
        }
        Task {
            await self.viewModel.loadMore()
        }
    }
    
    enum Constants {
        static let horizontalMargin: CGFloat = 16
        static let itemListSpacing: CGFloat = 16
        static let backgroundColor: Color = Color.background1
        static let navigationColor: Color = Color.background3
        static let gridLayout = Array.init(repeating: GridItem(.flexible()), count: 2)
    }
}

#Preview {
    CharacterListBuilder()
        .inject(RepositoryInjector.local)
}
