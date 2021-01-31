//
//  BudgetDataSource.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

class BudgetDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var budgetList: [Budget]
    weak var presenter: BudgetListPresenterInput?
    
    init(with budgetList: [Budget]) {
        self.budgetList = budgetList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BudgetListTableViewCell.identifier, for: indexPath) as? BudgetListTableViewCell {
            cell.bind(budget: budgetList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router.navigateToBudgetDetails(budget: budgetList[indexPath.row])
    }
    
}
