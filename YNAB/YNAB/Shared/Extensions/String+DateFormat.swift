//
//  String+DateFormat.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import Foundation

extension String {
    func formateDate() -> String {
        if let nextDate = self.components(separatedBy: "T").first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: nextDate)
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return  dateFormatter.string(from: date!)
        }
        return ""
    }
}
