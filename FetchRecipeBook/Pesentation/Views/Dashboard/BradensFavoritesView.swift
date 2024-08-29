//
//  BradensFavoritesView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import Foundation
import SwiftUI

struct BradensFavoritesView: View {
    @StateObject private var viewModel: BradensFavoritesViewModel = BradensFavoritesViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Braden's Favorites")
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(viewModel.recipes, id: \.self) { recipe in
                        NavigationLink(destination: RecipeView(recipeId: recipe.idMeal)) {
                            VStack() {
                                AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                                    image
                                        .image?.resizable()
                                        .frame(maxWidth: 130, maxHeight: 130)
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .clipped()
                                }
                                Text("\(recipe.strMeal)")
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                Text("\(recipe.strCategory ?? "")")
                                    .foregroundStyle(.gray)
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                                    .font(.system(size: 11))
                                    .fontWeight(.regular)
                            }
                            .frame(maxWidth: 130
                            )
                            .background(.white)
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}
