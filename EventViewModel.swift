import Foundation
import Observation

// ViewModel class that holds and manages all app data
@Observable
class EventViewModel {
    
    // Hardcoded list of all available events
    var events: [Event] = [
        Event(
            title: "Luttrell",
            category: "House",
            date: "May 23",
            location: "Academy LA - Los Angeles, CA",
            description: "21+ event featuring Luttrell’s melodic house set."
        ),
        Event(
            title: "Blanke",
            category: "Dubstep",
            date: "May 23",
            location: "Time Nightclub - Costa Mesa, CA",
            description: "21+ event with heavy bass and dubstep by Blanke."
        ),
        Event(
            title: "Loco Dice, Brunello, Lubelski",
            category: "Techno",
            date: "May 23",
            location: "Grand Park - Los Angeles, CA",
            description: "21+ outdoor techno showcase."
        ),
        Event(
            title: "Henry Fong",
            category: "House",
            date: "May 23",
            location: "Exchange LA - Los Angeles, CA",
            description: "21+ high-energy house music experience."
        ),
        Event(
            title: "Oguz",
            category: "Techno",
            date: "May 23",
            location: "Lot 613 - Los Angeles, CA",
            description: "21+ gritty underground techno vibes."
        ),
        Event(
            title: "Intricacy OC: Andy Moor",
            category: "House",
            date: "May 23",
            location: "The Circle OC - Huntington Beach, CA",
            description: "21+ progressive and classic house set."
        )
    ]

    // Stores user's favorite events
    var favorites: [Event] = []
    
    // Adds or removes an event from favorites
    func toggleFavorite(_ event: Event) {
        if let index = favorites.firstIndex(of: event) {
            favorites.remove(at: index) // Unfavorite
        } else {
            favorites.append(event) // Add to favorites
        }
    }
    
    // Checks if a given event is already a favorite
    func isFavorite(_ event: Event) -> Bool {
        favorites.contains(event)
    }
    
    // Returns all events that match a specific category
    func events(for category: String) -> [Event] {
        events.filter { $0.category == category }
    }
}
