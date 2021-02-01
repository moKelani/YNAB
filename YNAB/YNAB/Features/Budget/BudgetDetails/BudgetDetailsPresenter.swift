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
    func getPayeeList(budgetID: String)
    func onTappedCreateAccount()
}

protocol BudgetDetailsPresenterOutput: BasePresenterOutput {
    func bind(budget: Budget)
    func bindToCollectionvView(dataSource: BudgetDetailsDataSource)
}

class BudgetDetailsPresenter {
    
    // MARK: Injections
    private weak var output: BudgetDetailsPresenterOutput?
    var router: BudgetRoutable
    private var worker: BudgetWorkerProtocol?
    private var budgetDetailsDataSource: BudgetDetailsDataSource?
    var budget: Budget?
    var payeeList: [Payee]?
    var accountList: [Account]?

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
    func getPayeeList(budgetID: String) {
        output?.showLoading()
        worker?.getPayeeList(budgetId: budgetID) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let payees = response?.data.payees {
                    self?.payeeList = payees
                }
                self?.handleDataSource(accountList: self?.accountList, payeeList: self?.payeeList,  currencySymbol: self?.budget?.currencyFormat?.currencySymbol)
            case .failure(let error):
                print(error)
                self?.payeeList = []
                self?.handleDataSource(accountList: self?.accountList, payeeList: self?.payeeList,  currencySymbol: self?.budget?.currencyFormat?.currencySymbol)
            }
        }
    }
    
    func getAccountList(budgetID: String) {
        output?.showLoading()
        worker?.getAccountList(budgetId: budgetID) { [weak self] result  in
            self?.output?.hideLoading()
            switch result {
            case .success(let response):
                if let accounts = response?.data.accounts {
                    let sortedAccountList = accounts.filter({$0.closed == false}).sorted(by: { $0.balance > $1.balance })
                    self?.accountList = sortedAccountList
                }
                self?.getPayeeList(budgetID: budgetID)
            case .failure(let error):
                self?.accountList = []
                self?.getPayeeList(budgetID: budgetID)
                print(error)
            }
        }
    }
    func handleBudgetDetails() {
        if let id = budget?.id {
            getAccountList(budgetID: id)
        }
    }
    func handleDataSource(accountList: [Account]?, payeeList: [Payee]?,  currencySymbol: String?) {
        budgetDetailsDataSource = BudgetDetailsDataSource(with: accountList ?? [], payeeList: payeeList ?? [], currencySymbol: currencySymbol ?? nil)
        if let dataSource = budgetDetailsDataSource {
            output?.bindToCollectionvView(dataSource: dataSource)
        }
    }
    func viewDidLoad() {
        //sending budget info
        if let budget = budget {
            output?.bind(budget: budget)
        }
        handleBudgetDetails()
    }
    
    func onTappedCreateAccount() {
        if let budgetId = budget?.id {
            router.navigateToCreateAccount(budgetId: budgetId)
        }
        
    }
}


