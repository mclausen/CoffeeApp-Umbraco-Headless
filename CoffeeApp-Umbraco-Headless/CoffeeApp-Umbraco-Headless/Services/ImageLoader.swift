//
//  ImageLoader.swift
//  CoffeeApp-Umbraco-Headless
//
//  Created by Martin Humlund Clausen on 23/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var downloadedImage:UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url : String){
        
        print(url)
        
        guard let imageUrl = URL(string: url) else {
            fatalError("ImageUrl is not correct")
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            
            
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
                self.didChange.send(self)
            }
            
        }.resume()
    }
}
