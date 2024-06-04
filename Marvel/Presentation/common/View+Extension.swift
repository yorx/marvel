import SwiftUI

extension View {
    func padding(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
}
