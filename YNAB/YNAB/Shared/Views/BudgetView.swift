//
//  BudgetView.swift
//  YNAB
//
//  Created by Mohamed Kelany on 31/01/2021.
//

import UIKit

class BudgetView: UIView {

    // MARK: - IBOutles
    private lazy var baseInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .titleGray
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var numberFormatLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var CurrencySymbolLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var LastModifiedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        self.addSubview(baseInfoView)
        [nameLabel,infoStackView].forEach {
            baseInfoView.addSubview($0)
        }
        [currencyLabel, numberFormatLabel, CurrencySymbolLabel, LastModifiedLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        setConstraints()
        

    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //baseInfoView
            baseInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            baseInfoView.topAnchor.constraint(equalTo: self.topAnchor),
            baseInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            baseInfoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            //nameLabel
            nameLabel.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: baseInfoView.topAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: infoStackView.topAnchor, constant: -16),
            //infoStackView
            infoStackView.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            infoStackView.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -8),
            infoStackView.bottomAnchor.constraint(equalTo: baseInfoView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: bind
    func bind(with budget: Budget) {
        nameLabel.text = budget.name
        if let isoCode = budget.currencyFormat?.isoCode {
            currencyLabel.attributedText = isoCode.setLabelText(title: "Currency: ")
        }
        if let numberFormat = budget.currencyFormat?.exampleFormat {
            numberFormatLabel.attributedText = numberFormat.setLabelText(title: "Number Format: ")
        }
        
        if let currencyFormat = budget.currencyFormat?.currencySymbol {
            CurrencySymbolLabel.attributedText = currencyFormat.setLabelText(title: "Currency Format: ")
        }
        
        if let lastModified = budget.lastModifiedOn {
            LastModifiedLabel.attributedText = lastModified.formateDate().setLabelText(title: "Last Modified On: ")
        }
    }
}
