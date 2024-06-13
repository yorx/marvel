import SwiftUI

extension View {
    func padding(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
}

// MARK: View Reader
extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
      background(
        GeometryReader { geometryProxy in
          Color.clear
            .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
        }
      )
      .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    func readSize(value: Binding<CGSize>) -> some View {
        self.readSize { newSize in
            value.wrappedValue = newSize
        }
    }
    
    /// Reads the view frame and bind it to the reader.
        /// - Parameters:
        ///   - coordinateSpace: a coordinate space for the geometry reader.
        ///   - reader: a reader of the view frame.
    func readFrame(in coordinateSpace: CoordinateSpace = .global, for reader: Binding<CGRect>) -> some View {
           readFrame(in: coordinateSpace) { value in
               reader.wrappedValue = value
           }
       }
       
       /// Reads the view frame and send it to the reader.
       /// - Parameters:
       ///   - coordinateSpace: a coordinate space for the geometry reader.
       ///   - reader: a reader of the view frame.
       func readFrame(in coordinateSpace: CoordinateSpace = .global, for reader: @escaping (CGRect) -> Void) -> some View {
           background(
               GeometryReader { geometryProxy in
                   Color.clear
                       .preference(key: FramePreferenceKey.self, value: geometryProxy.frame(in: coordinateSpace))
                       .onPreferenceChange(FramePreferenceKey.self, perform: reader)
               }
           )
       }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct FramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
