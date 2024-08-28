//
//  RecipePreview.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

struct RecipePreview: Decodable, Hashable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
