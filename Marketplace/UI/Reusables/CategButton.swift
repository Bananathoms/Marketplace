//
//  CategButton.swift
//  Marketplace
//
//  Created by CESI on 14/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategButton: View {
    
    let text: String
    let url: URL
    
    var body: some View {
        
            ZStack{
                //Affichage de l'image issue de l'API
                WebImage(url: url)
                    .resizable()
                    .scaledToFill()
                
                //Filtre pour assombrir l'image
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.3)
                
                //Nom des catégories
                Text("\(text)")
                    .font(.nunitoBold(30))
                    .foregroundColor(.white)
                    
            }.frame(width: 330, height: 180)
                .background(Color.secondaryColor)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.bottom, 20.0)
          
    }
}

struct CategButton_Previews: PreviewProvider {
    static var previews: some View {
        CategButton(text: "Femmes", url: URL(string: "https://parsefiles.back4app.com/68cTQsEsi3V3iw5kOgert4Frq4QRtYLTjreAEK53/90910a6bb2833f189459493d8dd664ed_women1.jpg")! )
    }
}

