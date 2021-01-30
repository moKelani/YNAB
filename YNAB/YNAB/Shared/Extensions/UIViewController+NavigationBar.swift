//
//  UIViewController+NavigationBar.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

extension UIViewController {

    func showDefaultNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.isNavigationBarHidden = false

        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .white

        if var textAttributes = navigationController?.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.festivalGreen
            textAttributes[NSAttributedString.Key.font] =  UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }

    }

}
