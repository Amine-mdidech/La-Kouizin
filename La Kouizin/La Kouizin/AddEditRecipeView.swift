//
//  AddEditRecipeView.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct AddEditRecipeView: View {
    @EnvironmentObject var recipeStore: RecipeViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var recipe: Recipe
    @State private var ingredientText = ""
    @State private var instructionText = ""
    @State private var showingIngredientSelection = false
    
    init(recipe: Recipe? = nil) {
        self.recipe = recipe ?? Recipe(
            title: "",
            shortDescription: "",
            fullDescription: "",
            ingredients: [String](),
            instructions: [String](),
            category: .breakfast,
            difficulty: .easy,
            cookingTime: 30
        )
    }
    
    var body: some View {
        Form {
            Section("Basic Information") {
                TextField("Recipe Title", text: $recipe.title)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Short Description", text: $recipe.shortDescription)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Full Description", text: $recipe.fullDescription, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(3...6)
            }
            
            Section("Details") {
                HStack {
                    Picker("Category", selection: $recipe.category) {
                        ForEach(Recipe.RecipeCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Picker("Nationality", selection: $recipe.nationality) {
                        ForEach(Country.allCases, id: \.self) { country in
                            Text(country.rawValue).tag(country)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Picker("Difficulty", selection: $recipe.difficulty) {
                        ForEach(Recipe.Difficulty.allCases, id: \.self) { difficulty in
                            Text(difficulty.rawValue).tag(difficulty)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Text("Cooking Time (minutes)")
                    Spacer()
                    TextField("", value: $recipe.cookingTime, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 80)
                }
            }
            
            Section("YouTube Video (Optional)") {
                TextField("YouTube URL", text: Binding(
                    get: { recipe.youtubeURL ?? "" },
                    set: { recipe.youtubeURL = $0.isEmpty ? nil : $0 }
                ))
                .textFieldStyle(.roundedBorder)
            }
            
            Section("Ingredients (\(recipe.ingredients.count))") {
                if recipe.ingredients.isEmpty {
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.secondary)
                        Text("No ingredients selected")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    .padding(.vertical, 4)
                } else {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        HStack {
                            Text("•")
                                .foregroundColor(.secondary)
                                .font(.title2)
                            Text(recipe.ingredients[index])
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, 2)
                    }
                    .onDelete(perform: deleteIngredient)
                }
                
                // Select Ingredients Button
                Button(action: {
                    showingIngredientSelection = true
                }) {
                    Label(
                        recipe.ingredients.isEmpty ? "Add Ingredients" : "Modify Ingredients",
                        systemImage: recipe.ingredients.isEmpty ? "plus.circle.fill" : "pencil.circle.fill"
                    )
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.plain)
                .padding(.vertical, 4)
            }
            
            Section("Instructions") {
                ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, instruction in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .foregroundColor(.blue)
                            .font(.system(.body, design: .monospaced))
                            .frame(width: 25, alignment: .leading)
                        
                        Text(instruction)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 2)
                }
                .onDelete(perform: deleteInstruction)
                
                HStack {
                    TextField("Add instruction", text: $instructionText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Add") {
                        if !instructionText.isEmpty {
                            recipe.instructions.append(instructionText)
                            instructionText = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, 5)
            }
        }
        .formStyle(.grouped)
        .navigationTitle(recipe.title.isEmpty ? "New Recipe" : "Edit Recipe")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    saveRecipe()
                    dismiss()
                }
                .disabled(recipe.title.isEmpty)
            }
        }
        .sheet(isPresented: $showingIngredientSelection) {
            IngredientSelectionView(
                selectedIngredients: recipe.ingredients,
                onIngredientsSelected: { ingredients in
                    recipe.ingredients = ingredients
                }
            )
        }
    }
    
    private func deleteIngredient(at offsets: IndexSet) {
        recipe.ingredients.remove(atOffsets: offsets)
    }
    
    private func deleteInstruction(at offsets: IndexSet) {
        recipe.instructions.remove(atOffsets: offsets)
    }
    
    private func saveRecipe() {
        if recipeStore.recipes.contains(where: { $0.id == recipe.id }) {
            recipeStore.updateRecipe(recipe)
        } else {
            recipeStore.addRecipe(recipe)
        }
    }
    
}
