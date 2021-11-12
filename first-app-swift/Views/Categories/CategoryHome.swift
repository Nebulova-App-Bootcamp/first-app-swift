//
//  CategoryHome.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 10/11/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationView{
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 210)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .navigationTitle("Paisajes")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
