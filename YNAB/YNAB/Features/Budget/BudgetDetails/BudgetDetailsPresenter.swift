//
//  BudgetDetailsPresenter.swift
//  YNAB
//
//  Created by Mohamed Kelany on 31/01/2021.
//

import Foundation

protocol BudgetDetailsPresenterInput: BasePresenterInput {
    var router: BudgetRoutable { get }
    func getAccountList(budgetID: String)
}

protocol BudgetDetailsPresenterOutput: BasePresenterOutput {
    func bind(budget: Budget)
    func bindToCollectionvView(dataSource: AccountDataSource)
}

class BudgetDetailsPresenter {
    
    // MARK: Injections
    private weak var output: BudgetDetailsPresenterOutput?
    var router: BudgetRoutable
    private var worker: BudgetWorkerProtocol?
    private var accountDataSource: AccountDataSource?
    var budget: Budget?

    // MARK: Initializer
    init(output: BudgetDetailsPresenterOutput,
         router: BudgetRoutable) {
        self.output = output
        self.router = router
        worker = BudgetWorker()
    }
    
}

// MARK: - BudgetPresenterInput
extension BudgetDetailsPresenter: BudgetDetailsPresenterInput {
    func getAccountList(budgetID: String) {
        output?.showLoading()
        worker?.getAccountList(budgetId: budgetID) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let accounts = response?.data.accounts {
                    let sortedAccountList = accounts.filter({$0.closed == false}).sorted(by: { $0.balance > $1.balance })
                    self?.accountDataSource = AccountDataSource(with: sortedAccountList, currencySymbol: self?.budget?.currencyFormat?.currencySymbol)
                }
                if let dataSource = self?.accountDataSource {
                    self?.output?.bindToCollectionvView(dataSource: dataSource)
                }
                
            case .failure(let error):
                print(error)
               // self?.output?.handle(error: error)
                
            }
        }
    }
    
    

    func viewDidLoad() {
        //sending budget info
        if let budget = budget {
            output?.bind(budget: budget)
        }
        
        if let id = budget?.id {
            let budgetDetailsQueue = OperationQueue()
            let accountOperation = BlockOperation {
                self.getAccountList(budgetID: id)

            }
            let payeeOperation = BlockOperation {
                self.getAccountList(budgetID: id)
            }
            payeeOperation.addDependency(accountOperation)
            budgetDetailsQueue.addOperation(accountOperation)
            budgetDetailsQueue.addOperation(payeeOperation)
        }
    }
    
}


