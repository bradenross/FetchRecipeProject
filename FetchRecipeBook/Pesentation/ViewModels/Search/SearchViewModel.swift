//
//  SearchViewModel.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var meals: [RecipePreview]?
    @Published var errorMessage: String?
    var category: String = ""

    func fetchRecipesFilterCategory(filter: String) {
        Task {
            do {
                let meals = try await APIService.shared.fetchFilteredByCategory(category: filter)
                self.meals = meals
                print(meals)
            } catch {
                errorMessage = error.localizedDescription
                print(errorMessage)
            }
        }
    }
}
