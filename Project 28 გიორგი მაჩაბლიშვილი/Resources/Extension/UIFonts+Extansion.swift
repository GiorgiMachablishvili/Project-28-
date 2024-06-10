//
//  Fonts+Extansion.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 09.06.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func andikaRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Andika-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func andikaItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "Andika-Italic", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func andikaBoldItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "Andika-BoldItalic", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func andikaBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Andika-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
