//
//  APIService.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    private let baseUrl = "https://themealdb.com/api/json/v1/1"
    
    func fetchRecipe() async throws -> Recipe {
        guard let url = URL(string: "\(baseUrl)/lookup.php?i=52771") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode([String: [Recipe]].self, from: data)
        
        guard let recipes = recipeResponse["meals"]?.first else {
            throw URLError(.cannotParseResponse)
        }
        
        return recipes
    }
    
    func fetchCategories() async throws -> [Category] {
        guard let url = URL(string: "\(baseUrl)/categories.php") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode([String: [Category]].self, from: data)
        
        guard let categories = recipeResponse["categories"] else {
            throw URLError(.cannotParseResponse)
        }
        
        return categories
    }
    
    func fetchFilteredByCategory(category: String) async throws -> [RecipePreview] {
        guard let url = URL(string: "\(baseUrl)/filter.php?c=\(category)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode([String: [RecipePreview]].self, from: data)
        
        guard let recipes = recipeResponse["meals"] else {
            throw URLError(.cannotParseResponse)
        }
        
        return recipes
    }
    
    
}

