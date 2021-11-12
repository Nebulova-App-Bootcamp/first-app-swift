//
//  CircleImage.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//

import SwiftUI

extension Image {
    func imageModifier () -> some View {
        self
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 20)
        
        
            /*.resizable()
            .scaledToFit()
            .clipShape(Circle())

            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .frame(width: 400, height: 400)

            .shadow(radius: 7)*/
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128, maxHeight: 128)
            .foregroundColor(.pink)
            .opacity(0.6)
    }
    

}


struct CircleImage: View {
    var image: Image

    /*private let imageUrl: String = "https://picsum.photos/250?image=12"*/
    var body: some View {
       /* VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.3))) { phase in switch phase {
            case .success(let image):
                image
                    .imageModifier()
                    // .transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
                    
            }.padding(45)
                
        }

    }*/
        
    image
        .imageModifier()
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: ModelData().scenaries[4].image)
        
    }
}
