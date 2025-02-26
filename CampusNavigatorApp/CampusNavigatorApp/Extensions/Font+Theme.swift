//
//  Font+Theme.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

extension Font {
    // Returns a Poppins font with the given size and weight variant.
    static func poppins(size: CGFloat, weight: String = "Regular") -> Font {
        // Ensure that your font names match the actual names in your project.
        return Font.custom("Poppins-\(weight)", size: size)
    }
    
    // Returns an Inter font with the given size and weight variant.
    static func inter(size: CGFloat, weight: String = "Regular") -> Font {
        return Font.custom("Inter-\(weight)", size: size)
    }
}
