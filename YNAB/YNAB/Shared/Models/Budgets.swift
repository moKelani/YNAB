//
//  Budgets.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct Budgets : Codable {
    let id : String?
    let name : String?
    let lastModifiedOn : String?
    let firstMonth : String?
    let lastMonth : String?
    let dateFormat : DateFormat?
    let currencyFormat : CurrencyFormat?
    let accounts : [Accounts]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case lastModifiedOn = "last_modified_on"
        case firstMonth = "first_month"
        case lastMonth = "last_month"
        case dateFormat = "date_format"
        case currencyFormat = "currency_format"
        case accounts = "accounts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        lastModifiedOn = try values.decodeIfPresent(String.self, forKey: .lastModifiedOn)
        firstMonth = try values.decodeIfPresent(String.self, forKey: .firstMonth)
        lastMonth = try values.decodeIfPresent(String.self, forKey: .lastMonth)
        dateFormat = try values.decodeIfPresent(DateFormat.self, forKey: .dateFormat)
        currencyFormat = try values.decodeIfPresent(CurrencyFormat.self, forKey: .currencyFormat)
        accounts = try values.decodeIfPresent([Accounts].self, forKey: .accounts)
    }

}
