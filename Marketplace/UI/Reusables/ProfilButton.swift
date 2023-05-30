//
//  ProfilButon.swift
//  Marketplace
//
//  Created by CESI on 15/11/2022.
//

import SwiftUI

struct ProfilButton: View {
    
    let icon: String
    let text: String
    
    var body: some View {
        
        Button {
            print("test")
        } label: {
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.secondaryColor)
                        .cornerRadius(10)
                    Image(systemName: "\(icon)")
                        .foregroundColor(.mainColor)
                }
                .padding(.leading, 30.0)
                
                Text("\(text)")
                    .font(.nunitoRegular(20))
                    .foregroundColor(.secondaryColor)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondaryColor)
                    .padding(.trailing, 20.0)
            }
        }
    }
}

struct ProfilButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfilButton(icon: "at", text: "test")
    }
}
