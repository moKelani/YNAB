//
//  PayeeList.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation
struct PayeeList : Codable {
	let payees : [Payee]?
	let serverKnowledge : Int?

	enum CodingKeys: String, CodingKey {
		case payees = "payees"
		case serverKnowledge = "server_knowledge"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		payees = try values.decodeIfPresent([Payee].self, forKey: .payees)
        serverKnowledge = try values.decodeIfPresent(Int.self, forKey: .serverKnowledge)
	}

}
