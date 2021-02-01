//
//  UIViewController+NavigationBar.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

extension UIViewController {
    
    // you can use that function for setting navigation bar items in the top right of navigation bar
    func rightNavBarItems(_ buttons: UIBarButtonItem...) {
        navigationItem.rightBarButtonItems = buttons
    }

    func hideLargeTitleNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func showLargeTitleNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func prepareNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showLargeNavigationBar() {
        prepareNavigationBar()
        navigationController?.navigationBar.largeTitleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)]
        showLargeTitleNavigationBar()
    }

    func showDefaultNavigationBar() {
        prepareNavigationBar()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)]
        hideLargeTitleNavigationBar()
        
    }
    
    
}
