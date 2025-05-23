import Foundation
import SwiftUI

// View that shows a full list of all available events
struct EventsListView: View {
    var viewModel: EventViewModel

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // dark full-screen background

            List {
                // Loop through all events
                ForEach(viewModel.events) { event in
                    // Tapping on an event opens swipeable detail view
                    NavigationLink(
                        destination: EventSwipeView(events: viewModel.events, selectedEvent: event, viewModel: viewModel)
                    ) {
                        EventCardView(event: event) // shows event info with image
                    }

                    // Swipe left to favorite or unfavorite
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
                .listRowSeparator(.hidden) // removes default list separators
                .listRowBackground(Color.clear) // removes default row background
            }
            .listStyle(.plain) // minimal list styling
        }
        .navigationTitle("All Events") // top bar title
        .navigationBarTitleDisplayMode(.inline) // uses small nav bar title
    }
}

