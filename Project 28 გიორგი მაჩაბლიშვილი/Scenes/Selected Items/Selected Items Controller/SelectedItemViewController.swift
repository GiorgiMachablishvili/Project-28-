//
//  SelectedItemViewController.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class SelectedItemViewController: UIViewController {
    //MARK: -UI components
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "Back"), for: .normal)
        view.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        view.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "092248")
        view.layer.cornerRadius = 10
        return view
    }()
    
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
        view.textAlignment = .left
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
        view.text = "$18.00"
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "addButton"), for: .normal)
        view.addTarget(self, action: #selector(goNextPage), for: .touchUpInside)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    
    var itemInfo: ItemInfo?
    var delegate: MenuInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        configuration()
        setupView()
        //MARK: gradient view color
        view.setGradientBackground(colors: [UIColor(hexString: "2C62B2"),UIColor(hexString: "8152E7"),UIColor(hexString: "092248"),],
                                   startPoint: CGPoint(x: 0, y: 0),
                                   endPoint: CGPoint(x: 1, y: 1))
        //        view.backgroundColor = UIColor(hexString: "8152E7")
    }
    
    //MARK: set up view
    func setup() {
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(buttonsView)
        buttonsView.addSubview(plusButton)
        buttonsView.addSubview(itemCountLabel)
        buttonsView.addSubview(minusButton)
        buttonsView.addSubview(totalLabel)
        buttonsView.addSubview(priceLabel)
        view.addSubview(addButton)
    }
    
    //MARK: set up constraints
    func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(631 * Constraint.yCoeff)
        }
        
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(45 * Constraint.yCoeff)
            make.leading.equalTo(tableView.snp.leading).offset(30 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.yCoeff)
        }
        
        buttonsView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-102 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(30 * Constraint.xCoeff)
            make.height.equalTo(79 * Constraint.yCoeff)
        }
        
        plusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(buttonsView.snp.leading).offset(26 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.yCoeff)
        }
        
        itemCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(plusButton.snp.trailing).offset(22 * Constraint.xCoeff)
            make.width.equalTo(12 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        minusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(itemCountLabel.snp.trailing).offset(20 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.yCoeff)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.trailing.equalTo(buttonsView.snp.trailing).offset(285 * Constraint.xCoeff)
            make.width.equalTo(79 * Constraint.xCoeff)
            make.height.equalTo(28 * Constraint.yCoeff)
        }
        
        totalLabel.snp.remakeConstraints { make in
            make.top.equalTo(buttonsView.snp.top).offset(9 * Constraint.yCoeff)
            make.trailing.equalTo(buttonsView.snp.trailing).offset(260 * Constraint.xCoeff)
            make.width.equalTo(51 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }
        
        addButton.snp.remakeConstraints { make in
            make.top.equalTo(buttonsView.snp.bottom).offset(11 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(30 * Constraint.xCoeff)
            make.height.equalTo(50 * Constraint.yCoeff)
        }
    }
    
    //MARK: config delegat items
    func configuration() {
        if let items = delegate {
            itemInfo = ItemInfo(
                productImage: items.productImage,
                productName: items.productName)
        }
    }
    
    //MARK: set up header view
    func setupView() {
        guard let itemInfo = itemInfo else { return }
        let headerView = ItemView(pageStruct: itemInfo)
        headerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 631)
        tableView.tableHeaderView = headerView
    }
    
    //MARK: go back button func
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: go next page func
    @objc private func goNextPage() {
        let orderVC = OrderApprovViewController()
        navigationController?.pushViewController(orderVC, animated: true)
    }
}

