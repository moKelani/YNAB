//
//  AccountList.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

struct AccountList : Codable {
    let accounts : [Account]?
    let serverKnowledge: Int?

    enum CodingKeys: String, CodingKey {
        case accounts = "accounts"
        case serverKnowledge = "server_knowledge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accounts = try values.decodeIfPresent([Account].self, forKey: .accounts)
        serverKnowledge = try values.decodeIfPresent(Int.self, forKey: .serverKnowledge)
    }

}
