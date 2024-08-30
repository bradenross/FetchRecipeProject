//
//  IngredientsView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/29/24.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [Ingredient]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            VStack(alignment: .leading) {
                ForEach(ingredients, id: \.name){ ingredient in
                    Text("• \(ingredient.measurement) \(ingredient.name)")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
