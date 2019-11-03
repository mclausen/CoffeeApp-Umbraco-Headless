//
//  Data.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation

let drinkData:[Drink] = load("drinks.json")

let liveDrinkData:[Drink] = loadLiveData()

func loadLiveData() -> [Drink] {
    let url = URL(string: "https://cdn.umbraco.io/content/d6761444-84d1-4bd8-9522-4a57961e0741/children")!
    // let url = URL(string: "https://postb.in/1572809610728-3325624233111")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("headless-coffee-app", forHTTPHeaderField: "umb-project-alias")
    request.setValue("en-US", forHTTPHeaderField: "Accept-Language")
    request.setValue("appplication/json", forHTTPHeaderField: "Content-type")
    
    var drinks: [Drink] = []
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            fatalError("Error: \(error.localizedDescription)")
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            fatalError("Error: invalid HTTP response code")
        }
        guard let data = data else {
            fatalError("Error: missing response data")
        }
        
        do {
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(Json4Swift_Base.self, from: data)
            
            let embedded = responseModel._embedded!
            let contents = embedded.content!
            
            var drinks: [Drink] = []
            for contentNode in contents {
                //var id = contentNode._id!
                //var name = contentNode.drinkname!
                //var description = contentNode.description;
                //var category = CategoryEnum(rawValue: contentNode.category!)!
                //var imageUrl = contentNode.image!._url!
                //var imageName = ""
                
                var drink : Drink! = Drink()
                drink.id = contentNode._id!
                drink.name = contentNode.drinkname!
                drink.description = contentNode.description!
                drink.imageUrl = contentNode.image!._url!
                let category = CategoryEnum(rawValue: contentNode.category!)
                drink.category = category!
                
                drinks.append(drink)
            }
        }
        catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    task.resume()
    
    
    return drinks;
}

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
