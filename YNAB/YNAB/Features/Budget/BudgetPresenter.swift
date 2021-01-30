//
//  BudgetPresenter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol BudgetPresenterInput: BasePresenterInput {
    
    var router: BudgetRoutable { get }
}

protocol BudgetPresenterOutput: BasePresenterOutput {
    
}

class BudgetPresenter {
    
    // MARK: Injections
    private weak var output: BudgetPresenterOutput?
    var router: BudgetRoutable

    // MARK: Initializer
    init(output: BudgetPresenterOutput,
         router: BudgetRoutable) {
        self.output = output
        self.router = router
    }
    
}

// MARK: - PayeePresenterInput
extension BudgetPresenter: BudgetPresenterInput {
    
    func viewDidLoad() {
        
    }
    
}

