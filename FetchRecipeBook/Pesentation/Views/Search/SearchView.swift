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
                if let meals = viewModel.meals {
                    ForEach(meals, id: \.self) { meal in
                        VStack() {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .overlay(
                                        ZStack(alignment: .bottomLeading) {
                                            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                                            VStack() {
                                                Text(meal.strMeal)
                                                    .foregroundStyle(.white)
                                                    .padding()
                                                ForEach(0..<5) { num in
                                                    Image(systemName: "star.fill")
                                                        .foregroundStyle(.yellow)
                                                }
                                            }
                                        }
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .clipped()
                                    .shadow(radius: 10)
                            } placeholder: {
                                ZStack() {
                                    ProgressView()
                                    RoundedRectangle(cornerRadius: 25)
                                        .shadow(radius: 10)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.greenWhite)
        .toolbarBackground(Color.greenWhite)
        .toolbar() {
            ToolbarItem(placement: .principal) {
                TextField(
                    "Recipe ID...",
                    text: $searchField
                )
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
            }
        }
        .onAppear() {
            viewModel.fetchRecipesFilterCategory(filter: "\(searchField)")
        }
    }
}
