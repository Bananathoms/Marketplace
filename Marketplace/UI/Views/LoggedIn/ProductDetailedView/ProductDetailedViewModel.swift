//
//  ProductDetailedViewModel.swift
//  Marketplace
//
//  Created by CESI on 21/11/2022.
//

import Foundation

struct PictureUrl{
    
    let index: Int
    let url: URL?
}

class ProductDetailedViewModel: ObservableObject {
    
   @Published var pictures: [PictureUrl] = []
    
    func initPicturesUrl(product: Product) {
        if let pictures = product.pictures{
            self.pictures = pictures.enumerated().compactMap({ (index, picture) in
                PictureUrl(index: index, url: picture.image?.url)
                
            })
            print(self.pictures)
        }
        
        
    }
}
