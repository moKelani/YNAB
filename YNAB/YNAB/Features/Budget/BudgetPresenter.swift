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
    func bindToTableView(dataSource: BudgetDataSource)
}

class BudgetPresenter {
    
    // MARK: Injections
    private weak var output: BudgetPresenterOutput?
    var router: BudgetRoutable
    private var worker: BudgetWorkerProtocol?
    private var budgetDataSource: BudgetDataSource?

    // MARK: Initializer
    init(output: BudgetPresenterOutput,
         router: BudgetRoutable) {
        self.output = output
        self.router = router
        worker = BudgetWorker()
    }
    
}

// MARK: - BudgetPresenterInput
extension BudgetPresenter: BudgetPresenterInput {
    func getBudgetList(isIncludeAccount: Bool) {
        output?.showLoading()
        worker?.getBudgetList(isIncludeAccount: isIncludeAccount) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let budgets = response?.data.budgets {
                    self?.budgetDataSource = BudgetDataSource(with: budgets)
                }
                if let dataSource = self?.budgetDataSource {
                    self?.output?.bindToTableView(dataSource: dataSource)
                }
                
            case .failure(let error):
                print(error)
               // self?.output?.handle(error: error)
                
            }
        }
    }
    func viewDidLoad() {
        getBudgetList(isIncludeAccount: true)
    }
    
}

