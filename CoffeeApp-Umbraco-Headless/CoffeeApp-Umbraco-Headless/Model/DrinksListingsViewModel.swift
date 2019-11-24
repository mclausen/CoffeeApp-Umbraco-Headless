//
//  DrinksListingsViewModel.swift
//  CoffeeApp-Umbraco-Headless
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation
import Combine

class DrinksListingViewModel: ObservableObject {
    
    @Published var categorizedDrinks = [String:[Drink]]()
    
    let didChange = PassthroughSubject<[String:[Drink]]?, Never>()
    
    func loadLiveData(){
        let url = URL(string: "https://cdn.umbraco.io/content/d6761444-84d1-4bd8-9522-4a57961e0741/children")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("headless-coffee-app", forHTTPHeaderField: "umb-project-alias")
        request.setValue("en-US", forHTTPHeaderField: "Accept-Language")
        request.setValue("appplication/json", forHTTPHeaderField: "Content-type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.didChange.send(self.categorizedDrinks)
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: invalid HTTP response code")
                DispatchQueue.main.async {
                    self.didChange.send(self.categorizedDrinks)
                }
                return
            }
            guard let data = data else {
                print("Error: missing response data")
                DispatchQueue.main.async {
                    self.didChange.send(self.categorizedDrinks)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseModel = try decoder.decode(Json4Swift_Base.self, from: data)
                
                let embedded = responseModel._embedded!
                let contents = embedded.content!
                
                var _drinks: [Drink] = []
                for contentNode in contents {
                    
                    var newDrink : Drink! = Drink()
                    newDrink.id = contentNode._id!
                    newDrink.name = contentNode.drinkname!
                    newDrink.description = contentNode.description!
                    newDrink.imageUrl = contentNode.image!._url!
                    let category = CategoryEnum(rawValue: contentNode.category!)
                    newDrink.category = category!
                    
                    _drinks.append(newDrink)
                }
                
                
                var categories:[String:[Drink]]{
                    .init(
                        grouping: _drinks,
                        by: {$0.category.rawValue}
                    )
                }
                
                
                DispatchQueue.main.async {
                    self.categorizedDrinks = categories;
                    self.didChange.send(self.categorizedDrinks)
                }
            }
            catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}
