//
//  RecipeRepository.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

protocol RecipeRepository {
    func getRecipe() async throws -> Recipe
}
