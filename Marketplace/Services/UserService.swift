//
//  UserService.swift
//  Marketplace
//
//  Created by CESI on 10/11/2022.
//

import Foundation
import Combine

class UserService: ObservableObject{
    
    static let current = UserService()
    
    @Published var connexionState = ConnexionState.splash
    @Published var user: User?
    
    enum ConnexionState {
        case splash
        case unLogged
        case logged
    }
    
    func splashData(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if let user = User.current {
                
                self.user = user
                CategoryService.current.categoryObject(onEnd: {  self.connexionState = .logged})
                
            } else {
                self.connexionState = .unLogged
            }
        }
    }
    func setUser(newUser: User) {
        user = newUser
        connexionState = .splash
    }
    
    func logOut() {
        User.logout { _ in
            self.resetService()
        }
    }
    
    func resetService() {
        user = nil
        connexionState = .unLogged
        
    }
    
}
