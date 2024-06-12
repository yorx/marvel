import SwiftUI

struct ComicCell: View {
    var comic: ComicModel
    
    var body: some View {
        Button(action: goToResource) {
            if let imageURL = comic.image {
                NetworkImage(url: imageURL)
                    .aspectRatio(Constants.imageFormat, contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
    
    private func goToResource() {
        guard let redirectURL = comic.resourceURL else {
            return
        }
        UIApplication.shared.open(redirectURL)
    }
    
    enum Constants {
        static let imageFormat: CGSize = CGSizeMake(9, 16)
        static let cornerRadius: CGFloat = 16
    }
}

#Preview {
    ComicCell(comic: ComicModel.mockList.first!)
}
