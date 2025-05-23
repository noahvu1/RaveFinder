import Foundation
import SwiftUI

// View that shows detailed info about a single event
struct EventDetailView: View {
    let event: Event // The event being viewed
    var viewModel: EventViewModel // Shared data model

    var body: some View {
        ZStack {
            // Background gradient for a smooth dark aesthetic
            LinearGradient(colors: [.black, .gray.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Main event image
                    Image(event.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(12)

                    // Event title
                    Text(event.title)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    // Date and location with icons
                    HStack {
                        Label(event.date, systemImage: "calendar")
                        Label(event.location, systemImage: "mappin.and.ellipse")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)

                    Divider().background(Color.gray) // subtle line break

                    // Event description
                    Text(event.description)
                        .font(.body)
                        .foregroundColor(.white)

                    // Favorite/unfavorite button
                    Button(action: {
                        viewModel.toggleFavorite(event)
                    }) {
                        Label(
                            viewModel.isFavorite(event) ? "Remove from Favorites" : "Add to Favorites",
                            systemImage: viewModel.isFavorite(event) ? "heart.slash" : "heart"
                        )
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isFavorite(event) ? Color.gray : Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                .padding() // padding around all content
            }
        }
        .navigationTitle("Details") // top nav title
        .navigationBarTitleDisplayMode(.inline) // small nav bar
    }
}
