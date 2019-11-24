//
//  DrinkImageView.swift
//  CoffeeApp-Umbraco-Headless
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import SwiftUI

struct DrinkImageView: View {
    var placeholder : Image
    
    @ObservedObject private var imageLoader = ImageLoader()
    init(url: String, placeholder: Image = Image("placeholder")){
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
        if let uiImage = self.imageLoader.downloadedImage{
            return Image(uiImage: uiImage)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
        } else {
            return self.placeholder
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct DrinkImageView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkImageView(url: drinkData[1].imageUrl, placeholder: Image("placeholder"))
    }
}
