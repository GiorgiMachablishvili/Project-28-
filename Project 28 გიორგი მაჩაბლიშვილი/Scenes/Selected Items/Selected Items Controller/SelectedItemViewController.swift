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
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var AddToCart: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "addButton"), for: .normal)
        view.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return view
    }()
    
    
    var imageInfo: ImageInfo?
    var labelInfo: LabelInfo?
    var countPrice: CountPriceInfo?
    var delegate: MenuInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        configuration()
        cellsRegistration()
        animateAddToCartButton()
        
        self.tableView.separatorStyle = .none
        
        //MARK: gradient view color
        view.setGradientBackground(
            colors: [UIColor(hexString: "2C62B2"),
                     UIColor(hexString: "8152E7"),
                     UIColor(hexString: "092248"),
                    ],
            startPoint: CGPoint(x: 0, y: 0),
            endPoint: CGPoint(x: 1, y: 1))
    }
    
    //MARK: set up view
    func setup() {
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(AddToCart)
    }
    
    //MARK: set up constraints
    func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-90 * Constraint.yCoeff)
        }
        
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(45 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(30 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.yCoeff)
        }
    }
    
    func cellsRegistration() {
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(LabelViewCell.self, forCellReuseIdentifier: "labelViewCell")
        tableView.register(CountPriceCell.self, forCellReuseIdentifier: "countPriceCell")
    }
    
    //MARK: config delegat items
    func configuration() {
        if let items = delegate {
            imageInfo = ImageInfo(
                productImage: items.productImage)
            labelInfo = LabelInfo(
                imageTitle: items.productName,
                productDescription: items.ProductIngredients)
            countPrice = CountPriceInfo(
                plusButton: UIImage(named: "Plus")!,
                productCount: "1",
                minusButton: UIImage(named: "Minus")!,
                totalPriceLabel: "Total Price",
                totalPrice: items.Price)
        }
        
        AddToCart.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-41 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(30 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }
    
    //    MARK: go back button func
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //    MARK: next page button func
    @objc func nextPage() {
        let ordetVC = OrderApprovViewController()
        navigationController?.pushViewController(ordetVC, animated: true)
    }
    
    //MARK: animate AddToCart button
      func animateAddToCartButton() {
          AddToCart.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
          
          UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseInOut], animations: {
              self.AddToCart.transform = CGAffineTransform.identity
          }, completion: nil)
      }
}

extension SelectedItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.section {
            case 0:
                return 400
            case 1:
                return 150
            case 2:
                return 100
            default:
                return 44
            }
        }
    
    //MARK: tap section and shows double size image
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let cell = tableView.cellForRow(at: indexPath) as? ImageCell {
                UIView.animate(withDuration: 0.3, animations: {
                    cell.productImage.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                }, completion: { _ in
                    UIView.animate(withDuration: .infinity, animations: {
                        cell.productImage.transform = CGAffineTransform.identity
                    })
                })
            }
        }
        
        //MARK: rotation plus and minus buttons
        if indexPath.section == 2 {
            if let cell = tableView.cellForRow(at: indexPath) as? CountPriceCell {
                UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                    cell.plusButton.transform = cell.plusButton.transform.rotated(by: .pi)
                    cell.minusButton.transform = cell.minusButton.transform.rotated(by: .pi)
                }, completion: nil)
            }
        }
    }
}


extension SelectedItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            if let imageInfo = imageInfo {
                cell.configurationImage(selectView: imageInfo)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelViewCell", for: indexPath) as! LabelViewCell
            if let labelInfo = labelInfo {
                cell.configurationLabel(selectView: labelInfo)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "countPriceCell", for: indexPath) as! CountPriceCell
            if let countPrice = countPrice {
                cell.configurationCountPrice(selectView: countPrice)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}



