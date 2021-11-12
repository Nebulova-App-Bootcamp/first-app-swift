//
//  TextView.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//


import SwiftUI

struct SceneryRow: View {
    
    var scenary: Scenary
    
    var body: some View {
        HStack {
            scenary.image
                .resizable()
                .frame(width:  50, height: 50)
            Text(scenary.name)
            Spacer()
            
            if scenary.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct SceneryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SceneryRow(scenary: ModelData().scenaries[3])
            SceneryRow(scenary: ModelData().scenaries[4])
            SceneryRow(scenary: ModelData().scenaries[5])
              
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
