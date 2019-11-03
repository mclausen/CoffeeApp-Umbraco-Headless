//
//  Data.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation

let drinkData:[Drink] = load("drinks.json")

func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    let data:Data;
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Could not find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Could not find \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder();
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(filename) as \(T.self):\n\(error)")
    }
}
