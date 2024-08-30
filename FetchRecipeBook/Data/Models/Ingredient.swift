//
//  Ingredient.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/29/24.
//

import Foundation

struct Ingredient: Decodable, Hashable {
    var name: String
    var measurement: String
}
