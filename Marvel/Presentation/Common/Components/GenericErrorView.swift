import SwiftUI

struct GenericErrorView: View {
    var retry: () -> Void
    
    var body: some View {
        VStack(spacing: Constants.errorSpacing) {
            Text("empty_list_alert")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
            Button(action: self.retryLoad) {
                Text("retry_button_description")
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
