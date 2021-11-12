//
//  FeaturedCard.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 12/11/21.
//

import SwiftUI

struct FeaturedCard: View {
    var scenery : Scenary
    
    var body: some View {
        scenery.featureImage?
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay{
                TextOverlay(scenery: scenery)
            }
    }
}

struct TextOverlay: View {
    var scenery: Scenary
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.7), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading){
                Text(scenery.name)
                    .font(.title)
                    .bold()
                Text(scenery.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(scenery: ModelData().features[0])
    }
}
