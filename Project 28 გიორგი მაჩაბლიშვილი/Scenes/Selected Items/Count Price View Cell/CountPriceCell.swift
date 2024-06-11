//
//  CountPriceCell.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 11.06.24.
//

import UIKit
import SnapKit

class CountPriceCell: UITableViewCell {
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "092248")
        view.setImage(UIImage(named: "Plus"), for: .normal)
        return view
    }()
    
    private lazy var itemCountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 20)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
        view.text = "1"
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "092248")
        view.setImage(UIImage(named: "Minus"), for: .normal)
        return view
    }()
    
    private lazy var totalLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 10)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.text = "Total price"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 24)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
//        view.text = "$18.00"
        view.numberOfLines = 1
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(26)
            make.width.height.equalToSuperview().offset(32)
        }
        
        itemCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.leading.equalTo(plusButton.snp.leading).offset(22)
            make.width.equalTo(12)
            make.height.equalTo(22)
        }
        
        minusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.leading.equalTo(itemCountLabel.snp.trailing).offset(20)
            make.width.height.equalToSuperview().offset(32)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.leading.equalTo(minusButton.snp.trailing).offset(30)
            make.width.equalTo(79)
            make.height.equalTo(28)
        }
        
        totalLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(9)
            make.leading.equalTo(minusButton.snp.trailing).offset(30)
            make.height.equalTo(14)
        }
    }
    
    func configurationCountPrice(selectView data: CountPriceInfo) {
        plusButton.setImage(data.plusButton, for: .normal)
        itemCountLabel.text = data.productCount
        minusButton.setImage(data.minusButton, for: .normal)
        totalLabel.text = data.totalPriceLabel
        priceLabel.text = data.totalPrice
    }
}
