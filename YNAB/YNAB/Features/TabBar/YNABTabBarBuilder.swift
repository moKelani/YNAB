//
//  YNABTabBar.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

class YNABTabBarBuilder {

    static func viewController() -> YNABTabBarController {

        let viewController: YNABTabBarController = YNABTabBarController()

        let budgetListVC = BudgetListBuilder.viewController()

        budgetListVC.tabBarItem = UITabBarItem(title: "Budgets", image: UIImage(named: "budget"), selectedImage: UIImage(named: "budget"))

        let payeeTransactionVC = PayeeBuilder.viewController()
        payeeTransactionVC.tabBarItem = UITabBarItem(title: "Payee", image: UIImage(named: "payee"), selectedImage: UIImage(named: "payee"))

        let tabBarList = [
        UINavigationController(rootViewController: budgetListVC),
        UINavigationController(rootViewController: payeeTransactionVC)
        ]

        tabBarList.forEach { navigationController in
            navigationController.interactivePopGestureRecognizer?.delegate = nil
        }

        viewController.viewControllers = tabBarList
        return viewController
    }
}
