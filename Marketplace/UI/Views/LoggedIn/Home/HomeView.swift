//
//  LoggedView.swift
//  Marketplace
//
//  Created by CESI on 10/11/2022.
//

import SwiftUI
import UIKit

struct BottomTabItem: Identifiable {
    let id = UUID()
    let indexTag: Int
    let icon: String
}

struct HomeView: View {

    @State private var selection = 0
    let bottomItems = [BottomTabItem(indexTag: 0, icon: "house"), BottomTabItem(indexTag: 1, icon: "person")]
    
    private func tabBarItem(number: Int, icon: String) -> some View {
        
        Button {
            selection = number
        } label: {
            VStack (alignment: .center) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(selection == number ? .mainColor : .gray)
                
                Circle()
                    .frame(height: 5)
                    .foregroundColor(selection == number ? .mainColor : .secondaryColor)
                    .padding(.bottom, 20)
                
            }.frame(maxWidth: .infinity)
        }
    }
    
    private func tabBar() -> some View {
        HStack(alignment: .center) {
            tabBarItem(number: 0, icon: "house")
            tabBarItem(number: 1, icon: "person")
        }.padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Rectangle().fill(Color.secondaryColor).edgesIgnoringSafeArea(.all).cornerRadius(20, corners: [.topLeft, .topRight]))
    }
    
    
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $selection) {
                CategView().tag(0)
                ProfilView().tag(1)
            }
            
            tabBar()
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
