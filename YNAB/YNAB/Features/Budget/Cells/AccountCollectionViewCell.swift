//
//  AccountCollectionViewCell.swift
//  YNAB
//
//  Created by Mohamed Kelany on 31/01/2021.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell, CellReusable {
    
    // MARK: - IBOutles
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        contentView.addSubview(infoStackView)
        [nameLabel, typeLabel, balanceLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        setConstraints()
        
    }
    
    
    
    // MARK: - AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //budgetView
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    
    // MARK: bind
    func bindAccount(account: Account, symbol: String?) {
        if let name = account.name {
            nameLabel.attributedText = name.setLabelText(title: "Name: ")
        }
        if let type = account.type {
            typeLabel.attributedText = type.setLabelText(title: "Type: ")
        }
        
        if let symbol =  symbol {
            balanceLabel.attributedText = "\(account.balance)".setLabelText(title: "Balance: \(symbol)")
        }
        
        //change corner radius
        self.layer.cornerRadius = 10.0
        self.backgroundColor = .background2Gray

    }
    
    func bindPayee(payee: Payee) {
        if let name = payee.name {
            nameLabel.attributedText = name.setLabelText(title: "Name: ")
        }
        //change corner radius
        self.layer.cornerRadius = 10.0
        self.backgroundColor = .background2Gray
        typeLabel.isHidden = true
        balanceLabel.isHidden = true
    }
}
