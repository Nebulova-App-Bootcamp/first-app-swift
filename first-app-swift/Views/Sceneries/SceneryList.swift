//
//  SceneryList.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//

import SwiftUI

struct SceneryList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    var filteredSceneries: [Scenary] {
        modelData.scenaries.filter {
            scenery in (!showFavoritesOnly || scenery.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    if showFavoritesOnly == true {
                        Text("Solo favoritos")
                    } else {
                        Text("Todos")
                    }
                        
                }
                
                ForEach(filteredSceneries){
                    scenery in NavigationLink {
                        SceneryDetails(scenery: scenery)
                    } label: {
                        SceneryRow(scenary: scenery)
                    }
                }
            }
            .navigationTitle("Paisajes")
        }
    }
}

struct SceneryList_Previews: PreviewProvider {
    static var previews: some View {
        SceneryList()
            .environmentObject(ModelData())
    }
}

