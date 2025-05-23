import SwiftUI

// Entry point of the app
@main
struct EventFinderApp: App {
    
    init() {
        // Customize the appearance of the navigation bar globally
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black // black background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // white title
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // white large title

        // Apply appearance to all navigation bar states
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white // sets back button and link tint to white
    }

    var body: some Scene {
        // Launch the app with HomeView as the root view
        WindowGroup {
            HomeView()
        }
    }
}

