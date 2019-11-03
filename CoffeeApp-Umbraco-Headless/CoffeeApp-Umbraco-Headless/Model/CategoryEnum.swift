//
//  CategoryEnum.swift
//  CoffeeApp-Umbraco-Headless
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation

enum CategoryEnum : String, CaseIterable, Codable, Hashable {
    case def = "default"
    case hot = "Hot"
    case cold = "Cold"
}
