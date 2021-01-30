//
//  BudgetListTableViewCell.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

class BudgetListTableViewCell: UITableViewCell, CellReusable {
    
    private lazy var baseInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
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
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var numberFormatLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var CurrencySymbolLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var LastModifiedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Intializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setUpUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI() {
        contentView.addSubview(baseInfoView)
        [nameLabel,infoStackView].forEach {
            baseInfoView.addSubview($0)
        }
        [currencyLabel, numberFormatLabel, CurrencySymbolLabel, LastModifiedLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        setConstraints()
        
        baseInfoView.layer.cornerRadius = 4.0
    }
    
    

    // MARK: - AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //baseInfoView
            baseInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            baseInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            baseInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            baseInfoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

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
    func bind(budget: Budgets) {
        nameLabel.text = budget.name
        if let isoCode = budget.currencyFormat?.isoCode {
            currencyLabel.attributedText = setLabelText(title: "Currency: ", value: isoCode)
        }
        if let numberFormat = budget.currencyFormat?.exampleFormat {
            numberFormatLabel.attributedText = setLabelText(title: "Number Format: ", value: numberFormat)
        }
        
        if let currencyFormat = budget.currencyFormat?.currencySymbol {
            CurrencySymbolLabel.attributedText = setLabelText(title: "Currency Format: ", value: currencyFormat)
        }
        
        if let lastModified = budget.lastModifiedOn {
            LastModifiedLabel.attributedText = setLabelText(title: "Last Modified On: ", value: formateDate(date: lastModified))
        }
        
        
        
    }
    
    private func setLabelText(title: String, value: String) -> NSMutableAttributedString {
        let titleAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.subTitleGray]
        let valueAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.descriptionGray]
        let title = NSAttributedString(string: title, attributes: titleAttribute)
        let value = NSAttributedString(string: value, attributes: valueAttribute)
        let fullText = NSMutableAttributedString()
        fullText.append(title)
        fullText.append(value)
        
        return fullText
    }
    
    private func formateDate(date: String) -> String {
        if let nextDate = date.components(separatedBy: "T").first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: nextDate)
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return  dateFormatter.string(from: date!)
        }
        return ""
    }


    
}
