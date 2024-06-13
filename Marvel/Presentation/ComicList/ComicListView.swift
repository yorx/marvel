import SwiftUI

struct ComicListView: View {
    @StateObject var viewModel: ComicListViewModel
    
    var elementWidth: CGFloat
    var elementHeight: CGFloat {
        elementWidth * Constants.cardAspectRatio.height / Constants.cardAspectRatio.width
    }
    
    
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
    
    @ViewBuilder
    var contentView: some View {
        if !self.viewModel.comics.isEmpty {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: Constants.comicSpacing) {
                    ForEach(self.viewModel.comics) { comic in
                        ComicCell(comic: comic)
                            .frame(width: self.elementWidth, height: self.elementHeight)
                    }
                }
                .padding(Constants.listMargin)
            }
        } else {
            emptyList
        }
    }
    
    var emptyList: some View {
        Text("comic_list_empty_alert")
            .font(.title2)
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
        static let cardAspectRatio: CGSize = CGSize(width: 9, height: 16)
    }
}

#Preview {
    ComicListBuilder(characterId: 1011334, elementWidth: 140)
        .inject(RepositoryInjector.local)
}
