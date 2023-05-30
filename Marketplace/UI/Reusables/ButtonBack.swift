//
//  ButtonBack.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import SwiftUI

struct ButtonBack: View {

    let title: String
    let size: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                VStack{
                    HStack{
                        
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.secondaryColor)
                        
                        Text(title)
                            .font(.nunitoBold(size))
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }.foregroundColor(.secondaryColor)
                        .padding(.leading, 20)
                        .frame(alignment: .topLeading)
                }
            }
        }
    }

struct ButtonBack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBack(title: "test", size: 30)
    }
}
