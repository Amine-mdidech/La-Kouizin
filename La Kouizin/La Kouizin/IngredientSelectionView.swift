//
//  IngredientSelectionView.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 22/6/2025.
//

import SwiftUI
import SwiftData

struct IngredientSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var ingredientStore = IngredientStore()
    
    let selectedIngredients: [String]
    let onIngredientsSelected: ([String]) -> Void
    
    @State private var tempSelectedIngredients: Set<String>
    @State private var searchText = ""
    @State private var selectedCategory: Ingredient.IngredientCategory?
    @State private var showingAddIngredient = false
    
    init(selectedIngredients: [String], onIngredientsSelected: @escaping ([String]) -> Void) {
        self.selectedIngredients = selectedIngredients
        self.onIngredientsSelected = onIngredientsSelected
        self._tempSelectedIngredients = State(initialValue: Set(selectedIngredients))
    }
    
    private var filteredIngredients: [Ingredient] {
        ingredientStore.searchIngredients(query: searchText, category: selectedCategory)
    }
    
    var body: some View {
            VStack(spacing: 0) {
                // Search and Filter Bar
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search ingredients...", text: $searchText)
                            .textFieldStyle(.plain)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // Category Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Button("All") {
                                selectedCategory = nil
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedCategory == nil ? Color.blue : Color(.systemGray))
                            .foregroundColor(selectedCategory == nil ? .white : .primary)
                            .clipShape(Capsule())
                            
                            ForEach(Ingredient.IngredientCategory.allCases, id: \.self) { category in
                                Button(category.rawValue) {
                                    selectedCategory = category
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedCategory == category ? Color.blue : Color(.systemGray))
                                .foregroundColor(selectedCategory == category ? .white : .primary)
                                .clipShape(Capsule())
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.vertical, 16)
                .background(Color(.systemGray))
                
                Divider()
                
                // Ingredients Grid
                ScrollView {
                    IngredientsGridView(
                        ingredients: filteredIngredients,
                        selectedIngredients: tempSelectedIngredients,
                        onIngredientTapped: { ingredient in
                            if tempSelectedIngredients.contains(ingredient.name) {
                                tempSelectedIngredients.remove(ingredient.name)
                            } else {
                                tempSelectedIngredients.insert(ingredient.name)
                            }
                        },
                        onAddNewTapped: {
                            showingAddIngredient = true
                        }
                    )
                    .padding(20)
                }
                
                // Selected Count and Action Bar
                if !tempSelectedIngredients.isEmpty {
                    VStack(spacing: 0) {
                        Divider()
                        HStack {
                            Text("\(tempSelectedIngredients.count) ingredient\(tempSelectedIngredients.count == 1 ? "" : "s") selected")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Button("Clear All") {
                                tempSelectedIngredients.removeAll()
                            }
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color(.systemGray))
                    }
                }
            }
            .navigationTitle("Select Ingredients")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        onIngredientsSelected(Array(tempSelectedIngredients))
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .secondaryAction) {
                    Button("Delete Item") {
                        
                    }
                }
            }
        .sheet(isPresented: $showingAddIngredient) {
            AddNewIngredientView(ingredientStore: ingredientStore) { newIngredient in
                tempSelectedIngredients.insert(newIngredient.name)
            }
        }
    }
}
