//
//  RecipeViewModel.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI
import SwiftData

@Observable
class RecipeViewModel: ObservableObject {
    private var modelContext: ModelContext
    var recipes: [Recipe] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadRecipes()
        
        if recipes.isEmpty {
            loadSampleData()
        }
    }
    
    func addRecipe(_ recipe: Recipe) {
        modelContext.insert(recipe)
        saveContext()
        loadRecipes()
    }
    
    func updateRecipe(_ recipe: Recipe) {
        saveContext()
        loadRecipes()
    }
    
    func deleteRecipe(_ recipe: Recipe) {
        modelContext.delete(recipe)
        saveContext()
        loadRecipes()
    }
    
    func incrementTimesCooked(for recipe: Recipe) {
        recipe.timesCooked += 1
        saveContext()
        loadRecipes()
    }
    
    func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func loadRecipes() {
        let request = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.title)])
        do {
            recipes = try modelContext.fetch(request)
        } catch {
            print("Failed to load recipes: \(error)")
        }
    }
    
    func filteredRecipes(with filter: RecipeFilter) -> [Recipe] {
        return recipes.filter { recipe in
            if let category = filter.category, recipe.category != category {
                return false
            }
            
            if let difficulty = filter.difficulty, recipe.difficulty != difficulty {
                return false
            }
            
            if let maxTime = filter.maxCookingTime, recipe.cookingTime ?? 0 > maxTime {
                return false
            }
            
            if let minCooked = filter.minTimesCooked, recipe.timesCooked < minCooked {
                return false
            }
            
            if !filter.searchText.isEmpty {
                let searchLower = filter.searchText.lowercased()
                return recipe.title.lowercased().contains(searchLower) ||
                       recipe.shortDescription.lowercased().contains(searchLower)
            }
            
            return true
        }
    }
    
    private func loadSampleData() {
        _ = [
            Recipe(
                title: "Classic Pancakes",
                shortDescription: "Fluffy and delicious breakfast pancakes",
                fullDescription: "Perfect for weekend mornings, these pancakes are light, fluffy, and absolutely delicious.",
                ingredients: ["2 cups flour", "2 eggs", "1 1/2 cups milk", "2 tbsp sugar", "1 tsp baking powder"],
                instructions: ["Mix dry ingredients", "Beat eggs and milk", "Combine mixtures", "Cook on griddle"],
                category: .breakfast,
                difficulty: .easy,
                cookingTime: 20,
                youtubeURL: "https://www.youtube.com/watch?v=UzEr8RISXds",
                timesCooked: 5
            ),
            Recipe(
                title: "Chocolate Cake",
                shortDescription: "Rich and moist chocolate cake",
                fullDescription: "A decadent chocolate cake that's perfect for special occasions.",
                ingredients: ["2 cups flour", "1 3/4 cups sugar", "3/4 cup cocoa powder", "2 eggs"],
                instructions: ["Preheat oven", "Mix ingredients", "Bake for 30 minutes"],
                category: .dessert,
                difficulty: .medium,
                cookingTime: 60,
                timesCooked: 2
            )
        ]
    }
}
