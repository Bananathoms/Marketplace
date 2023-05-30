//
//  SpashView.swift
//  Marketplace
//
//  Created by CESI on 10/11/2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var scale = 0.6
    
    var body: some View {
        
        ZStack{
            Color.mainColor.edgesIgnoringSafeArea(.all)
            
            Image.logo
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)) {
                        scale = 0.5
                    }
                }
        }
            .onAppear {
                UserService.current.splashData()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
