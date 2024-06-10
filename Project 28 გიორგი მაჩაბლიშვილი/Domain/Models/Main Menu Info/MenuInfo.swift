//
//  MenuData.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 09.06.24.
//

import UIKit

struct MenuData {
    let menuHeader: MenuHeader
    let menuInfo: [MenuInfo]
}

struct MenuHeader {
    let title: String
    let slogan: String
}

struct MenuInfo {
    let productBackgroundImage: UIImage
    let productImage: UIImage
    let productName: String
    let ProductIngredients: String
    let Price: String
}
