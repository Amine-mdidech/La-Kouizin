//
//  RecipeFilter.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import Foundation

struct RecipeFilter {
    var category: Recipe.RecipeCategory?
    var difficulty: Recipe.Difficulty?
    var maxCookingTime: Int?
    var minTimesCooked: Int?
    var searchText: String = ""
}
