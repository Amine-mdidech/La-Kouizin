//
//  RecipeBoardView.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct RecipeBoardView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @State private var filter = RecipeFilter()
    @State private var showingAddRecipe = false
    @State private var showingFilters = false
    @Binding var selectedRecipe: Recipe?
    
    var filteredRecipes: [Recipe] {
        recipeViewModel.filteredRecipes(with: filter)
    }
    
    var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var body: some View {
        VStack {
            searchSection
            filterSection
            recipeGridSection
        }
        .navigationTitle("My Recipes")
        .toolbar {
            ToolbarItem(placement: .principal) {
                addRecipeButton
            }
            ToolbarItem(placement: .primaryAction) {
                filterButton
            }
            ToolbarItem(placement: .automatic) {
                deleteButton
            }
        }
        .sheet(isPresented: $showingAddRecipe) {
            addRecipeSheet
        }
        .sheet(isPresented: $showingFilters) {
            filterSheet
        }
    }
    
    private var searchSection: some View {
        SearchBar(text: $filter.searchText)
            .padding(.horizontal)
    }
    
    private var filterSection: some View {
        FilterSummaryView(filter: filter, onClearFilter: clearFilter)
    }
    
    private var recipeGridSection: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 16) {
                ForEach(filteredRecipes) { recipe in
                    recipeCard(for: recipe)
                }
            }
            .padding()
        }
    }
    
    private func recipeCard(for recipe: Recipe) -> some View {
        let isSelected = selectedRecipe?.id == recipe.id
        let strokeColor = isSelected ? Color.blue : Color.clear
        
        return RecipeCardView(recipe: recipe)
            .environmentObject(recipeViewModel)
            .onTapGesture {
                selectedRecipe = recipe
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(strokeColor, lineWidth: 2)
            )
    }
    
    private var addRecipeButton: some View {
        Button("Add Recipe") {
            showingAddRecipe = true
        }
    }
    
    private var filterButton: some View {
        Button("Filter") {
            showingFilters = true
        }
    }
    
    private var deleteButton: some View {
        Button("Delete Recipe") {
            guard let selectedRecipe else { return }
            recipeViewModel.deleteRecipe(selectedRecipe)
        }
    }
    
    private var addRecipeSheet: some View {
        AddEditRecipeView()
            .environmentObject(recipeViewModel)
    }
    
    private var filterSheet: some View {
        FilterView(filter: $filter)
    }
    
    private func clearFilter() {
        filter = RecipeFilter()
    }
}
