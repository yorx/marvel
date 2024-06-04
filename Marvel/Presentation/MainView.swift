import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            CharacterListBuilder()
        }
    }
}

#Preview {
    MainView()
}
