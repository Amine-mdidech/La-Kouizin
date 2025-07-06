//
//  RecipeDetails.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipeStore: RecipeViewModel
    let recipe: Recipe
    @State private var showingEditSheet = false
    @State private var useWebView = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(recipe.category.rawValue)
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text(recipe.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Button("Edit") {
                            showingEditSheet = true
                        }
                        .buttonStyle(.borderedProminent)
                    
                    }
                    
                    HStack {
                        if let timing = recipe.cookingTime {
                            if timing > 0 && timing < 60 {
                                Label("\(timing) min", systemImage: "clock")
                            } else if timing >= 60 {
                                Label("\(timing)", systemImage: "clock")
                            }
                        }
                        Label(recipe.difficulty.rawValue, systemImage: "chart.bar")
                        
                        Spacer()
                        
                        if recipe.timesCooked > 0 {
                            Label("Cooked \(recipe.timesCooked) times", systemImage: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                Text(recipe.fullDescription)
                    .font(.body)
                
                if let youtubeURL = recipe.youtubeURL, !youtubeURL.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Video Tutorial")
                            .font(.headline)
                    
                        YouTubeThumbnailView(videoURL: youtubeURL)
                            .frame(height: 400)
                            .cornerRadius(12)
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    if !recipe.ingredients.isEmpty {
                        Text("Ingredients")
                            .font(.headline)
                        
                        ForEach(Array(recipe.ingredients.enumerated()), id: \.offset) { index, ingredient in
                            HStack {
                                Image(systemName: "circle")
                                    .foregroundColor(.blue)
                                Text(ingredient)
                            }
                        }
                    }
                    
                    if !recipe.instructions.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Instructions")
                                .font(.headline)
                            
                            ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, instruction in
                                HStack(alignment: .top) {
                                    Text("\(index + 1)")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.blue)
                                        .frame(width: 20)
                                    
                                    Text(instruction)
                                }
                            }
                        }
                    }
                }
                
                Button(action: markAsCooked) {
                    Label("I've Made This Recipe!", systemImage: "checkmark.circle.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .padding(.top)
            }
            .padding()
        }
        .id(recipe.id)
        .sheet(isPresented: $showingEditSheet) {
            AddEditRecipeView(recipe: recipe)
                .environmentObject(recipeStore)
        }
    }
    
    private func markAsCooked() {
        recipeStore.incrementTimesCooked(for: recipe)
    }
}
