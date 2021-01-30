//
//  PayeePresenter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol PayeePresenterInput: BasePresenterInput {
    
    var router: PayeeRoutable { get }
}

protocol PayeePresenterOutput: BasePresenterOutput {
    
}

class PayeePresenter {
    
    // MARK: Injections
    private weak var output: PayeePresenterOutput?
    var router: PayeeRoutable

    // MARK: Initializer
    init(output: PayeePresenterOutput,
         router: PayeeRoutable) {
        self.output = output
        self.router = router
    }
    
}

// MARK: - PayeePresenterInput
extension PayeePresenter: PayeePresenterInput {
    
    func viewDidLoad() {
        
    }
    
}
