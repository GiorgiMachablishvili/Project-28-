//
//  CountPriceCell.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 11.06.24.
//

import UIKit
import SnapKit

class CountPriceCell: UITableViewCell {
    
    lazy var plusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "092248")
//        view.setImage(UIImage(named: "Plus"), for: .normal)
        view.addTarget(self, action: #selector(imageRotation), for: .touchUpInside)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var itemCountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 20)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
//        view.text = "1"
        view.numberOfLines = 1
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "092248")
//        view.setImage(UIImage(named: "Minus"), for: .normal)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var totalLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 10)
        view.textColor = UIColor(hexString: "FFFFFF")
//        view.text = "Total price"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 24)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
        layer.cornerRadius = 30
        backgroundColor = UIColor(hexString: "092248")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(plusButton)
        addSubview(itemCountLabel)
        addSubview(minusButton)
        addSubview(totalLabel)
        addSubview(priceLabel)
    }
    
    func setupConstraints() {
        plusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(26 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.xCoeff)
        }
        
        itemCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(plusButton.snp.trailing).offset(22 * Constraint.xCoeff)
            make.width.equalTo(12 * Constraint.xCoeff)
            make.height.equalTo(22 * Constraint.yCoeff)
        }
        
        minusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(itemCountLabel.snp.trailing).offset(20 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.xCoeff)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(minusButton.snp.trailing).offset(30 * Constraint.xCoeff)
            make.width.equalTo(79 * Constraint.xCoeff)
            make.height.equalTo(28 * Constraint.yCoeff)
        }
        
        totalLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(9 * Constraint.yCoeff)
            make.leading.equalTo(minusButton.snp.trailing).offset(30 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }
    }
    
    func configurationCountPrice(selectView data: CountPriceInfo) {
        plusButton.setImage(data.plusButton, for: .normal)
        itemCountLabel.text = data.productCount
        minusButton.setImage(data.minusButton, for: .normal)
        totalLabel.text = data.totalPriceLabel
        priceLabel.text = data.totalPrice
    }
    
    @objc func imageRotation() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .curveLinear], animations: {
            self.plusButton.transform = self.plusButton.transform.rotated(by: .pi)
        }, completion: nil)
    }
}
