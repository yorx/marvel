import SwiftUI

struct CharacterListBuilder: View {
    
    var body: some View {
        CharacterListView(viewModel: CharacterListViewModel())
    }
}
