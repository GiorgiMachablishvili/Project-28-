//
//  OrderApprovViewController.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class OrderApprovViewController: UIViewController {
    
    private lazy var imagebackGround: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "imageBackground")
        return view
    }()
    
    private lazy var approveImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "ic_baseline-done-all")
        return view
    }()
    
    private lazy var approveLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 16)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
        view.text = "Done!"
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.andikaRegular(size: 16)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .center
        view.text = "Oder added to the cart"
        view.numberOfLines = 1
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "8152E7")
        setup()
        setupConstraints()

    }
    
    func setup() {
        view.addSubview(imagebackGround)
        imagebackGround.addSubview(approveImage)
        view.addSubview(approveLabel)
        view.addSubview(infoLabel)
    }
    
    func setupConstraints() {
        imagebackGround.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(319)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(82)
            make.width.equalTo(98)
        }
        
        approveImage.snp.remakeConstraints { make in
            make.center.equalTo(imagebackGround.snp.center)
            make.height.width.equalTo(58)
        }
        
        approveLabel.snp.remakeConstraints { make in
            make.top.equalTo(imagebackGround.snp.bottom).offset(4)
            make.centerX.equalTo(imagebackGround.snp.centerX)
            make.width.equalTo(49)
            make.height.equalTo(27)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(approveLabel.snp.top).offset(24)
            make.centerX.equalTo(imagebackGround.snp.centerX)
            make.width.equalTo(177)
            make.height.equalTo(26)
        }
    }
}
