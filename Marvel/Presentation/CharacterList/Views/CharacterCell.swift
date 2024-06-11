import SwiftUI
import CachedAsyncImage

struct CharacterCell: View {
    var model: CharacterModel
    
    var body: some View {
        VStack(spacing: Constants.imageSpacing){
            if let imageUrl = model.image {
                NetworkImage(url: imageUrl)
                    .frame(height: Constants.imageHeight)
                    .clipped()
            }
            VStack(spacing: Constants.contentSpacing) {
                Text(model.name)
                    .lineLimit(1)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal, Constants.horizontalCardSpacing)
        }
        .padding(.bottom, Constants.bottomCardSpacing)
        .background(cellBackground)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
    
    var cellBackground: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Constants.backgroundColor)
            .strokeBorder(Constants.borderColor, style: Constants.borderStyle)
    }
    
    
    enum Constants {
        static let imageSpacing: CGFloat = 16
        static let contentSpacing: CGFloat = 4
        static let horizontalCardSpacing: CGFloat = 4
        static let bottomCardSpacing: CGFloat = 8
        static let cornerRadius: CGFloat = 16
        static let backgroundColor: Color = Color.background2
        static let borderColor: Color = Color.border1
        static let borderStyle = StrokeStyle(lineWidth: 2)
        static let imageHeight: CGFloat = 150
    }
}

#Preview {
    CharacterCell(
        model: CharacterModel(
            id: 5,
            image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"),
            name: "Superman",
            description: "Es muy fuerte"
        )
    )
    .padding(
        horizontal: 5
    )
}
