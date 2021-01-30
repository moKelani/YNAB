//
//  CurrencyFormat.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct CurrencyFormat : Codable {
    let isoCode : String?
    let exampleFormat : String?
    let decimalDigits : Int?
    let decimalSeparator : String?
    let symbolFirst : Bool?
    let groupSeparator : String?
    let currencySymbol : String?
    let displaySymbol : Bool?

    enum CodingKeys: String, CodingKey {

        case isoCode = "iso_code"
        case exampleFormat = "example_format"
        case decimalDigits = "decimal_digits"
        case decimalSeparator = "decimal_separator"
        case symbolFirst = "symbol_first"
        case groupSeparator = "group_separator"
        case currencySymbol = "currency_symbol"
        case displaySymbol = "display_symbol"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isoCode = try values.decodeIfPresent(String.self, forKey: .isoCode)
        exampleFormat = try values.decodeIfPresent(String.self, forKey: .exampleFormat)
        decimalDigits = try values.decodeIfPresent(Int.self, forKey: .decimalDigits)
        decimalSeparator = try values.decodeIfPresent(String.self, forKey: .decimalSeparator)
        symbolFirst = try values.decodeIfPresent(Bool.self, forKey: .symbolFirst)
        groupSeparator = try values.decodeIfPresent(String.self, forKey: .groupSeparator)
        currencySymbol = try values.decodeIfPresent(String.self, forKey: .currencySymbol)
        displaySymbol = try values.decodeIfPresent(Bool.self, forKey: .displaySymbol)
    }

}
