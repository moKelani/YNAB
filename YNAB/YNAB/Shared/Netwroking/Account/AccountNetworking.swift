//
//  AccountNetworking.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation
import Alamofire

enum AccountNetworking {
    case createAccount(_ budgetId: String,_ name: String,_ type: String,_ balance: String)
}

extension AccountNetworking: TargetType {
    var baseURL: String {
        return "https://api.youneedabudget.com/v1/budgets"
    }
    var path: String {
        switch self {
        case .createAccount(let budgetId,_,_,_):
            return "/\(budgetId)/accounts"
        }
    }
    var method: HTTPMethod {
        return .post
    }
    var task: Task {
        switch self {
        case .createAccount(_, let name, let type, let balance):
            return .requestParameters(["account": ["name": name,"type": type,"balance": Int(balance) ?? 0]], JSONEncoding.default)
        }
        
    }
    var headers: [String : String]? {
        return ["accept": "application/json", "Authorization": "Bearer beeee8e79aaa0dc8a22d47865c0538fbcd59c918c51f2ea6b16a360abdb925d0"]
    }
}
