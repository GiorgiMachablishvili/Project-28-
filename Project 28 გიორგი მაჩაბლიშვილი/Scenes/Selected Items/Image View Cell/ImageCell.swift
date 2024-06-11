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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupConstraint()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
