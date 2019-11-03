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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(drink.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
           
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
