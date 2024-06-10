//
//  HeaderView.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    //MARK: -UI components
    private lazy var titleLabel: UILabel = {
      let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = UIFont.andikaBold(size: 40)
        view.textColor = UIColor(hexString: "FFFFFF")
      return view
    }()
    
    private lazy var sloganLabel: UILabel = {
      let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = UIFont.andikaRegular(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
      return view
    }()
    
    init(pageDescription: MenuHeader) {
        super.init(frame: .zero)
        setup()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: set up view
    func setup() {
        addSubview(titleLabel)
        addSubview(sloganLabel)
    }
    
    //MARK: set up constraints
    func setupConstraint() {
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(66 * Constraint.xCoeff)
            make.leading.equalTo(snp.leading).offset(29 * Constraint.xCoeff)
            make.height.equalTo(64 * Constraint.yCoeff)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(55 * Constraint.xCoeff)
            make.leading.equalTo(snp.leading).offset(33 * Constraint.xCoeff)
            make.height.equalTo(29 * Constraint.yCoeff)
        }
    }
    
    func config(headerInfo data: MenuHeader) {
        titleLabel.text = data.title
        sloganLabel.text = data.slogan
    }
}
