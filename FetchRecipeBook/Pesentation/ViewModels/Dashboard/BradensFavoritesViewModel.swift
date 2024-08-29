//
//  BradensFavoritesViewModel.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import Foundation
import SwiftUI

@MainActor
class BradensFavoritesViewModel: ObservableObject {
    let favoriteIds = ["52859", "53016", "52959", "52839", "52952", "52796", "52965", "52917"]
    @Published var recipes: [Recipe] = []
    
    init() {
        fetchRecipePreviews()
    }
    
    func fetchRecipePreviews() {
        Task {
            do {
                for id in self.favoriteIds {
                    let recipe = try await APIService().fetchRecipe(recipeId: id)
                    recipes.append(recipe)
                }
            } catch {
                let errorMessage = error.localizedDescription
                print(errorMessage)
            }
        }
    }
}
