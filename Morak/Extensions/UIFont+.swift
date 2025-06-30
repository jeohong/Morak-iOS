//
//  UIFont+.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit

extension UIFont {
    static var pretendard: PretendardFont { return PretendardFont() }
    
    struct PretendardFont {
        private let familyName = "Pretendard"
        
        // 각 스타일에 맞는 폰트를 반환하는 computed properties
        var title: UIFont { return font(for: 18, weight: .bold) }
        
        var largeTextBold: UIFont { return font(for: 16, weight: .bold) }
        var largeTextMedium: UIFont { return font(for: 16, weight: .medium) }
        var largeTextRegular: UIFont { return font(for: 16, weight: .regular) }
        
        var mediumTextSemiBold: UIFont { return font(for: 14, weight: .semibold) }
        var mediumTextRegular: UIFont { return font(for: 14, weight: .regular) }
        
        var smallTextBold: UIFont { return font(for: 12, weight: .bold) }
        var smallTextRegular: UIFont { return font(for: 12, weight: .regular) }
        
        var tinyTextBold: UIFont { return font(for: 10, weight: .semibold) }
        var tinyText: UIFont { return font(for: 10, weight: .regular) }
        
        var largeTitle: UIFont { return font(for: 40, weight: .semibold)}
        
        private func font(for size: CGFloat, weight: UIFont.Weight) -> UIFont {
            let weightString: String
            
            switch weight {
            case .black:
                weightString = "Black"
            case .bold:
                weightString = "Bold"
            case .heavy:
                weightString = "Heavy"
            case .ultraLight:
                weightString = "UltraLight"
            case .light:
                weightString = "Light"
            case .medium:
                weightString = "Medium"
            case .regular:
                weightString = "Regular"
            case .semibold:
                weightString = "SemiBold"
            case .thin:
                weightString = "Thin"
            default:
                weightString = "Regular"
            }
            
            return UIFont(name: "\(familyName)-\(weightString)", size: size) ?? .systemFont(ofSize: size, weight: weight)
        }
    }
}
