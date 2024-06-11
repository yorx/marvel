import Foundation

enum ViewState: Equatable {
    case empty
    case loading
    case okey
    case error(error: ViewError)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch(lhs, rhs) {
        case(.loading, .loading), (.empty, .empty), (.okey, .okey): return true
        case(.error(let lhError), .error(let rhError)): return lhError == rhError
        default: return false
        }
    }
}

enum ViewError {
    case serviceError
}
