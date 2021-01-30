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
        UITabBar.appearance().barTintColor = UIColor(named: "BackgroundColor") ?? .white
        UITabBar.appearance().tintColor = UIColor(named: "green") ?? .green
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "gray") ?? .black

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

