import Foundation
import SwiftUI

// A reusable view that displays a single event as a styled card
struct EventCardView: View {
    let event: Event // The event to show

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Event image on the left
            Image(event.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // Event text on the right
            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text("\(event.location)  |  21+")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding() // padding around the card content
        .background(
            // Card background with dark color and shadow
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.darkGray))
                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
        )
    }
}
