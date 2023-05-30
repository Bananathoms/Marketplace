//
//  APIService.swift
//  Marketplace
//
//  Created by CESI on 09/11/2022.
//

import Foundation
import ParseSwift
import SwiftUI

class ApiService{
    
    static let current = ApiService()
    
    func signUp(user: User, onResult: @escaping (User?, ParseError?) -> Void) {
        
        user.signup { response in
            
            switch response {
                
            case .failure(let error):
                print("There is an error = \(error.message)")
                onResult(nil, error)
                
            case .success(let user):
                print("User = \(user)")
                onResult(user, nil)
            }
        }
    }
    
    func logIn(email: String, password: String, onResult: @escaping (User?, ParseError?) -> Void) {
        
        User.login (username: email, password: password) { response in
            switch response {
            case .failure(let error):
                print("There is an error = \(error.message)")
                onResult(nil, error)
                
            case .success(let user):
                print("User = \(user)")
                onResult(user, nil)
            }
        }
    }
    
    func getCategories(onResult: @escaping ([Category]?, ParseError?) -> Void) {
        
        let query = Category.query()
        
        query.find { response in
            
            switch response {
                
            case .success(let categoryArray):
                print("Category = \(categoryArray)")
                onResult(categoryArray, nil)
                
            case .failure(let error):
                print("There is an error = \(error.message)")
                onResult(nil, error)
            }
        }
    }
    
    func getSubcategories(category: Category, onResult: @escaping ([Subcategory]?, ParseError?) -> Void) {
                
        do{
            return try Subcategory.query("toCategory" == category.toPointer()).find { response in
                
                switch response {
                    
                case .success(let subCategoryArray):
                    print("SubCategory = \(subCategoryArray)")
                    onResult(subCategoryArray, nil)
                    
                case .failure(let error):
                    print("There is an error = \(error.message)")
                    onResult(nil, error)
                }
            }
        } catch {
            return
        }
    }
    
    func queryInfoProducts(subcategory: Subcategory, onResult: @escaping ([Product]?, ParseError?) -> Void) {
                
        do{
                      
            return try Product.query("toSubcategories" == subcategory.toPointer()).include(["pictures.image"]).find { response in
                
                switch response {
                    
                case .success(let products):
                    onResult(products, nil)
                    
                case .failure(let error):
                    onResult(nil, error)
                }
            }
        } catch {
            return
        }
    }
    
    
//    func queryInfoPicture(onResult: @escaping ([Picture]?, ParseError?) -> Void) {
//
//        let query = Picture.query()
//
//        query.find() { response in
//
//                switch response {
//
//                case .success(let picture):
//                    onResult(picture, nil)
//
//                case .failure(let error):
//                    onResult(nil, error)
//                }
//
//        }
//    }
//
}
