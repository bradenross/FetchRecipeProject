//
//  Category.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation

struct Category: Decodable, Hashable {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}
