//
//  ProductsViewModel.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import Foundation
import ParseSwift
import Combine

class ProductsViewModel: ObservableObject {
    
    @Published var productsArray: [Product] = []
    @Published var picturesArray: [Picture] = []
    
    func getProducts(subcategory: Subcategory) {
        ApiService.current.queryInfoProducts(subcategory: subcategory){ products, error in
            if let products = products {
                self.productsArray = products
            }
            if let _ = error {
                SnackBarService.current.error("Une erreur c'est produite")
            }
        }
    }
    
    

}
