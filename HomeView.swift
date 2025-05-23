import Foundation
import SwiftUI

// The main home screen of the app
struct HomeView: View {
    @State private var viewModel = EventViewModel() // Shared view model instance

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient for a dark, vibrant feel
                LinearGradient(colors: [.black, .gray.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    // App title with emoji
                    Text("🎧 RaveFinder")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(.top, 50)

                    Spacer()

                    // Navigation buttons
                    VStack(spacing: 20) {
                        NavigationLink(destination: EventsListView(viewModel: viewModel)) {
                            HomeButton(title: "Browse Events")
                        }

                        NavigationLink(destination: CategoriesView(viewModel: viewModel)) {
                            HomeButton(title: "Categories")
                        }

                        NavigationLink(destination: FavoritesView(viewModel: viewModel)) {
                            HomeButton(title: "Favorites")
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

// A reusable styled button used on the home screen
struct HomeButton: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity) // full-width button
            .padding()
            .background(Color.white) // white button on dark background
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 3)
            .padding(.horizontal, 30) // spacing from screen edge
    }
}

