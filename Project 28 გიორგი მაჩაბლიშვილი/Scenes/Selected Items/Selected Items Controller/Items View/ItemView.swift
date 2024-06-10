//
//  ItemView.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class ItemView: UIView {
    
    //MARK: -UI components
    private lazy var productImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
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
    
    init(pageStruct: ItemInfo) {
        super.init(frame: .zero)
        setup()
        setupConstraint()
        configuration(selectView: pageStruct)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: set up view
    func setup() {
        addSubview(productImage)
        addSubview(productName)
        addSubview(productIngredients)
    }
    
    //MARK: set up constraints
    func setupConstraint(){
        productImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(460 * Constraint.xCoeff)
            make.height.equalTo(352 * Constraint.yCoeff)
        }
        
        productName.snp.remakeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(32 * Constraint.yCoeff)
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
    
    //MARK: zoom photo
    private func setupPinchGesture() {
      let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
      productImage.addGestureRecognizer(pinchGesture)
    }
    
    //MARK: rotation gesture
    private func setupRotateGesture() {
      let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotateGesture(_:)))
      productImage.addGestureRecognizer(rotateGesture)
    }
    
    //MARK: swipe gesture
    private func setupSwipeGesture() {
      let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
      swipeGesture.direction = .left
        productImage.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
      switch gesture.state {
      case .changed:
        productImage.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
      case .ended:
        productImage.transform = .identity
      default:
        break
      }
    }
    
    @objc func handleRotateGesture(_ gesture: UIRotationGestureRecognizer) {
      switch gesture.state {
      case .changed:
          productImage.transform = CGAffineTransform(rotationAngle: gesture.rotation)
      case .ended:
          productImage.transform = .identity
      default:
        break
      }
    }

    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
      
    }

    func configuration(selectView data: ItemInfo) {
        productImage.image = data.productImage
        productName.text = data.productName
    }
}
