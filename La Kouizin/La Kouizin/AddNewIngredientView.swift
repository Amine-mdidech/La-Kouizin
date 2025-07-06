//
//  AddNewIngredientView.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 22/6/2025.
//

import SwiftUI
import SwiftData

struct IngredientCard: View {
    let ingredient: Ingredient
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                ZStack {
                    // Main ingredient image with fallback
                    Image(ingredient.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(
                                                // Fallback background color if image is missing
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(Color.gray.opacity(0.2))
                                            )
                    
                    if isSelected {
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(.green)
                                    .background(Color.white, in: Circle())
                            }
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                    }
                }
                
                Text(ingredient.name)
                    .font(.caption)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(isSelected ? Color.green.opacity(0.1) : Color(.systemGray))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
            )
            .scaleEffect(isSelected ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}

struct AddNewIngredientView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var ingredientStore: IngredientStore
    let onIngredientAdded: (Ingredient) -> Void
    
    @State private var name = ""
    @State private var selectedCategory = Ingredient.IngredientCategory.other
    @State private var selectedImageName = "default_ingredient"
    
    // Default placeholder images for new ingredients
    let availablePlaceholderImages = [
        "default_ingredient", "custom_vegetable", "custom_fruit", "custom_meat",
        "custom_dairy", "custom_grain", "custom_spice", "custom_condiment",
        "custom_nut", "custom_other"
    ]
    
    var body: some View {
        Section("Ingredient Details") {
            Form {
                    TextField("Ingredient Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Ingredient.IngredientCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Text("Tip: If you want to add an ingredient with an Image, email us")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        let newIngredient = Ingredient(
                            name: name,
                            imageName: selectedImageName,
                            category: selectedCategory
                        )
                        ingredientStore.addIngredient(newIngredient)
                        onIngredientAdded(newIngredient)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
}

// MARK: - Ingredients Grid View
struct IngredientsGridView: View {
    let ingredients: [Ingredient]
    let selectedIngredients: Set<String>
    let onIngredientTapped: (Ingredient) -> Void
    let onAddNewTapped: () -> Void
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(ingredients) { ingredient in
                IngredientCard(
                    ingredient: ingredient,
                    isSelected: selectedIngredients.contains(ingredient.name)
                ) {
                    onIngredientTapped(ingredient)
                }
            }
            
            AddNewIngredientCard(onTap: onAddNewTapped)
        }
    }
}

struct AddNewIngredientCard: View {
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                
                Text("Add New")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
