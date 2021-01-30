//
//  PayeeRouter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

protocol PayeeRoutable: ViewRoutable {
}

class PayeeRouter {
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
        
    }
    
}

// MARK: - PayeeRoutable
extension PayeeRouter: PayeeRoutable {
    
    
}

