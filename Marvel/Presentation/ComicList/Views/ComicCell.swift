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
    ComicCell(
        comic: ComicModel(
            id: 0,
            image: URL(
                string: "https://i.annihil.us/u/prod/marvel/i/mg/1/10/4e94a23255996.jpg"
            ),
            resourceURL: URL(
                string: "https://www.marvel.com/comics/issue/22300/avengers_the_initiative_2007_18_zombie_variant/zombie_variant?utm_campaign=apiRef&utm_source=c1b20f146ff966f81fdc7c2ac19a948e"
            )
        )
    )
}
