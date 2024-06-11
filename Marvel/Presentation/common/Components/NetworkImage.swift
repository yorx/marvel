import SwiftUI
import CachedAsyncImage

struct NetworkImage: View {
    var url: URL
    
    var body: some View {
        CachedAsyncImage(
            url: url,
            scale: 1
        ) { image in
            image
                .resizable()
        } placeholder: {
            Loader()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NetworkImage(url: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!)
}
