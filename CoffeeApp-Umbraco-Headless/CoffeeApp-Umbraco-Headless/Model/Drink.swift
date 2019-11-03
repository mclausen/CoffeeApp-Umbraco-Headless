//
//  Drink.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation
struct Drink : Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    var imageName:String
    var category:Category
    var description:String
    
    enum Category : String, CaseIterable, Codable, Hashable {
        case hot = "hot"
        case cold = "cold"
    }
}
