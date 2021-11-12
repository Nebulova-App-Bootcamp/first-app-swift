//
//  CategoryItem.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 10/11/21.
//

import SwiftUI

struct CategoryItem: View {
    var scenery: Scenary
    var body: some View {
        VStack(alignment: .leading) {
            scenery.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            Text(scenery.name)
                .foregroundColor(.primary)
                .font(.subheadline)
        }
        .padding(.leading, 17)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(scenery: ModelData().scenaries[0])
    }
}
