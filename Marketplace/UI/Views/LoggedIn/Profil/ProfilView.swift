//
//  ProfilView.swift
//  Marketplace
//
//  Created by CESI on 14/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilView: View {
    

    
    @StateObject var profilVM = ProfilViewModel()
   
    
    private func makeHeader() -> some View {
        
        VStack{
            
            HStack{
                Text("Profil")
                    .font(.nunitoBold(30))
                    .foregroundColor(.secondaryColor)
                    .padding([.top, .leading], 20)
                    .padding(.bottom, 10)
                    .frame(alignment: .topLeading)
                Spacer()
            }
        }
    }
    
    private func profilPicture() -> some View {
  
        Button {
            print("test")
        } label: {
            VStack{
                ZStack{
                    
                    Circle()
                        .frame(height: 100)
                        .foregroundColor(.secondaryColor)
                    
                    Image(systemName: "camera")
                        .foregroundColor(.mainColor)
                }
                
                Text("\(profilVM.firstName ?? "prénom") \(profilVM.lastName ?? "nom")")
                    .foregroundColor(.secondaryColor)
                    .padding(.bottom, 20.0)
            }
        }
    }

    var body: some View {
        
        VStack{
            makeHeader()
            
            profilPicture()
            
            ProfilButton(icon: "person", text: "Mes informations")
            
            ProfilButton(icon: "cart", text: "Mes commandes")
            
            ProfilButton(icon: "heart", text: "Mes Favoris")
            
            ProfilButton(icon: "envelope", text: "Contact")
            
            ProfilButton(icon: "list.bullet", text: "CGU")
            
            Spacer()
            
            TextButton(text: "Déconnexion", isLoading: false, onClick: UserService.current.logOut, buttonColor: .redCustom, textColor: .white)
                .padding(20)
        }.background(Color.mainColor)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
