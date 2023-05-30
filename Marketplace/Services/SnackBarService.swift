//
//  SnackBarService.swift
//  Marketplace
//
//  Created by CESI on 08/11/2022.
//

import Foundation
import SwiftEntryKit

class SnackBarService {
    
    static let current = SnackBarService()
    
    func success(_ message: String) {
        SwiftEntryKit.showSuccesMessage(message: message)
    }
    
    func error(_ message: String) {
        SwiftEntryKit.showErrorMessage(message: message)
    }
}
