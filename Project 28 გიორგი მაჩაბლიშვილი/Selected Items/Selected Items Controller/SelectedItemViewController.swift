//
//  SelectedItemViewController.swift
//  Project 28 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 10.06.24.
//

import UIKit
import SnapKit

class SelectedItemViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "8152E7")
        view.setImage(UIImage(named: "Back"), for: .normal)
        view.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        view.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "8152E7")
        
        return view
    }()
    
    private lazy var buttonsView: UITableView = {
        let view = UITableView(frame: .zero)
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
        view.backgroundColor = UIColor(hexString: "8152E7")
    }
    
    func setup() {
        view.addSubview(tableView)
        tableView.addSubview(backButton)
        view.addSubview(buttonsView)
        buttonsView.addSubview(plusButton)
        buttonsView.addSubview(itemCountLabel)
        buttonsView.addSubview(minusButton)
        buttonsView.addSubview(totalLabel)
        buttonsView.addSubview(priceLabel)
        view.addSubview(addButton)
    }
    
    func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(631)
        }
        
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(tableView.snp.top).offset(33)
            make.leading.equalTo(tableView.snp.leading).offset(30)
            make.width.height.equalTo(24)
        }
        
        buttonsView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-102)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(79)
        }
        
        plusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(buttonsView.snp.leading).offset(26)
            make.width.height.equalTo(32)
        }
        
        itemCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(plusButton.snp.trailing).offset(22)
            make.width.equalTo(12)
            make.height.equalTo(20)
        }
        
        minusButton.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.leading.equalTo(itemCountLabel.snp.trailing).offset(20)
            make.width.height.equalTo(32)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(buttonsView.snp.centerY)
            make.trailing.equalTo(buttonsView.snp.trailing).offset(285)
            make.width.equalTo(79)
            make.height.equalTo(28)
        }
        
        totalLabel.snp.remakeConstraints { make in
            make.top.equalTo(buttonsView.snp.top).offset(9)
            make.trailing.equalTo(buttonsView.snp.trailing).offset(260)
            make.width.equalTo(51)
            make.height.equalTo(14)
        }
        
        addButton.snp.remakeConstraints { make in
            make.top.equalTo(buttonsView.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
    }
    
    func configuration() {
        if let items = delegate {
            itemInfo = ItemInfo(
                productImage: items.productImage,
                productName: items.productName)
//                productDescription: items.ProductIngredients)
        }
    }
    func setupView() {
        guard let itemInfo = itemInfo else { return }
        let headerView = ItemView(pageStruct: itemInfo)
        headerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 631)
        tableView.tableHeaderView = headerView
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goNextPage() {
        let orderVC = OrderApprovViewController()
        navigationController?.pushViewController(orderVC, animated: true)
    }
    
}

