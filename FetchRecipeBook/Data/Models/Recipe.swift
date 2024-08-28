//
//  Recipe.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

struct Recipe: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let ingredients: [Ingredient]
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: Bool?
    let dateModified: String?
    
    struct Ingredient: Decodable {
        var name: String
        var measurement: String
    }
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decode(String.self, forKey: .strYoutube)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        strCreativeCommonsConfirmed = try container.decodeIfPresent(Bool.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
        var ingredientsArray: [Ingredient] = []
        for i in 1...20 {
            if let ingredient = try container.decodeIfPresent(String.self, forKey: CodingKeys(stringValue: "strIngredient\(i)")!)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient.isEmpty,
               let measure = try container.decodeIfPresent(String.self, forKey: CodingKeys(stringValue: "strMeasure\(i)")!)?.trimmingCharacters(in: .whitespacesAndNewlines), !measure.isEmpty {
                ingredientsArray.append(Ingredient(name: ingredient, measurement: measure))
            }
        }
        ingredients = ingredientsArray
        print(ingredients)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(idMeal, forKey: .idMeal)
        try container.encode(strMeal, forKey: .strMeal)
        try container.encode(strDrinkAlternate, forKey: .strDrinkAlternate)
        try container.encode(strCategory, forKey: .strCategory)
        try container.encode(strArea, forKey: .strArea)
        try container.encode(strInstructions, forKey: .strInstructions)
        try container.encode(strMealThumb, forKey: .strMealThumb)
        try container.encode(strTags, forKey: .strTags)
        try container.encode(strYoutube, forKey: .strYoutube)
        try container.encode(strSource, forKey: .strSource)
        try container.encode(strImageSource, forKey: .strImageSource)
        try container.encode(strCreativeCommonsConfirmed, forKey: .strCreativeCommonsConfirmed)
        try container.encode(dateModified, forKey: .dateModified)
        
        for (index, ingredient) in ingredients.enumerated() {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(index + 1)")!
            let measureKey = CodingKeys(stringValue: "strMeasure\(index + 1)")!
            
            try container.encode(ingredient.name, forKey: ingredientKey)
            try container.encode(ingredient.measurement, forKey: measureKey)
        }
    }

}

