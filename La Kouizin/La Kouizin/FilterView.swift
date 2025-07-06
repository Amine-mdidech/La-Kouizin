//
//  FilterView.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct FilterView: View {
    @Binding var filter: RecipeFilter
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section("Category") {
                Picker("Category", selection: $filter.category) {
                    Text("All Categories").tag(Recipe.RecipeCategory?.none)
                    ForEach(Recipe.RecipeCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(Recipe.RecipeCategory?.some(category))
                    }
                }
            }
            
            Section("Difficulty") {
                Picker("Difficulty", selection: $filter.difficulty) {
                    Text("All Difficulties").tag(Recipe.Difficulty?.none)
                    ForEach(Recipe.Difficulty.allCases, id: \.self) { difficulty in
                        Text(difficulty.rawValue).tag(Recipe.Difficulty?.some(difficulty))
                    }
                }
            }
            
            Section("Cooking Time") {
                HStack {
                    Text("Maximum time (minutes)")
                    Spacer()
                    TextField("No limit", value: $filter.maxCookingTime, format: .number)
                        .frame(width: 80)
                }
            }
            
            Section("Experience") {
                HStack {
                    Text("Minimum times cooked")
                    Spacer()
                    TextField("Any", value: $filter.minTimesCooked, format: .number)
                        .frame(width: 80)
                }
            }
        }
        .formStyle(.grouped)
        .navigationTitle("Filters")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Done") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button("Clear All Filters") {
                    filter = RecipeFilter()
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct FilterSummaryView: View {
    let filter: RecipeFilter
    let onClearFilter: () -> Void
    
    var hasActiveFilters: Bool {
        filter.category != nil || filter.difficulty != nil ||
        filter.maxCookingTime != nil || filter.minTimesCooked != nil
    }
    
    var body: some View {
        if hasActiveFilters {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let category = filter.category {
                        FilterChip(text: category.rawValue, onRemove: onClearFilter)
                    }
                    
                    if let difficulty = filter.difficulty {
                        FilterChip(text: difficulty.rawValue, onRemove: onClearFilter)
                    }
                    
                    if let maxTime = filter.maxCookingTime {
                        FilterChip(text: "≤ \(maxTime) min", onRemove: onClearFilter)
                    }
                    
                    if let minCooked = filter.minTimesCooked {
                        FilterChip(text: "≥ \(minCooked)x cooked", onRemove: onClearFilter)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct FilterChip: View {
    let text: String
    let onRemove: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
                .font(.caption)
            
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(16)
    }
}
