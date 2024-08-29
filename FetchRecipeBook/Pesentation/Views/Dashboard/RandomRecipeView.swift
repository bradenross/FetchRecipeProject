//
//  RandomRecipeView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import SwiftUI

struct RandomRecipeView: View {
    @StateObject private var viewModel = RandomRecipeViewModel()
    var body: some View {
        VStack() {
            HStack() {
                Text("Random Recipe")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    viewModel.fetchRecipe()
                }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
            NavigationLink(destination: RecipeView(recipeId: viewModel.recipe?.idMeal ?? "")) {
                ZStack(alignment: .leading) {
                    AsyncImage(url: URL(string: viewModel.recipe?.strMealThumb ?? "")) { image in
                        image.image?
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 800)
                            .aspectRatio(contentMode: .fill)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.7)]), startPoint: .center, endPoint: .bottom)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .clipped()
                    }
                    VStack(alignment: .leading) {
                        Text(viewModel.recipe?.strCategory ?? "")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black.opacity(0.5))
                            )
                        Spacer()
                        Text(viewModel.recipe?.strMeal ?? "")
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    }
                    .padding()
                }
                .padding()
            }
        }
    }
}
