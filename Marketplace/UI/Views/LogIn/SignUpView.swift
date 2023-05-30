//
//  SignUpView.swift
//  Marketplace
//
//  Created by CESI on 07/11/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var signUpVM = SignUpViewModel()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private func makeHeader() -> some View {
        
        Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                }) {
            
            HStack{
                
                Image(systemName: "chevron.backward")
                    .foregroundColor(.secondaryColor)
                    .padding(.leading, 20)
                
                Text("Inscription")
                    .font(.nunitoBold(20))
                    .foregroundColor(.secondaryColor)
                    .padding([.top, .bottom, .trailing], 20)
                    .frame(alignment: .topLeading)
                
                Spacer()
                
            } //HStack
        } //Button
    } //func
    
    var body: some View {
                
        VStack{
                    
            makeHeader()
                    
            ScrollView{
                        
                ReusableTextField(hint: $signUpVM.firstName, icon: nil, title: "Prénom", fieldName: "Prénom").textContentType(.oneTimeCode)
                        
                ReusableTextField(hint: $signUpVM.lastName  , icon: nil, title: "Nom", fieldName: "Nom").textContentType(.oneTimeCode)
                        
                ReusableTextField(hint: $signUpVM.email, icon: nil, title: "E-mail", fieldName: "E-mail").textContentType(.oneTimeCode)
                        
                ReusableSecureField(hint: $signUpVM.password, icon: nil, title: "Mot de passe", fieldName: "Entrez votre mot de passe").textContentType(.oneTimeCode)
                        
                ReusableSecureField(hint: $signUpVM.confirmPwd, icon: nil, title: "Confirmation mot de passe", fieldName: "Confirmez votre mot de passe").textContentType(.oneTimeCode)
                    
                
                TextButton(text: "Continuer", isLoading: signUpVM.isLoading, onClick: {
                    signUpVM.signUp()
                }, buttonColor: .secondaryColor, textColor: .mainColor)
                
                Spacer()
                        
            } //ScrollView
                    
        }.background(Color.mainColor)
         .cornerRadius(20, corners: [.topLeft, .topRight])
         .ignoresSafeArea()
         .navigationBarHidden(true)

    } //body
} //struct SignUpView

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE")
        SignUpView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")

    }
}
