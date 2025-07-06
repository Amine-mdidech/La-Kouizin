//
//  Untitled.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI
import SwiftData
import Foundation

@Model
final class Recipe: Identifiable {
    var id = UUID()
    var title: String
    var shortDescription: String
    var fullDescription: String
    var ingredients: [String]
    var instructions: [String]
    var category: RecipeCategory
    var difficulty: Difficulty
    var nationality: Country?
    var cookingTime: Int?
    var youtubeURL: String?
    var timesCooked: Int = 0
    var dateCreated: Date = Date()
    
    enum Difficulty: String, CaseIterable, Codable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        case hardcore = "Hardcore"
    }
    
    enum RecipeCategory: String, CaseIterable, Codable {
        case breakfast = "Breakfast"
        case Meal = "Meal"
        case dessert = "Dessert"
        case snack = "Snack"
        case beverage = "Beverage"
        case fastMeal = "Fast Meal"
        case Ferment = "Fermentation and Cheese making"
        case unknown = "Unknown"
    }
    
    init(title: String,
         shortDescription: String,
         fullDescription: String,
         ingredients: [String],
         instructions: [String],
         category: RecipeCategory,
         difficulty: Difficulty,
         cookingTime: Int,
         youtubeURL: String? = nil,
         timesCooked: Int = 0) {
            self.id = UUID()
            self.title = title
            self.shortDescription = shortDescription
            self.fullDescription = fullDescription
            self.ingredients = ingredients
            self.instructions = instructions
            self.category = category
            self.difficulty = difficulty
            self.cookingTime = cookingTime
            self.youtubeURL = youtubeURL
            self.timesCooked = timesCooked
        }
}
