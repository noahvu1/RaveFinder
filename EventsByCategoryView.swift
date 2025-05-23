import Foundation
import SwiftUI

// View that shows a filtered list of events for a given category (e.g. "House", "Techno")
struct EventsByCategoryView: View {
    let category: String // The genre to filter by
    var viewModel: EventViewModel

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // dark background behind the list

            List {
                // Only show events matching the selected category
                ForEach(viewModel.events(for: category)) { event in
                    // Tapping opens the swipeable detail view, scoped to the current category list
                    NavigationLink(
                        destination: EventSwipeView(
                            events: viewModel.events(for: category),
                            selectedEvent: event,
                            viewModel: viewModel
                        )
                    ) {
                        EventCardView(event: event) // shows a styled card for the event
                    }

                    // Swipe to favorite or unfavorite
                    .swipeActions {
                        Button {
                            viewModel.toggleFavorite(event)
                        } label: {
                            Label(
                                viewModel.isFavorite(event) ? "Unfavorite" : "Favorite",
                                systemImage: viewModel.isFavorite(event) ? "heart.slash" : "heart"
                            )
                        }
                        .tint(viewModel.isFavorite(event) ? .gray : .red)
                    }
                }
                .listRowSeparator(.hidden) // removes dividers between rows
                .listRowBackground(Color.clear) // transparent row background
            }
            .listStyle(.plain) // clean, modern list style
        }
        .navigationTitle(category) // shows the genre name as the title
        .navigationBarTitleDisplayMode(.inline) // compact title display
    }
}
