//
//  SignInViewModel.swift
//  Marketplace
//
//  Created by CESI on 10/11/2022.
//

import Foundation
import ParseSwift
import SwiftUI

class SignInViewModel: ObservableObject {
    
    @Published var email = "thocarlie@gmail.com"
    @Published var password = "Azerty1234"
    @Published var isLoading = false

    
    func signInCheckError() -> Bool{
        
        if email.isValidEmail == false {
            SnackBarService.current.error("Veuillez rentrer un e-mail valide")
            return true
        }
        
        if password.isBlank() {
            SnackBarService.current.error("Veuillez entrer un mot de passe")
            return true
        }
        
        return false
    }
    
    func reset() {
        email = ""
        password = ""
    }
        
    func signIn(){
            
        if signInCheckError() {
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {         ApiService.current.logIn(email: self.email, password: self.password){ responseUser, responseError in
            
            if let user = responseUser {
                SnackBarService.current.success("Utilisateur \(user.firstName!) \(user.lastName!) connecté")
                UserService.current.setUser(newUser: user)
            }
            if let error = responseError {
                var message: String = ""
                
                if error.code == .usernameTaken {
                    message = "Utilisateur existant"
                } else {
                    message = "Erreur"
                }
                
                SnackBarService.current.error(message)
            }

            self.isLoading = false
            }
        }
        
        
    }
}
    
