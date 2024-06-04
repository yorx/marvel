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
                
            }
        }
        .background(Constants.backgroundColor)
        .navigationTitle(viewModel.character.name)
        .toolbarBackground(Constants.navigationColor, for: .navigationBar)
    }
    
    enum Constants {
        static let backgroundColor: Color = Color.background1
        static let navigationColor: Color = Color.background3
        
        static let headerImageHeight: CGFloat = 250
        static let headerSpacing: CGFloat = 16
        static let contentMargin: CGFloat = 16
    }
}
