import Foundation
import SwiftUI

// View for displaying all unique event categories (e.g. House, Techno)
struct CategoriesView: View {
    var viewModel: EventViewModel

    // Extracts unique, sorted list of categories from all events
    private var categories: [String] {
        Set(viewModel.events.map { $0.category }).sorted()
    }

    var body: some View {
        ZStack {
            // Fullscreen dark background
            Color.black.ignoresSafeArea()

            List {
                // Show each category as a row with a link
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: EventsByCategoryView(category: category, viewModel: viewModel)
                    ) {
                        Text(category)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                    }
                    .listRowBackground(Color(.darkGray)) // dark card style
                    .cornerRadius(10)
                }
                .listRowSeparator(.hidden) // removes line separators between rows
            }
            .listStyle(.plain) // removes grouped style padding
        }
        .navigationTitle("Genres") // top nav bar title
        .navigationBarTitleDisplayMode(.inline) // keeps title small, not large
    }
}
