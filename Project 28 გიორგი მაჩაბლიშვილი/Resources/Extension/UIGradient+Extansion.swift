//
//  UIGradient+Extansion.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit

extension UIView {
    func setGradientBackground(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        // Remove any existing gradient layers to avoid stacking multiple gradients
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        // Create a new gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        // Convert UIColor to CGColor
        gradientLayer.colors = colors.map { $0.cgColor }
        
        // Set the start and end points of the gradient
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        // Insert the gradient layer at the lowest layer
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
