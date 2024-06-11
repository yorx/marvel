import SwiftUI

struct Loader: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }
}

#Preview {
    Loader()
}
