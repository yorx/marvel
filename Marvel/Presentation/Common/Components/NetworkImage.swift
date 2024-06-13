import SwiftUI
import CachedAsyncImage

struct NetworkImage: View {
    var url: URL
    
    var body: some View {
        CachedAsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Loader()
        }
    }
}

#Preview {
    NetworkImage(url: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!)
}
