//
//  CreateAccountWorker.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

protocol CreateAccountWorkerProtocol {
    func createAccount(budgetId: String, name: String, type: String, balance: String, completion: @escaping (Result<YNABDataResponse<AccountList>?, ErrorParser>) -> Void)
}

class CreateAccountWorker: APIService<AccountNetworking>, CreateAccountWorkerProtocol {
    func createAccount(budgetId: String, name: String, type: String, balance: String, completion: @escaping (Result<YNABDataResponse<AccountList>?, ErrorParser>) -> Void) {
        fetchData(target: .createAccount(budgetId, name, type, balance), responseClass: AccountList.self) { (result) in
            completion(result)
        }
    }
}
