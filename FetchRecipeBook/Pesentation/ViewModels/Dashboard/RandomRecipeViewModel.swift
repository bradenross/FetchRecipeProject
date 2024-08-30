//
//  RandomRecipeViewModel.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import Foundation

@MainActor
class RandomRecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    
    init() {
        fetchRecipe()
    }
    
    func fetchRecipe() {
        Task {
            do {
                let rec = try await APIService().fetchRandomRecipe()
                recipe = rec
            } catch {
                let error = error.localizedDescription
            }
        }
    }
}
