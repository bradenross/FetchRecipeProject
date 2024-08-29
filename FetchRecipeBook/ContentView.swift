//
//  ContentView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack() {
                DashboardView()
            }
            .tint(Color.black)
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
