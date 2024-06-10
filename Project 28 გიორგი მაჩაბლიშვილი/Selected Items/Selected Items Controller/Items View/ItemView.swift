//
//  ItemView.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class ItemView: UIView {
    
    private lazy var productImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var productName: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaBold(size: 24)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var productIngredients: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaBoldItalic(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.text = "Burger with a huge pork cutlet, pickled cucumbers, blue onions, grilled vegetables (green beans, bell peppers, carrots), oyster dressing, black cuttlefish ink bun."
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
//    
//    private lazy var productPrice: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.font = UIFont.andikaRegular(size: 24)
//        view.textColor = UIColor(hexString: "88F9E4")
//        view.textAlignment = .left
//        view.numberOfLines = 1
//        return view
//    }()
    
    init(pageStruct: ItemInfo) {
        super.init(frame: .zero)
        setup()
        setupConstraint()
        configuration(selectView: pageStruct)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(productImage)
        addSubview(productName)
        addSubview(productIngredients)
    }
    
    func setupConstraint(){
        productImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(460)
            make.height.equalTo(352)
        }
        
        productName.snp.remakeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(32)
            make.leading.equalTo(snp.leading).offset(37)
            make.trailing.equalTo(snp.trailing).offset(-23)
            make.height.equalTo(65)
        }
        
        productIngredients.snp.remakeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(-10)
            make.leading.equalTo(snp.leading).offset(37)
            make.trailing.equalTo(snp.trailing).offset(-23)
            make.height.equalTo(110)
        }
    }
    
    func configuration(selectView data: ItemInfo) {
        productImage.image = data.productImage
        productName.text = data.productName
    }
}
