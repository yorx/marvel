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
        LazyVGrid(columns: Constants.gridLayout, spacing: Constants.itemListSpacing){
            ForEach(self.viewModel.characters) { character in
                Button {
                    self.viewModel.openDetail(id: character.id)
                } label: {
                    CharacterCell(model: character)
                }
                .buttonStyle(.plain)
                .frame(height: Constants.maxCellHeight)
            }
        }
    }
    
    enum Constants {
        static let horizontalMargin: CGFloat = 16
        static let itemListSpacing: CGFloat = 16
        static let backgroundColor: Color = Color.background1
        static let navigationColor: Color = Color.background3
        static let maxCellHeight: CGFloat = 250
        static let gridLayout = Array.init(repeating: GridItem(.flexible()), count: 2)
    }
}

#Preview {
    CharacterListBuilder()
}
