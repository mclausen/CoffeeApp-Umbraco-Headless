//
//  DrinkRow.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    
    var category:String
    var drinks:[Drink]
    
    init(category:String, drinks:[Drink]){
        self.drinks = drinks
        self.category = category
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(category)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top) {
                    ForEach(self.drinks, id: \.name) { drink in
                        NavigationLink(destination: DrinkDetail(drink: drink)){
                            DrinkItem(drink: drink)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                           
                    }
                }
            })
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(category: "HOT DRINKS", drinks: drinkData)
    }
}
