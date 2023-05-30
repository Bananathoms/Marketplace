//
//  User.swift
//  Marketplace
//
//  Created by CESI on 09/11/2022.
//

import Foundation
import ParseSwift

struct User: ParseUser{
    var username: String?
    
    var email: String?
    
    var emailVerified: Bool?
    
    var password: String?
    
    var authData: [String : [String : String]?]?
    
    var originalData: Data?
    
    var objectId: String?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    
    var ACL: ParseSwift.ParseACL?
    
    var profilPicture: ParseFile?
    
    var firstName: String?
    
    var lastName: String?
}
