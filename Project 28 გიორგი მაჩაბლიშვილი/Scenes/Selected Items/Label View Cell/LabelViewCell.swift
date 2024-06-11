//
//  LabelViewCell.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 11.06.24.
//

import UIKit
import SnapKit

class LabelViewCell: UITableViewCell {
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupConstraint()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setup() {
        addSubview(productName)
        addSubview(productIngredients)
    }
    
    //MARK: set up constraints
    func setupConstraint(){
        productName.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(32 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(37 * Constraint.xCoeff)
            make.trailing.equalTo(snp.trailing).offset(-23 * Constraint.xCoeff)
            make.height.equalTo(65 * Constraint.yCoeff)
        }
        
        productIngredients.snp.remakeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(-10 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(37 * Constraint.xCoeff)
            make.trailing.equalTo(snp.trailing).offset(-23 * Constraint.xCoeff)
            make.height.equalTo(110 * Constraint.yCoeff)
        }
    }
    
    func configurationLabel(selectView data: LabelInfo) {
        productName.text = data.imageTitle
        productIngredients.text = data.productDescription
    }
}
