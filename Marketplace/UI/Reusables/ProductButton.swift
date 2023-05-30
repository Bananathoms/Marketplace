//
//  ProductButton.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductButton: View {
    
    let name: String
    let price: Float
    let url: URL?
    
    @State var fav: Bool = false
    
    var body: some View {
        VStack{
            WebImage(url: url)
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(width: 160, height: 160)
                .cornerRadius(10)
            
            HStack{
    
                Text(String(format: "%.2f €", price))
                    .font(.nunitoBold(15))
                    .foregroundColor(.secondaryColor)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                Spacer()
                
                Button {
                    self.fav.toggle()
                } label: {
                    Image(systemName: self.fav == true ? "heart.fill" : "heart")
                        .foregroundColor(.secondaryColor)
                        .padding(.trailing, 10)
                }
            }
            
            HStack{
                Text(name)
                    .font(.nunitoRegular(15))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondaryColor)
                    .padding(.leading, 10)
                Spacer()
            }
            Spacer()
        }.frame(width: 170, height: 240)    }
}

//struct ProductButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductButton(name: "test", price: 10, url: URL(string: "https:/\/parsefiles.back4app.com/68cTQsEsi3V3iw5kOgert4Frq4QRtYLTjreAEK53/90910a6bb2833f189459493d8dd664ed_women1.jpg")!)
//    }
//}
