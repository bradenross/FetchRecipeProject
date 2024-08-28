//
//  FetchRecipeUseCase.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

protocol FetchRecipeUseCase {
    func execute() async throws -> Recipe
}

class FetchRecipeUseCaseImpl: FetchRecipeUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func execute() async throws -> Recipe {
        return try await recipeRepository.getRecipe()
    }
}
