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
    var filter: String = ""

    func fetchRecipesFilterCategory(filter: String) {
        Task {
            do {
                var filterHasNumbers = (filter.rangeOfCharacter(from: .decimalDigits)) != nil
                if(filterHasNumbers) {
                    let meals = try await APIService().fetchRecipe(recipeId: filter)
                    self.meals = [RecipePreview(strMeal: meals.strMeal, strMealThumb: meals.strMealThumb, idMeal: meals.idMeal)]
                } else {
                    self.filter = filter.uppercased()
                    let meals = try await APIService().fetchFilteredByCategory(category: filter)
                    self.meals = meals
                }
            } catch {
                errorMessage = error.localizedDescription
                print(error)
            }
        }
    }
}
