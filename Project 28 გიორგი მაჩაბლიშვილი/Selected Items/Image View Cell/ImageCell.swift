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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.implementTransformation()
        })
        setupTapGesture()
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
            make.width.equalTo(460 * 0.8 * Constraint.xCoeff)
            make.height.equalTo(352 * 0.8 * Constraint.yCoeff)
        }
    }
    func configurationImage(selectView data: ImageInfo) {
        productImage.image = data.productImage
    }
    
   private func implementTransformation() {
        let scaleTransformation = CGAffineTransform(scaleX: 1.2, y: 1.2)
        productImage.transform = scaleTransformation
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnGesture(_:)))
        productImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapOnGesture(_ gesture: UITapGestureRecognizer) {
        let scaleTransformation = CGAffineTransform(scaleX: 1.5, y: 1.5)
        productImage.transform = scaleTransformation
    }
}
