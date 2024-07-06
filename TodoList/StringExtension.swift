//
//  StringExtension.swift
//  TodoList
//
//  Created by Sudharshan on 06/07/24.
//

import Foundation
import UIKit

extension String {
    
    func withStrikethrough() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: self.count)
        
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        attributedString.addAttribute(.strikethroughColor, value: UIColor.black, range: range)
        
        return attributedString
    }
    
    func withoutStrikethrough() -> NSAttributedString {
            let attributedString = NSMutableAttributedString(string: self)
            let range = NSRange(location: 0, length: self.count)
            
            // Remove the strikethrough attribute
            attributedString.removeAttribute(.strikethroughStyle, range: range)
            
            return attributedString
        }
}
