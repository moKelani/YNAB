//
//  BudgetList.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

enum BudgetNetworking {
    case getBudgetList(_ isIncludeAccount: Bool)
    case getAccountList(_ budgetId: String)
}

extension BudgetNetworking: TargetType {
    var baseURL: String {
        return "https://api.youneedabudget.com/v1/budgets"
    }
    var path: String {
        switch self {
        case .getBudgetList(let isIncludeAccount):
            return "?include_accounts=\(isIncludeAccount)"
        case .getAccountList(let budgetId):
            return "/\(budgetId)/accounts"
        }
    }
    var method: HTTPMethod {
        return .get
    }
    var task: Task {
        return .requestPlain
    }
    var headers: [String : String]? {
        return ["accept": "application/json", "Authorization": "Bearer beeee8e79aaa0dc8a22d47865c0538fbcd59c918c51f2ea6b16a360abdb925d0"]
    }
}
