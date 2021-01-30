//
//  BudgetWorker.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol BudgetWorkerProtocol {
    func getBudgetList(isIncludeAccount: Bool, completion: @escaping (Result<YNABDataResponse<BudgetListResponse>?, ErrorParser>) -> Void)
}

class BudgetWorker: APIService<BudgetNetworking>, BudgetWorkerProtocol {
    func getBudgetList(isIncludeAccount: Bool, completion: @escaping (Result<YNABDataResponse<BudgetListResponse>?, ErrorParser>) -> Void) {
        fetchData(target: .getBudgetList(isIncludeAccount), responseClass: BudgetListResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
