//
//  CategoriesView.swift
//  FetchRecipeBook
//
//  Created by Braden Ross on 8/28/24.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var categoriesViewModel = CategoriesViewModel()
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: Sizes.categorySpacing) {
                    ForEach(categoriesViewModel.categories ?? [], id: \.self) { category in
                        NavigationLink(destination: SearchView(searchField: category.strCategory.uppercased())) {
                            VStack() {
                                AsyncImage(url: URL(string: category.strCategoryThumb)) {image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ZStack(){
                                        ProgressView()
                                    }
                                    .frame(maxWidth: Sizes.categoryImageHeight, maxHeight: Sizes.categoryImageHeight)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.gray)
                                    )
                                }
                                .frame(maxWidth: Sizes.categoryImageHeight, maxHeight: Sizes.categoryImageHeight)
                                Text("\(category.strCategory)")
                                    .font(.system(size: 13))
                                    .fontWeight(.regular)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: Sizes.categoriesHeight)
            }
        }
        .onAppear() {
            categoriesViewModel.fetchCategories()
        }
    }
}
