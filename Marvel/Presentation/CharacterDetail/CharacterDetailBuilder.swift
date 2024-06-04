import SwiftUI

struct CharacterDetailBuilder: View {
    var character: CharacterModel
    
    var body: some View {
        CharacterDetailView(
            viewModel: CharacterDetailViewModel(character: character)
        )
    }
}
