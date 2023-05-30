//
//  ProfilViewModel.swift
//  Marketplace
//
//  Created by CESI on 17/11/2022.
//

import Foundation
import ParseSwift
import SwiftUI

class ProfilViewModel: ObservableObject {
    
    @Published var firstName = UserService.current.user?.firstName
    @Published var lastName = UserService.current.user?.lastName
    @Published var profilPicture = UserService.current.user?.profilPicture
      
}
