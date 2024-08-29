//
//  Dashboard.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack() {
            ScrollView() {
                VStack(spacing: 10) {
                    CategoriesView()
                    Divider()
                    BradensFavoritesView()
                    Divider()
                    RandomRecipeView()
                    Divider()
                    Text("Created by [Braden Ross](www.bradenross.me)")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                }
            }
        }
        .navigationTitle("Hungry?")
        .toolbar() {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}) {
                    NavigationLink(destination: SearchView()) {
                        Image(systemName: "magnifyingglass")
                            .padding(8)
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}
