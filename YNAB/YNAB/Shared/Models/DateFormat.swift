//
//  DateFormat.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct DateFormat : Codable {
    let format : String?

    enum CodingKeys: String, CodingKey {
        case format = "format"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        format = try values.decodeIfPresent(String.self, forKey: .format)
    }

}
