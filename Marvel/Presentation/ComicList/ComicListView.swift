import SwiftUI

struct ComicListView: View {
    @StateObject var viewModel: ComicListViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            switch self.viewModel.viewState {
            case .empty, .loading:
                Loader()
            case .okey:
                contentView
            case .error:
                GenericErrorView(retry: self.retryLoad)
            }
        }
        .task {
            guard self.viewModel.viewState == .empty else {
                return
            }
            await self.viewModel.loadInitialData()
        }
    }
    
    var contentView: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: Constants.comicSpacing) {
                ForEach(self.viewModel.comics) { comic in
                    ComicCell(comic: comic)
                }
            }
            .padding(Constants.listMargin)
        }
    }
    
    private func retryLoad() {
        guard self.viewModel.viewState != .loading else {
            return
        }
        Task {
            await self.viewModel.loadInitialData()
        }
    }
    
    enum Constants {
        static let comicSpacing: CGFloat = 16
        static let listMargin: CGFloat = 16
    }
}

#Preview {
    ComicListBuilder(characterId: 1011334)
}
