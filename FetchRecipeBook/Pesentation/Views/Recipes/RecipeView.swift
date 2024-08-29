//
//  RecipeView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation
import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel: RecipeViewModel
    
    init(recipeId: String) {
        _viewModel = StateObject(wrappedValue: RecipeViewModel(recipeId: recipeId))
    }
    
    var body: some View {
        VStack {
            ScrollView() {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: viewModel.recipe?.strMealThumb ?? "")) {image in
                        image
                            .resizable()
                            .scaledToFit()
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                            )
                    } placeholder: {
                        ZStack(){
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    Text("\(viewModel.recipe?.strMeal ?? "")")
                        .foregroundStyle(.white)
                }
                VStack() {
                    Text(viewModel.recipe?.idMeal ?? "")
                    VStack(alignment: .leading) {
                        ForEach(viewModel.recipe?.ingredients ?? [], id: \.name){ ingredient in
                            Text("• \(ingredient.measurement) \(ingredient.name)")
                        }
                    }
                    if(viewModel.recipe?.strYoutube != nil) {
                        Text("[Video Link](\(viewModel.recipe?.strYoutube ?? ""))")
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .ignoresSafeArea()
        .padding()
    }
}
