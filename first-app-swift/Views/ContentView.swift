//
//  ContentView.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//

import SwiftUI

/*extension Image {
    func imageModifier () -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.pink)
            .opacity(0.6)
    }
    

}*/

struct ContentView: View {
    //private let imageUrl: String = "https://picsum.photos/250?image=12"
    
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case favourites
    }
    
    
    var body: some View {
        //MARK: - 1. URL
    
        //AsyncImage(url: URL(string: imageUrl), scale: 0.7)
        
        //MARK: - 2. SOURCE IMAGE
        //Image("source-academy")
        
        //MARK: - 3. PLACEHOLDER
        
        /*
        
        AsyncImage(url: URL(string: imageUrl)) {
            image in image.imageModifier()
        }placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
    }
         */
        
        //MARK: - 4. PHASE
        /*AsyncImage(url: URL(string: imageUrl)){
            phase in
            //SUCCESS: the image successfully loaded
            //FAILURE: the image failed to load with an error
            //EMPTY: No image is loaded
            
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
                
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
            
        }.padding(40)
        */
        //MARK: - 5. ANIMATION
        
        /*VStack(alignment: .leading) {
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
                
        }*/
        
        
        
        
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Destacados", systemImage: "star")
                }
                .tag(Tab.featured)
            SceneryList()
                .tabItem{
                    Label("Favoritos", systemImage: "list.bullet")
                }
                .tag(Tab.favourites)
        }
                
        
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
}
