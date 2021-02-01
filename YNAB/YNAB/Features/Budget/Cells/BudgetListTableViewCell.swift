//
//  BudgetListTableViewCell.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

class BudgetListTableViewCell: UITableViewCell, CellReusable {
    
    
    // MARK: - IBOutles
    private lazy var budgetView: BudgetView = {
        let view = BudgetView()
        view.backgroundColor = .backgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(budgetView)
        setConstraints()
        //change corner radius
        budgetView.layer.cornerRadius = 10.0
    }
    
    

    // MARK: - AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //budgetView
            budgetView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            budgetView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            budgetView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            budgetView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    
    // MARK: bind
    func bind(budget: Budget) {
        budgetView.bind(with: budget)
    }
    
    


    
}
