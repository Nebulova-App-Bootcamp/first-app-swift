//
//  ModelData.swift
//  first-app-swift
//
//  Created by Jose Manuel Barba Sánchez on 5/11/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
  @Published var scenaries: [Scenary] = load("data.json")
    
  var categories: [String: [Scenary]]{
        Dictionary(
            grouping: scenaries,
            by:{ $0.category.rawValue } )
   }
    
    var features: [Scenary] {
        scenaries.filter{ $0.isFeatured }
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("No ha sido posible encontrar el archivo \(filename)")
    }
    do {
        data = try Data(contentsOf: file)
        
    } catch {
        fatalError("No es posible cargar el archivo \(filename)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("No se posible parsear \(filename)")
    }
}

