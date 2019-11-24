//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var drinksListing:DrinksListingViewModel = DrinksListingViewModel()
            
    var body: some View {
       NavigationView{
            List (drinksListing.categorizedDrinks.keys.sorted(), id: \String.self){ key in
                DrinkRow(category: "\(key) Drinks".uppercased(), drinks: self.drinksListing.categorizedDrinks[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .navigationBarTitle(Text("Coffee Library"))
            .buttonStyle(PlainButtonStyle())
            .onAppear(perform: drinksListing.loadLiveData)
        }
    }
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(drinksListing: DrinksListingViewModel())
    }
}
