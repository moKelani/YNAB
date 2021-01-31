//
//  BudgetListResponse.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

struct BudgetList : Codable {
    let budgets : [Budget]?
    let defaultBudget : Budget?

    enum CodingKeys: String, CodingKey {

        case budgets = "budgets"
        case defaultBudget = "default_budget"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        budgets = try values.decodeIfPresent([Budget].self, forKey: .budgets)
        defaultBudget = try values.decodeIfPresent(Budget.self, forKey: .defaultBudget)
    }

}
