//
//  Accounts.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct Accounts : Codable {
    let id : String?
    let name : String?
    let type : String?
    let onBudget : Bool?
    let closed : Bool?
    let note : String?
    let balance : Int?
    let clearedBalance : Int?
    let unclearedBalance : Int?
    let transferPayeeId : String?
    let deleted : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case type = "type"
        case onBudget = "on_budget"
        case closed = "closed"
        case note = "note"
        case balance = "balance"
        case clearedBalance = "cleared_balance"
        case unclearedBalance = "uncleared_balance"
        case transferPayeeId = "transfer_payee_id"
        case deleted = "deleted"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        onBudget = try values.decodeIfPresent(Bool.self, forKey: .onBudget)
        closed = try values.decodeIfPresent(Bool.self, forKey: .closed)
        note = try values.decodeIfPresent(String.self, forKey: .note)
        balance = try values.decodeIfPresent(Int.self, forKey: .balance)
        clearedBalance = try values.decodeIfPresent(Int.self, forKey: .clearedBalance)
        unclearedBalance = try values.decodeIfPresent(Int.self, forKey: .unclearedBalance)
        transferPayeeId = try values.decodeIfPresent(String.self, forKey: .transferPayeeId)
        deleted = try values.decodeIfPresent(Bool.self, forKey: .deleted)
    }

}
