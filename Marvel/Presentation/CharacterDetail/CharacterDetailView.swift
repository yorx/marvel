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
                        .frame(height: Constants.headerImageHeight)
                        .frame(maxWidth: .infinity)
                        .clipped()
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
            ComicListBuilder(characterId: self.viewModel.character.id)
                .frame(height: 250)
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
    CharacterDetailBuilder(character: CharacterModel(id: 0, image: nil, name: "Superman", description: ""))
}
