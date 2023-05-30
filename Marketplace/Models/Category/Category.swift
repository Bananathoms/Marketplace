//
//  Categories.swift
//  Marketplace
//
//  Created by CESI on 16/11/2022.
//

import Foundation
import ParseSwift

struct Category: ParseObject{
    var originalData: Data?
    
    var objectId: String?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    
    var ACL: ParseSwift.ParseACL?
    
    var name: String?
    
    var image: ParseFile?
}
