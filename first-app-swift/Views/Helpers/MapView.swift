//
//  MapView.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 8/11/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    /*
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8)
    )
     */
    
    var coordinate: CLLocationCoordinate2D

    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
        
    @State private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
         center: coordinate, span: MKCoordinateSpan(
            latitudeDelta: 0.8, longitudeDelta: 0.8)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868))
    }
}
