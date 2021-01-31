//
//  BudgetPresenter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol BudgetListPresenterInput: BasePresenterInput {
    var router: BudgetRoutable { get }
}

protocol BudgetListPresenterOutput: BasePresenterOutput {
    func bindToTableView(dataSource: BudgetDataSource)
}

class BudgetListPresenter {
    
    // MARK: Injections
    private weak var output: BudgetListPresenterOutput?
    var router: BudgetRoutable
    private var worker: BudgetWorkerProtocol?
    private var budgetDataSource: BudgetDataSource?

    // MARK: Initializer
    init(output: BudgetListPresenterOutput,
         router: BudgetRoutable) {
        self.output = output
        self.router = router
        worker = BudgetWorker()
        
    }
    
}

// MARK: - BudgetPresenterInput
extension BudgetListPresenter: BudgetListPresenterInput {
    func getBudgetList(isIncludeAccount: Bool) {
        output?.showLoading()
        worker?.getBudgetList(isIncludeAccount: isIncludeAccount) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let budgets = response?.data.budgets {
                    self?.budgetDataSource = BudgetDataSource(with: budgets)
                    self?.budgetDataSource?.presenter = self
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
        getBudgetList(isIncludeAccount: false)
    }
    
}

