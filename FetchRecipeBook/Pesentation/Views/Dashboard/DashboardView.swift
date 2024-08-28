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
                CategoriesView()
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
