//
//  CreateAccountPresenter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

protocol CreateAccountPresenterInput: BasePresenterInput {
    func createAccount(name: String, type: String, balance: String)
}

protocol CreateAccountPresenterOutput: BasePresenterOutput {
    func accountCreate()
}

class CreateAccountPresenter {
    
    // MARK: Injections
    private weak var output: CreateAccountPresenterOutput?
    private var worker: CreateAccountWorkerProtocol?
    var budgetId: String?

    // MARK: Initializer
    init(output: CreateAccountPresenterOutput) {
        self.output = output
        worker = CreateAccountWorker()
        
    }
    
}

// MARK: - BudgetPresenterInput
extension CreateAccountPresenter: CreateAccountPresenterInput {
    func createAccount(name: String, type: String, balance: String) {
        guard let budgetId = budgetId else { return }
        output?.showLoading()
        worker?.createAccount(budgetId: budgetId, name: name, type: type, balance: balance) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let _ = response {
                    self?.output?.accountCreate()
                }
            case .failure(let error):
                print(error)
               // self?.output?.handle(error: error)
                
            }
        }
    }
    
    
    

    func viewDidLoad() {
    }
    
}


