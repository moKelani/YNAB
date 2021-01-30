//
//  YNABTabBarController.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//
import UIKit

class YNABTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.layer.borderWidth = 0.0
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = true
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .festivalGreen
        UITabBar.appearance().unselectedItemTintColor = .blackLicorice

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

