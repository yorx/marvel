import SwiftUI

struct CharacterCell: View {
    var model: CharacterModel
    
    var body: some View {
        VStack(spacing: Constants.contentSpacing) {
            Text(model.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(model.description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(horizontal: Constants.horizontalCardSpacing, vertical: Constants.verticalCardSpacing)
        .background(cellBackground)
    }
    
    var cellBackground: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Constants.backgroundColor)
            .strokeBorder(Constants.borderColor, style: Constants.borderStyle)
    }
    
    
    enum Constants {
        static let contentSpacing: CGFloat = 16
        static let horizontalCardSpacing: CGFloat = 16
        static let verticalCardSpacing: CGFloat = 8
        static let cornerRadius: CGFloat = 16
        static let backgroundColor: Color = Color.background2
        static let borderColor: Color = Color.border1
        static let borderStyle = StrokeStyle(lineWidth: 2)
    }
}

#Preview {
    CharacterCell(model: CharacterModel(id: 5, name: "Superman", description: "Es muy fuerte"))
        .padding(horizontal: 5)
}
