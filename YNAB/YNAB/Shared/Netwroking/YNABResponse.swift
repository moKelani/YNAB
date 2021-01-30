//
//  BaseResponse.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation

struct YNABDataResponse<T: Codable>: Codable {
    let data: T
    
}


struct YNABErrorResponse: Codable {
    let error: YNABError
}
struct YNABError: Codable {
    let id: String?
    let name: String?
    let details: String?
}
