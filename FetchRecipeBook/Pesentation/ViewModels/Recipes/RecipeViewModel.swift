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

    func fetchRecipe() {
        Task {
            do {
                let recipe = try await APIService.shared.fetchRecipe()
                self.recipe = recipe
                print(recipe)
            } catch {
                errorMessage = error.localizedDescription
                print(errorMessage)
            }
        }
    }
}
