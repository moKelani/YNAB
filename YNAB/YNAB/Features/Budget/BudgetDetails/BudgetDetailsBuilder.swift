//
//  BudgetDetailsBuilder.swift
//  YNAB
//
//  Created by Mohamed Kelany on 31/01/2021.
//

import Foundation

class BudgetDetailsBuilder {
    static func viewController(budget: Budget) -> BudgetDetailsViewController {
        let viewController: BudgetDetailsViewController = BudgetDetailsViewController()
        let router = BudgetRouter(viewController: viewController)
        let presenter = BudgetDetailsPresenter(output: viewController, router: router)
        presenter.budget = budget
        viewController.presenter = presenter

        return viewController
    }
}
