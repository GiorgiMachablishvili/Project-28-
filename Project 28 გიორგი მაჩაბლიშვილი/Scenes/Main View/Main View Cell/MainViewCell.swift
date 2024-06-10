//
//  MainViewCell.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 08.06.24.
//

import UIKit
import SnapKit

class MainViewCell: UICollectionViewCell {
    //MARK: -UI components
    private lazy var backGroundImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var productImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var productName: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaBold(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var productIngredients: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaBoldItalic(size: 12)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var productPrice: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 12)
        view.textColor = UIColor(hexString: "88F9E4")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var buttonBackView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "plusButtonBackground")
        view.tintColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "Vector"), for: .normal)
        view.setTitleColor(UIColor(hexString: "000000"), for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: set up view
    func setup() {
        addSubview(backGroundImage)
        addSubview(productImage)
        addSubview(productName)
        addSubview(productIngredients)
        addSubview(productPrice)
        addSubview(buttonBackView)
        buttonBackView.addSubview(plusButton)
    }
    
    //MARK: set up constraints
    func setupConstraints() {
        backGroundImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(10 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(34 * Constraint.xCoeff)
            make.width.equalTo(126 * Constraint.xCoeff)
            make.height.equalTo(122 * Constraint.yCoeff)
        }
        
        productImage.snp.remakeConstraints { make in
            make.center.equalTo(backGroundImage.snp.center)
            make.width.equalTo(153 * Constraint.xCoeff)
            make.height.equalTo(103 * Constraint.yCoeff)
        }
        
        productName.snp.remakeConstraints { make in
            make.top.equalTo( productImage.snp.bottom).offset(21 * Constraint.yCoeff)
            make.leading.equalTo(backGroundImage.snp.leading).offset(6 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }
        
        productIngredients.snp.remakeConstraints { make in
            make.top.equalTo( productName.snp.top).offset(19 * Constraint.yCoeff)
            make.leading.equalTo(productName.snp.leading)
            make.height.equalTo(19 * Constraint.yCoeff)
        }
        
        productPrice.snp.remakeConstraints { make in
            make.top.equalTo( productIngredients.snp.top).offset(18 * Constraint.yCoeff)
            make.leading.equalTo(productName.snp.leading).offset(4 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }
        
        buttonBackView.snp.remakeConstraints { make in
//            make.centerX.equalTo(backGroundImage.snp.trailing)
            make.centerY.equalTo(productPrice.snp.centerY)
            make.leading.equalTo(backGroundImage.snp.trailing).offset(-12 * Constraint.xCoeff)
            make.width.equalTo(24 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        plusButton.snp.remakeConstraints { make in
            make.center.equalTo(buttonBackView.snp.center)
            make.width.equalTo(10 * Constraint.xCoeff)
            make.height.equalTo(10 * Constraint.yCoeff)
        }
    }
    
    //MARK: configuration components
    func configuration(with data: MenuInfo) {
        backGroundImage.image = data.productBackgroundImage
        productImage.image = data.productImage
        productName.text = data.productName
        productIngredients.text = data.ProductIngredients
        productPrice.text = data.Price
    }
}
