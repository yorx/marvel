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
                CharacterDetailView()
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
        .navigationTitle("Personajes de marvel")
        .toolbarBackground(Constants.navigationColor, for: .navigationBar)
        
    }
    
    var emptyPlaceholder: some View {
        VStack {
            Text("Listado vacio")
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder var characterList: some View {
        LazyVStack(spacing: Constants.itemListSpacing) {
            ForEach(self.viewModel.characters) { character in
                Button {
                    self.viewModel.openDetail(id: character.id)
                } label: {
                    CharacterCell(model: character)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    
    enum Constants {
        static let horizontalMargin: CGFloat = 16
        static let itemListSpacing: CGFloat = 4
        static let backgroundColor: Color = Color.background1
        static let navigationColor: Color = Color.background3
    }
}

#Preview {
    CharacterListBuilder()
}
