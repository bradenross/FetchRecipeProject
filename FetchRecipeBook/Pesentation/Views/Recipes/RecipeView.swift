//
//  RecipeView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation
import SwiftUI

struct RecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: RecipeViewModel
    
    init(recipeId: String) {
        _viewModel = StateObject(wrappedValue: RecipeViewModel(recipeId: recipeId))
    }
    
    var body: some View {
        VStack {
            ScrollView() {
                VStack(spacing: 0) {
                    AsyncImage(url: URL(string: viewModel.recipe?.strMealThumb ?? "")) {image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ZStack(){
                            ProgressView()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                        )
                    }
                    VStack() {
                        HStack() {
                            VStack(alignment: .leading) {
                                Text("\(viewModel.recipe?.strMeal ?? "")")
                                    .font(.system(size: 18))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(1)
                                Text("\(viewModel.recipe?.strCategory ?? "") • \(viewModel.recipe?.strArea ?? "")")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                    .foregroundStyle(Color.primaryGreen)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(1)
                            }
                            Spacer()
                            if(viewModel.recipe?.strYoutube != nil) {
                                Link(destination: URL(string: viewModel.recipe?.strYoutube ?? "")!) {
                                    HStack() {
                                        Image(systemName: "play.tv.fill")
                                            .foregroundStyle(Color.primaryGreen)
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .shadow(radius: 5)
                        )
                        IngredientsView(ingredients: viewModel.recipe?.ingredients ?? [])
                            .frame(maxWidth: .infinity)
                        InstructionsView(instructions: viewModel.recipe?.strInstructions ?? "")
                            .padding(.top, 25)
                    }
                    .offset(CGSize(width: 0.0, height: -50.0))
                    .padding()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}
