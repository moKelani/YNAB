//
//  BasePresenterIO.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

protocol BasePresenterInput: class {
    func viewDidLoad()
}

protocol BaseDisplayLogic: class {
    func handle(error: YNABError)
}

protocol BasePresenterOutput: BaseDisplayLogic {
    func showLoading()
    func hideLoading()
}


extension BaseDisplayLogic where Self: UIViewController {
    
    
}



extension UIViewController: BasePresenterOutput {
    func handle(error: YNABError) {
        
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.view.startActivityIndicator()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.view.stopActivityIndicator(tag: 55)
        }
    }
}
