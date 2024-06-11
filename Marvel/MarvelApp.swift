import SwiftUI

@main
struct MarvelApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
