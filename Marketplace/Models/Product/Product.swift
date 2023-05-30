//
//  Product.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import Foundation
import ParseSwift

struct Product: ParseObject {
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var pictures: [Picture]?
    var Reference: String?
    var name: String?
    var price: Float?
    var description: String?
    var quantityAvailable: Int?
    var toSubcategories: [Subcategory]?
    
}
