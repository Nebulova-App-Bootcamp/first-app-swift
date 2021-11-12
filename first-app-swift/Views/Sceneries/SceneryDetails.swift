//
//  SceneryDetails.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//

import SwiftUI

struct SceneryDetails: View {
    @EnvironmentObject var modelData: ModelData
    var scenery: Scenary
    
    var sceneryIndex: Int {
        modelData.scenaries.firstIndex(where: {$0.id == scenery.id})!
    }
    
    
    var body: some View {
      VStack{
            MapView(coordinate: scenery.locationCoordinate)
                .ignoresSafeArea(.container, edges: .top)
                .frame(height: 300, alignment: .top)

            CircleImage(image: scenery.image)
                .offset(y: -200)
                .padding(.bottom, -200)
            VStack(alignment: .leading){
                HStack {
                    Text(scenery.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.scenaries[sceneryIndex].isFavorite)
                }
                HStack {
                    Text(scenery.park)
                    Spacer()
                    Text(scenery.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                ScrollView {
                    Text("Curiosidades de \(scenery.name)")
                        .font(.title2)
                    Text(scenery.description)
                }
                
            }
            .padding()
            Spacer()
        }
       .navigationTitle(scenery.name)
       .navigationBarTitleDisplayMode(.inline)
                
    }
}

struct SceneryDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SceneryDetails(scenery: ModelData().scenaries[0])
            .environmentObject(modelData)
    }
}
