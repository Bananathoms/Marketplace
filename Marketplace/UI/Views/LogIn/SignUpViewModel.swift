//
//  SignUpViewModel.swift
//  Marketplace
//
//  Created by CESI on 08/11/2022.
//

import Foundation
import ParseSwift
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var email = "thocarlie@gmail.com"
    @Published var firstName = "Thomas"
    @Published var lastName = "Carlier"
    @Published var password = "Azerty1234"
    @Published var confirmPwd = "Azerty1234"
    @Published var isLoading: Bool = false
    
    
    func signUpCheckError() -> Bool {
        
        if firstName.isBlank(){
            SnackBarService.current.error("merci de rentrer un prénom")
            return true
        }
        
        if lastName.isBlank(){
            SnackBarService.current.error("merci de rentrer un nom")
            return true
        }
        
        if email.isValidEmail == false {
            SnackBarService.current.error("Veuillez rentrer un e-mail valide")
            return true
        }
        
        if password.count < 8 {
            SnackBarService.current.error("le mot de passe doit faire plus de 8 caractères ")
            return true
        }
        
        if (!password.hasLowercase()){
            SnackBarService.current.error("le mot de passe doit avoir au moins une majuscule")
            return true
        }
        
        if (!password.hasUppercase()){
            SnackBarService.current.error("le mot de passe doit avoir au moins une majuscule")
            return true
        }
        
        if confirmPwd != password {
            SnackBarService.current.error("les mots de passe ne correspondent pas")
            return true
        }
        return false
        
    }
    
    func signUp() -> Void{
        
        if signUpCheckError() {
            return
        }
        
        isLoading = true
        
        let newUser = User(username: email.lowercased(), email: email.lowercased(), password: password, firstName: firstName, lastName: lastName)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {         ApiService.current.signUp(user: newUser){ responseUser, responseError in
            
            if let user = responseUser {
                SnackBarService.current.success("Utilisateur \(user.firstName!) \(user.lastName!) enregistré!")
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
    
    func logOut() {
        User.logout { _ in
            //    self.resetService()
        }
    }
}

