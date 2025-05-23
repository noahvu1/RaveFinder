import SwiftUI

// View that allows swiping left/right to see multiple event detail views
struct EventSwipeView: View {
    let events: [Event] // List of events to swipe through
    let selectedEvent: Event // The event that was tapped to enter this view
    var viewModel: EventViewModel // Shared data model

    @State private var selectedIndex: Int = 0 // Tracks which event is currently visible

    var body: some View {
        TabView(selection: $selectedIndex) {
            // Loop through all event indices and show each in a swipeable page
            ForEach(events.indices, id: \.self) { index in
                EventDetailView(event: events[index], viewModel: viewModel)
                    .tag(index) // tag links this view to the tab index
                    .padding(.horizontal) // adds a little spacing around each detail view
            }
        }
        .tabViewStyle(.page) // enables horizontal swipe behavior
        .indexViewStyle(.page(backgroundDisplayMode: .always)) // optional dot indicator

        // When the view appears, jump to the tapped event's position in the list
        .onAppear {
            if let initialIndex = events.firstIndex(of: selectedEvent) {
                selectedIndex = initialIndex
            }
        }

        .background(Color.black) // sets background to black (behind swiped views)
        .ignoresSafeArea() // makes sure it fills the whole screen
    }
}

