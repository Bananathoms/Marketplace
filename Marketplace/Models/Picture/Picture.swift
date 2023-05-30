//
//  Picture.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import Foundation
import ParseSwift

struct Picture: ParseObject {
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var image: ParseFile?
}
