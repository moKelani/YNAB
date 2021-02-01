//
//  BudgetRouter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

protocol BudgetRoutable: ViewRoutable {
    func navigateToBudgetDetails(budget: Budget)
    func navigateToCreateAccount(budgetId: String)
}
class BudgetRouter {
    // MARK: Injections
    weak var viewController: UIViewController?
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
// MARK: - BudgetRoutable
extension BudgetRouter: BudgetRoutable {
    func navigateToBudgetDetails(budget: Budget) {
        let budgetDetailsViewController = BudgetDetailsBuilder.viewController(budget: budget)
        viewController?.navigationController?.pushViewController(budgetDetailsViewController, animated: true)
    }
    
    func navigateToCreateAccount(budgetId: String) {
        let createAccountViewController = CreateAccountBuilder.viewController(budgetId: budgetId)
        viewController?.navigationController?.pushViewController(createAccountViewController, animated: true)
    }
}


