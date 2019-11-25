//
//  DrinkDetail.swift
//  CoffeeApp
//
//  Created by Martin Humlund Clausen on 03/11/2019.
//  Copyright © 2019 Martin Humlund Clausen. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    
    var drink:Drink
    var placeholder : Image
   
    
    @ObservedObject private var imageLoader = ImageLoader()
    init(drink: Drink, placeholder: Image = Image("placeholder")){
        self.drink = drink
        self.placeholder = placeholder
        self.imageLoader.load(url: drink.imageUrl)
    }
    
    func HeaderImage() -> some View{
        if let uiImage = self.imageLoader.downloadedImage{
            return Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            return self.placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    var body: some View {
        List {
            ZStack(alignment: .bottom, content: {
                HeaderImage()
                
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.25)
                    .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.name)
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
                
            })
            .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading) {
                Text(drink.description)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(12)
                
                HStack {
                    Spacer()
                    OrderButton()
                    Spacer()
                }
                .padding(.top, 50)
            }
            .padding(.top)
            .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

struct OrderButton : View {
    
    @State var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert.toggle()
        }){
            Text("Order now!")
        }
        .frame(width: 200, height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.headline)
        .cornerRadius(10)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData[2])
    }
}
