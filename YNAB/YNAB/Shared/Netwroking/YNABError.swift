//
//  YNABError.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation

enum YNABError: Error, Equatable {
    case failedConnection(message: FailedEnumError) //404 error according to api document
    case underStoodRequest // 400 error according to api document
    case statusCode
    case noResults
    case noInternetConnection
    case defaultError
    case runtimeError(String)
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No result found"
        case .noInternetConnection:
            return "No Internet Connection"
        case .statusCode:
            return "Not Valid Status Code"
        case .underStoodRequest:
            return "The request could not be understood due to malformed syntax or validation error(s)."
        case .failedConnection(let message):
            return message.rawValue
        case .defaultError:
            return "An error occurred"
        default:
            return "An error occurred"
        }
    }
}

enum FailedEnumError: String {
    case budget = "The specified budget was not found"
    case payee = "No payees locations were found"
}
