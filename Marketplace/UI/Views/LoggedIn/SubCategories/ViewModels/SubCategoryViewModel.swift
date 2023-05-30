//
//  SubCategoryViewModel.swift
//  Marketplace
//
//  Created by CESI on 17/11/2022.
//

import Foundation
import SwiftUI
import ParseSwift
import Combine

class SubCategoryViewModel: ObservableObject {
    
    @Published var subCategoryArray: [Subcategory] = []
    
    func fetchSubcategory(category: Category){

            ApiService.current.getSubcategories(category: category){ responseSubcategory, responseError in
                
                if let subcategories = responseSubcategory {
                    print(self.subCategoryArray)
                    self.subCategoryArray = subcategories
                
                }
                if let _ = responseError {
                   
                    SnackBarService.current.error("Une erreur c'est produite")
                }
                
            }
        
    }
}


