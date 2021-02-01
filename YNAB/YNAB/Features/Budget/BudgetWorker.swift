//
//  BudgetWorker.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol BudgetWorkerProtocol {
    func getBudgetList(isIncludeAccount: Bool, completion: @escaping (Result<YNABDataResponse<BudgetList>?, ErrorParser>) -> Void)
    func getAccountList(budgetId: String, completion: @escaping (Result<YNABDataResponse<AccountList>?, ErrorParser>) -> Void)
    func getPayeeList(budgetId: String, completion: @escaping (Result<YNABDataResponse<PayeeList>?, ErrorParser>) -> Void)
}

class BudgetWorker: APIService<BudgetNetworking>, BudgetWorkerProtocol {
    func getPayeeList(budgetId: String, completion: @escaping (Result<YNABDataResponse<PayeeList>?, ErrorParser>) -> Void) {
        fetchData(target: .getAccountList(budgetId), responseClass: PayeeList.self) { (result) in
            completion(result)
        }
    }
    
    func getAccountList(budgetId: String, completion: @escaping (Result<YNABDataResponse<AccountList>?, ErrorParser>) -> Void) {
        fetchData(target: .getAccountList(budgetId), responseClass: AccountList.self) { (result) in
            completion(result)
        }
    }
    
    func getBudgetList(isIncludeAccount: Bool, completion: @escaping (Result<YNABDataResponse<BudgetList>?, ErrorParser>) -> Void) {
        fetchData(target: .getBudgetList(isIncludeAccount), responseClass: BudgetList.self) { (result) in
            completion(result)
        }
    }
    
    
}
