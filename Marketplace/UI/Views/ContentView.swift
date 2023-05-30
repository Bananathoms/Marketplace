//
//  ContentView.swift
//  Marketplace
//
//  Created by CESI on 03/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currentUserService = UserService.current
    
    var body: some View {
        switch currentUserService.connexionState {
        case .splash:
            SplashView()
        case .logged:
            HomeView()
        case .unLogged:
            SignInView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE")
        ContentView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")
    }
}


