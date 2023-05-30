//
//  Extension+SwiftEntryKit.swift
//  Marketplace
//
//  Created by CESI on 08/11/2022.
//

import Foundation
import SwiftUI
import SwiftEntryKit

extension SwiftEntryKit {

    static func showSuccesMessage(message: String) {
        var attributes = EKAttributes.topNote

        attributes.entryBackground = .color(color: .init(UIColor(Color.green)))
        
        attributes.roundCorners = .bottom(radius: 20)
        
        attributes.displayDuration = 4
        
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 10, offset: .zero))
     
        let style = EKProperty.LabelStyle(font: UIFont(name: "Nunito-Bold", size:  15)!, color: .white, alignment: .center)
       
        let labelContent = EKProperty.LabelContent(text: message, style: style)
        
        let contentView = EKNoteMessageView(with: labelContent)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    static func showErrorMessage(message: String) {
        var attributes = EKAttributes.topNote

        attributes.entryBackground = .color(color: .init(UIColor(Color.redCustom)))
        
        attributes.roundCorners = .bottom(radius: 20)
        
        attributes.displayDuration = 4
        
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 10, offset: .zero))
     
        let style = EKProperty.LabelStyle(font: UIFont(name: "Nunito-Bold", size:  15)!, color: .white, alignment: .center)
       
        let labelContent = EKProperty.LabelContent(text: message, style: style)
        
        let contentView = EKNoteMessageView(with: labelContent)
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
    }
}
