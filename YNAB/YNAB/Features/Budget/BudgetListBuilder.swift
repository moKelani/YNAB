//
//  BudgetListBuilder.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

class BudgetListBuilder {
    static func viewController() -> BudgetListViewController {

        let viewController: BudgetListViewController = BudgetListViewController()
        
        let router = BudgetRouter(viewController: viewController)
        
        let presenter = BudgetPresenter(output: viewController, router: router)
        
        viewController.presenter = presenter

        return viewController
    }
}

