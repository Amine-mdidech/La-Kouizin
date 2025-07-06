import SwiftUI
import WebKit
import AVKit
import AppKit

// MARK: - Main Content View
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State var recipeViewModel : RecipeViewModel?
    @State private var selectedRecipe: Recipe?
    
    var body: some View {
        NavigationSplitView {
            if let recipeViewModel = recipeViewModel {
                RecipeBoardView(selectedRecipe: $selectedRecipe)
                    .environmentObject(recipeViewModel)
            } else {
                ProgressView("Loading ...")
            }
        }
        detail: {
            // Detail view - shows when a recipe is selected
            if let selectedRecipe = selectedRecipe, let recipeViewModel = recipeViewModel {
                RecipeDetailView(recipe: selectedRecipe)
                    .environmentObject(recipeViewModel)
            } else {
                Text("Select a recipe to view details")
                    .foregroundColor(.secondary)
            }
        }
        .task {
            if recipeViewModel == nil {
                recipeViewModel = RecipeViewModel(modelContext: modelContext)
            }
        }
    }
}
