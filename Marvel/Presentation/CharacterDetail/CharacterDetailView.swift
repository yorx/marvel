import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.headerSpacing){
                if let imageUrl = viewModel.character.image {
                    NetworkImage(url: imageUrl)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                }
                VStack {
                    Text(viewModel.character.description)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, Constants.contentMargin)
                comicSection
            }
        }
        .background(Constants.backgroundColor)
        .navigationTitle(viewModel.character.name)
        .toolbarBackground(Constants.navigationColor, for: .navigationBar)
    }
    
    var comicSection: some View {
        VStack(spacing: Constants.sectionTitleSpacing) {
            Text("Comics")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, Constants.contentMargin)
            ComicListBuilder(
                characterId: self.viewModel.character.id,
                elementWidth: 140
            )
        }
    }
    
    
    enum Constants {
        static let backgroundColor: Color = Color.background1
        static let navigationColor: Color = Color.background3
        
        static let headerImageHeight: CGFloat = 250
        static let headerSpacing: CGFloat = 16
        static let contentMargin: CGFloat = 16
        
        static let sectionTitleSpacing: CGFloat = 4
    }
}

#Preview {
    NavigationView {
        CharacterDetailBuilder(
            character: CharacterModel(
                id: 0,
                image: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"),
                name: "Superman",
                description: "Un buen superheroe"
            )
        )
    }
    .inject(RepositoryInjector.local)
}
