import Foundation

// Event model represents each EDM event in the app
struct Event: Identifiable, Equatable {
    let id = UUID() // Unique ID for use in lists
    let title: String // Event name
    let category: String // Genre/category (e.g., House, Techno)
    let date: String // Event date
    let location: String // Event location/venue
    let description: String // Short description of the event

    // Returns the name of the image asset associated with this event
    var imageName: String {
        switch title {
        case "Luttrell": return "luttrell"
        case "Blanke": return "blanke"
        case "Loco Dice, Brunello, Lubelski": return "loco"
        case "Henry Fong": return "henry"
        case "Oguz": return "oguz"
        case "Intricacy OC: Andy Moor": return "moor"
        default: return "default" // Fallback image
        }
    }
}

