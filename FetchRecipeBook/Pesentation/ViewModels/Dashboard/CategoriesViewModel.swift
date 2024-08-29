//
//  CategoriesViewModel.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

@MainActor
class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category]?
    @Published var errorMessage: String?

    func fetchCategories() {
        Task {
            do {
                let categories = try await APIService.shared.fetchCategories()
                self.categories = categories
            } catch {
                errorMessage = error.localizedDescription
                print(errorMessage!)
            }
        }
    }
}
