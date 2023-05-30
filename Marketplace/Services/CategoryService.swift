//
//  CategoryService.swift
//  Marketplace
//
//  Created by CESI on 16/11/2022.
//

import Foundation
import ParseSwift
import SwiftUI

class CategoryService: ObservableObject{
    
    static let current = CategoryService()
    
    @Published var categories: [Category] = []
    @Published var subcategories: [Subcategory] = []
   
    func categoryObject(onEnd: @escaping () -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            ApiService.current.getCategories(){ responseCategory, responseError in
                
                if let categories = responseCategory {
                    
                    self.categories = categories
                
                }
                if let _ = responseError {
                 
                    SnackBarService.current.error("Une erreur c'est produite")
                }
                onEnd()
            }
        }
    }
    

}
