//
//  Drink.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation
struct Drink : Hashable, Codable, Identifiable {
    var id:String
    var name:String
    var imageName:String
    var imageUrl:String
    var category:CategoryEnum
    var description:String
    
    init() {
        id = ""
        name = ""
        imageName = ""
        imageUrl = ""
        category = CategoryEnum.def
        description = ""
    }
}
