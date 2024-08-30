//
//  InstructionsView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/29/24.
//

import SwiftUI

struct InstructionsView: View {
    var instructions: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Text(instructions)
        }
        
    }
}
