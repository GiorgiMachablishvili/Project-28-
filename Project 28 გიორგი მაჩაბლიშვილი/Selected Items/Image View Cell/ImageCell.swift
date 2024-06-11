//
//  ImageCell.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class ImageCell: UITableViewCell {
    //MARK: -UI components
    private lazy var productImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraint()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(productImage)
    }
    
    func setupConstraint(){
        productImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(460 * Constraint.xCoeff)
            make.height.equalTo(352 * Constraint.yCoeff)
        }
    }
    func configurationImage(selectView data: ImageInfo) {
        productImage.image = data.productImage
    }
}
