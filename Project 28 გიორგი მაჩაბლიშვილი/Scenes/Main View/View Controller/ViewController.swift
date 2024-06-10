//
//  ViewController.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 08.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: -UI components
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = UIFont.andikaBold(size: 40)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.text = "Good Bites"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = UIFont.andikaItalic(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.text = "delicious burgers!"
        return view
    }()
    

    private lazy var ringButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "ring"), for: .normal)
        view.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        return view
    }()
   
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hexString: "8152E7")
        return collectionView
    }()
    
    let menuData = MenuData(
        menuHeader: .init(
            title: "Good Bites",
            slogan: "delicious burgers!"),
        
        menuInfo: [
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "BurgerRoyalRedRobin")!, productName: "Beef Burger", ProductIngredients: "Beef with cheese", Price: "$18.00"),
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "rancho burger")!, productName: "Rancho Burger", ProductIngredients: "Beef with egg", Price: "$16.00"),
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "tehas burger")!, productName: "Tehas Burger", ProductIngredients: "Beef with tomato", Price: "$12.00"),
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "chicken burger")!, productName: "Chicken Burger", ProductIngredients: "Beef with chiken", Price: "$9.00"),
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "chicken burger")!, productName: "Chicken Burger", ProductIngredients: "Beef with chiken", Price: "$9.00"),
            .init(productBackgroundImage: UIImage(named: "backView")!, productImage: UIImage(named: "BurgerRoyalRedRobin")!, productName: "Beef Burger", ProductIngredients: "Beef with cheese", Price: "$18.00"),
            
        ]
    )
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
//        setupHeaderView()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.backgroundColor = UIColor(hexString: "8152E7")
        
    }
    
    //MARK: set up view
    func setup() {
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "mainViewCell")
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        view.addSubview(sloganLabel)
        view.addSubview(ringButton)
        
    }
    
    //MARK: set up constraints
    func setupConstraints() {
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(66 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(29 * Constraint.xCoeff)
            make.height.equalTo(64 * Constraint.yCoeff)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(55 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(33 * Constraint.xCoeff)
            make.height.equalTo(29 * Constraint.yCoeff)
        }
        
        ringButton.snp.remakeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-23 * Constraint.yCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-33 * Constraint.xCoeff)
            make.width.equalTo(18 * Constraint.xCoeff)
            make.height.equalTo(21 * Constraint.yCoeff)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(41 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
//    //MARK: setup header view
//    func setupHeaderView() {
//        let headerView = HeaderView(pageDescription: menuData.menuHeader)
//        headerView.frame = .init(x: 0, y: 0, width: collectionView.frame.width, height: 10)
//        view = headerView
//    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.menuInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCell", for: indexPath) as! MainViewCell
        cell.configuration(with: menuData.menuInfo[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: width, height: width * 1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = menuData.menuInfo[indexPath.row]
        let selectedItemVC = SelectedItemViewController()
        selectedItemVC.modalPresentationStyle = .fullScreen
        selectedItemVC.delegate = selectedProduct
        navigationController?.present(selectedItemVC, animated: true)
    }
}

