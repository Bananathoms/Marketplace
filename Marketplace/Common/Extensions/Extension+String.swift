//
//  Extension+String.swift
//  Marketplace
//
//  Created by CESI on 08/11/2022.
//
import Foundation
import SwiftUI

extension String {

        private static let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        private static let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        private static let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,6}"

        public var isValidEmail: Bool {
            let predicate = NSPredicate(format: "SELF MATCHES %@", type(of:self).__emailRegex)
            return predicate.evaluate(with: self)
            
        }
    
    func hasUppercase() -> Bool{
        let passwordRegEx = "^(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`']{1,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
         return passwordPred.evaluate(with: self)
    }
    
    func hasLowercase() -> Bool{
        let passwordRegEx = "^(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`']{1,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
         return passwordPred.evaluate(with: self)
    }
    
    func isBlank() -> Bool {
           return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
       }
}
