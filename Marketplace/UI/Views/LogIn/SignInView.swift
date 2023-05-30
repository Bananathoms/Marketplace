//
//  SignInView.swift
//  Marketplace
//
//  Created by CESI on 04/11/2022.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var signInVM = SignInViewModel()
    
    private func makeHeader() -> some View {
        
        HStack{
            
            Text("Connexion")
                .font(.nunitoBold(20))
                .foregroundColor(.secondaryColor)
                .padding(.all, 20)
                .frame(alignment: .topLeading)
            
            Spacer()
            
        } //HStack
    } //func makeHeader
    
    private func newAccount() -> some View {
        
        NavigationLink(destination: SignUpView()) {
            
        VStack{
            
            Text("Vous n'avez pas encore de compte?")
                .font(.nunitoRegular(14))
                .foregroundColor(.secondaryColor)
                .padding(.leading, 20)
            
                Text("Inscrivez-vous ici")
                    .frame(alignment: .bottom)
                    .font(.nunitoRegular(14))
                    .foregroundColor(.secondaryColor)
                    .padding([.leading, .bottom], 20)
            
            } //VStack
        } //NavigationLink
    } //func newAccount
    
    private func forgotPassword() -> some View {
       
        HStack{
            
            Spacer()
            
            Button(action: {print("")}) {
                
                Text("Mot de passe oublié?")
                    .font(.nunitoRegular(14))
                    .underline()
                    .foregroundColor(.secondaryColor)
                    .padding(.trailing, 30)
                    .padding(.bottom, 25)
            } //Button
        } //HStack
    } // func forgotPassword
    
    var body: some View {
        
            VStack{
                
                Image.reverseLogo
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.top, 60)
                    .padding(.bottom, 10)
                
                NavigationView{
                    
                VStack{

                    makeHeader()
                    
                    ReusableTextField(hint: $signInVM.email, icon: "at", title: "E-mail", fieldName: "E-mail").textContentType(.oneTimeCode)
                    
                    ReusableSecureField(hint: $signInVM.password, icon: "lock", title: "Mot de passe", fieldName: "Entrez votre mot de passe").textContentType(.oneTimeCode)
                    
                    forgotPassword()
                    
                    TextButton(text: "Se connecter", isLoading: signInVM.isLoading, onClick: signInVM.signIn, buttonColor: .secondaryColor, textColor: .mainColor)
                    
                    Spacer()
                    
                    newAccount()
                    
                }.background(Color.mainColor) .ignoresSafeArea()
                         //VStack
                    
            }.navigationBarHidden(true).cornerRadius(20, corners: [.topLeft, .topRight])
                   //NavigationView
                
        }.background(Color.secondaryColor)
                .ignoresSafeArea() //VStack
            
    } //body
} //struct SignInView

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE")
        SignInView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")

    }
}
