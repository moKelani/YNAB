//
//  BaseResponse.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var data: T?
    var errors: YNABErrors?
}

struct YNABErrors: Codable {
    let id: String?
    let name: String?
    let details: String?

}
