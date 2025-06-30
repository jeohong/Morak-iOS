//
//  UIImage+.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: size))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return resizedImage
    }
}
