//
//  SelectButton.swift
//  Marketplace
//
//  Created by CESI on 21/11/2022.
//

import SwiftUI

struct SelectButton: View {
    
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(isSelected ? color: .gray)
            Text(text)
                .foregroundColor(.secondaryColor)
        }.frame(width: 60, height: 40)
            .shadow(radius: 5)
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isSelected: .constant(true), color: .gray
                    , text: "XS")
    }
}
