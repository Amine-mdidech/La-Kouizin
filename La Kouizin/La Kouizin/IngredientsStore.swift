//
//  IngredientsStore.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 22/6/2025.
//

import SwiftUI
import SwiftData

struct Ingredient: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let imageName: String
    let category: IngredientCategory
    
    enum IngredientCategory: String, CaseIterable, Codable {
        case vegetables = "Vegetables"
        case fruits = "Fruits"
        case meat = "Meat & Poultry"
        case seafood = "Seafood"
        case dairy = "Dairy"
        case grains = "Grains & Cereals"
        case spices = "Spices & Herbs"
        case condiments = "Condiments"
        case nuts = "Nuts & Seeds"
        case other = "Other"
    }
}

class IngredientStore: ObservableObject {
    @Published var availableIngredients: [Ingredient] = []
    
    init() {
        loadDefaultIngredients()
    }
    
    private func loadDefaultIngredients() {
        // Sample ingredients using asset images
        // Make sure these image names match your Assets catalog
        availableIngredients = [
            // Vegetables
            Ingredient(name: "Tomato", imageName: "Tomato", category: .vegetables),
            Ingredient(name: "Onion", imageName: "Onion", category: .vegetables),
            Ingredient(name: "Potato", imageName: "Potato", category: .vegetables),
            Ingredient(name: "Sugar", imageName: "Sugar", category: .spices),
            Ingredient(name: "Butter", imageName: "Butter", category: .dairy),
            Ingredient(name: "Carrots", imageName: "Carrots", category: .vegetables),
            Ingredient(name: "Milk", imageName: "Milk", category: .dairy),
            Ingredient(name: "Chicken drums", imageName: "Chicken drum", category: .meat),
            Ingredient(name: "Cheese", imageName: "Cheese", category: .dairy),
            Ingredient(name: "Beef", imageName: "Beef", category: .meat),
            Ingredient(name: "Cucumber", imageName: "Cucumber", category: .vegetables),
            Ingredient(name: "Wheat flour", imageName: "Flour", category: .grains),
            Ingredient(name: "Eggs", imageName: "Eggs", category: .other),
            Ingredient(name: "Garlic", imageName: "Garlic", category: .vegetables),
            Ingredient(name: "Lemon", imageName: "Lemon", category: .fruits)
        ]
    }
    
    func addIngredient(_ ingredient: Ingredient) {
        availableIngredients.append(ingredient)
    }
    
    func searchIngredients(query: String, category: Ingredient.IngredientCategory? = nil) -> [Ingredient] {
        var filtered = availableIngredients
        
        if let category = category {
            filtered = filtered.filter { $0.category == category }
        }
        
        if !query.isEmpty {
            filtered = filtered.filter { $0.name.localizedCaseInsensitiveContains(query) }
        }
        
        return filtered.sorted { $0.name < $1.name }
    }
    
    func deleteIngredients(at offsets: IndexSet) {
        availableIngredients.remove(atOffsets: offsets)
    }
}
