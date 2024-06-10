//
//  OrderApprovViewController.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class OrderApprovViewController: UIViewController {
    
    
    //MARK: -UI components
    private lazy var imagebackGround: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "BG")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var approveImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "ic_baseline-done-all")
        view.isUserInteractionEnabled = true
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
        setup()
        setupConstraints()
        setupTapGesture()
        
        //MARK: gradient background
        view.setGradientBackground(colors: [UIColor(hexString: "2C62B2"),UIColor(hexString: "8152E7"),UIColor(hexString: "092248"),],
                                   startPoint: CGPoint(x: 0, y: 0),
                                   endPoint: CGPoint(x: 1, y: 1))
    }
    
    //MARK: set up view
    func setup() {
        view.addSubview(imagebackGround)
        imagebackGround.addSubview(approveImage)
        view.addSubview(approveLabel)
        view.addSubview(infoLabel)
    }
    
    //MARK: set up constraints
    func setupConstraints() {
        imagebackGround.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(319 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(82 * Constraint.yCoeff)
            make.width.equalTo(98 * Constraint.xCoeff)
        }
        
        approveImage.snp.remakeConstraints { make in
            make.top.equalTo(imagebackGround.snp.top).offset(10)
            make.bottom.equalTo(imagebackGround.snp.bottom).offset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        approveLabel.snp.remakeConstraints { make in
            make.top.equalTo(imagebackGround.snp.bottom).offset(4 * Constraint.yCoeff)
            make.centerX.equalTo(imagebackGround.snp.centerX)
            make.width.equalTo(49 * Constraint.xCoeff)
            make.height.equalTo(27 * Constraint.yCoeff)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(approveLabel.snp.top).offset(24 * Constraint.yCoeff)
            make.centerX.equalTo(imagebackGround.snp.centerX)
            make.width.equalTo(177 * Constraint.xCoeff)
            make.height.equalTo(26 * Constraint.yCoeff)
        }
    }
    
    //MARK: tab gesture
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnGesture(_:)))
        approveImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapOnGesture(_ gesture: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
        
}
