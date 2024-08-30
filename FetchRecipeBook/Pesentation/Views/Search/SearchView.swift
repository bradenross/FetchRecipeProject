//
//  SearchView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State var searchField: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack() {
            ScrollView() {
                VStack() {
                    if let meals = viewModel.meals {
                        ForEach(meals, id: \.self) { meal in
                            NavigationLink(destination: RecipeView(recipeId: meal.idMeal)) {
                                HStack() {
                                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 90, maxHeight: 90)
                                    } placeholder: {
                                            ProgressView()
                                            .frame(maxWidth: 90, maxHeight: 90)
                                    }
                                    .frame(maxWidth: 90, maxHeight: 90)
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(meal.strMeal)
                                            .foregroundStyle(.black)
                                            .fontWeight(.medium)
                                            .truncationMode(.tail)
                                            .multilineTextAlignment(.leading)
                                        HStack() {
                                            ForEach(0..<5) { num in
                                                Image(systemName: "star.fill")
                                                    .foregroundStyle(.yellow)
                                            }
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding(.horizontal)
                                }
                                .background(
                                    .white
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .clipped()
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.whiteGreen)
        .toolbarBackground(Color.whiteGreen)
        .toolbar() {
            ToolbarItem(placement: .principal) {
                TextField(
                    "Recipe ID or Category...",
                    text: $searchField
                )
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
                .onSubmit {
                    viewModel.fetchRecipesFilterCategory(filter: searchField)
                }
            }
        }
        .onAppear() {
            viewModel.fetchRecipesFilterCategory(filter: "\(searchField)")
        }
    }
}
