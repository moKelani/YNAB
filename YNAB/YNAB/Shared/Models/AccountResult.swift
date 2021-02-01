//
//  AccountResult.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

struct AccountResult: Codable {
    let account : Account?
    let serverKnowledge: Int?

    enum CodingKeys: String, CodingKey {
        case account = "account"
        case serverKnowledge = "server_knowledge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        account = try values.decodeIfPresent(Account.self, forKey: .account)
        serverKnowledge = try values.decodeIfPresent(Int.self, forKey: .serverKnowledge)
    }

}
