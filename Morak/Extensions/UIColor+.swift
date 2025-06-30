//
//  UIColor+.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit

extension UIColor {
    static let theme = ColorTheme()
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

// MARK: Color Setting
struct ColorTheme {
    fileprivate init() {}
    
    let main = UIColor(rgb: 0xFFAD35)
    let deepGray = UIColor(rgb: 0x5A554E)
    let red = UIColor(rgb: 0xFF0000)
    let point = UIColor(rgb: 0xFF8424)
    let black = UIColor(rgb: 0x000000)
    let lightYellow = UIColor(rgb: 0xFEEDBF)
}
