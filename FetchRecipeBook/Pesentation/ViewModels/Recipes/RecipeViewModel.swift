//
//  RecipeViewModel.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    @Published var errorMessage: String?
    private var recipeId: String?
    
    init(recipeId: String) {
        self.recipeId = recipeId
        fetchRecipe(recipeId: recipeId)
    }

    func fetchRecipe(recipeId: String) {
        Task {
            do {
                let recipe = try await APIService.shared.fetchRecipe(recipeId: recipeId)
                self.recipe = recipe
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
