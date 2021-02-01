//
//  CreateAccountBuilder.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

class CreateAccountBuilder {
    static func viewController(budgetId: String) -> CreateAccountViewController {
        let viewController: CreateAccountViewController = CreateAccountViewController()
        let presenter = CreateAccountPresenter(output: viewController)
        presenter.budgetId = budgetId
        viewController.presenter = presenter

        return viewController
    }
}
