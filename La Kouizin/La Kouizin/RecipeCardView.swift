//
//  RecipeCardView.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct RecipeCardView: View {
    @Bindable var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(recipe.category.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
                
                if recipe.timesCooked > 0 {
                    Label("\(recipe.timesCooked)", systemImage: "checkmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
            
            // Title
            Text(recipe.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.primary)
            
            // Description
            Text(recipe.shortDescription)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            // Footer Info
            HStack {
                Label("\(recipe.cookingTime ?? 0) min", systemImage: "clock")
                    .font(.caption2)
                
                Spacer()
                
                Text(recipe.difficulty.rawValue)
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(difficultyColor(recipe.difficulty).opacity(0.2))
                    .cornerRadius(4)
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
    
    private func difficultyColor(_ difficulty: Recipe.Difficulty) -> Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .yellow
        case .hard: return .orange
        case .hardcore: return .red
        }
    }
}
