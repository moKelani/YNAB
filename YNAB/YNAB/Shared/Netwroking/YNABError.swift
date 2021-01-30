//
//  YNABError.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation

enum ErrorParser: Error {
    case statusCode
    case noResults
    case noInternetConnection
    case defaultError(error: YNABError)
    case runtimeError(String)
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No result found"
        case .noInternetConnection:
            return "No Internet Connection"
        case .statusCode:
            return "Not Valid Status Code"
        case .defaultError(let error):
            return error.details ?? "An error occurred"
        default:
            return "An error occurred"
        }
    }
}
