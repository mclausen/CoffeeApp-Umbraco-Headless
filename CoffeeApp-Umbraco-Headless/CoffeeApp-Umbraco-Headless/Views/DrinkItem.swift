//
//  DrinkItem.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import SwiftUI

struct DrinkItem: View {
    
    var drink:Drink
    init(drink:Drink) {
        self.drink = drink
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            DrinkImageView(url: drink.imageUrl, placeholder: Image("placeholder"))
           
            VStack(alignment: .leading){
                Text(drink.name)
                    .font(.headline)
                    .foregroundColor(Color.primary)
                
                Text(drink.description)
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
            
        }
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItem(drink: drinkData[0])
    }
}
