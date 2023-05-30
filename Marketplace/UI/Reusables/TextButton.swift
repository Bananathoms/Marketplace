//
//  TextButton.swift
//  Marketplace
//
//  Created by CESI on 04/11/2022.
//

import SwiftUI

struct TextButton: View {
    
    let text: String
    let isLoading: Bool
    let onClick: () -> Void
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        
        Button(action: {onClick()}) {

            if isLoading {
                ProgressView().tint(Color.mainColor)
            }else {
                Text("\(text)")
                    .font(.headline)
                    .foregroundColor(textColor)
                    
            }

        }.frame(width: 170, height: 50)
            .background(buttonColor)
            .cornerRadius(40.0)
        .padding(20)
        .disabled(isLoading)
    }
}

//struct TextButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TextButton(text: "se connecter")
//            .previewDevice("iPhone SE (3rd generation)")
//            .previewDisplayName("iPhone SE")
//        TextButton(text: "se connecter")
//            .previewDevice("iPhone 14 Pro")
//.previewDisplayName("iPhone 14 Pro")
//
//  }
//}
