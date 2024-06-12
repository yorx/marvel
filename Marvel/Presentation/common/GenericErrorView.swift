import SwiftUI

struct GenericErrorView: View {
    var retry: () -> Void
    
    var body: some View {
        VStack(spacing: Constants.errorSpacing) {
            Text("Listado vacio")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
            Button(action: self.retryLoad) {
                Text("Reintentar")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func retryLoad() {
        self.retry()
    }
    
    enum Constants {
        static let errorSpacing: CGFloat = 16
    }
}
