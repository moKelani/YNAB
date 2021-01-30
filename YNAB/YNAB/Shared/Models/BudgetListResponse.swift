//
//  BudgetListResponse.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct BudgetListResponse : Codable {
    let budgets : [Budgets]?
    let defaultBudget : Budgets?

    enum CodingKeys: String, CodingKey {

        case budgets = "budgets"
        case defaultBudget = "default_budget"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        budgets = try values.decodeIfPresent([Budgets].self, forKey: .budgets)
        defaultBudget = try values.decodeIfPresent(Budgets.self, forKey: .defaultBudget)
    }

}
