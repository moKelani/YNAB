//
//  Payees.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation
struct Payee : Codable {
	let id : String?
	let name : String?
	let transferAccountId : String?
	let deleted : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case transferAccountId = "transfer_account_id"
		case deleted = "deleted"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        transferAccountId = try values.decodeIfPresent(String.self, forKey: .transferAccountId)
		deleted = try values.decodeIfPresent(Bool.self, forKey: .deleted)
	}

}
