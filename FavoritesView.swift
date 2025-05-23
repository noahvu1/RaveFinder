import Foundation
import SwiftUI

// View that displays a list of the user's favorite events
struct FavoritesView: View {
    var viewModel: EventViewModel

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // full-screen dark background

            // If no favorites, show a centered message
            if viewModel.favorites.isEmpty {
                VStack {
                    Spacer()
                    Text("No favorites yet.")
                        .foregroundColor(.gray)
                        .font(.title3)
                    Spacer()
                }
            } else {
                // Show list of favorited events
                List {
                    ForEach(viewModel.favorites) { event in
                        // Tapping navigates to detail view
                        NavigationLink(destination: EventDetailView(event: event, viewModel: viewModel)) {
                            EventCardView(event: event)
                        }
                        // Swipe to unfavorite
                        .swipeActions {
                            Button {
                                viewModel.toggleFavorite(event)
                            } label: {
                                Label("Unfavorite", systemImage: "heart.slash")
                            }
                            .tint(.gray)
                        }
                    }
                    .listRowSeparator(.hidden) // no default separators
                    .listRowBackground(Color.clear) // transparent row background
                }
                .listStyle(.plain) // clean list style
            }
        }
        .navigationTitle("Favorites") // top title
        .navigationBarTitleDisplayMode(.inline) // small nav bar
    }
}

