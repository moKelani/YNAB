//
//  CellReusable.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import Foundation

protocol CellReusable {
    static var identifier: String { get }
}

extension CellReusable {
    static var identifier: String {
        return "\(self)"
    }
}

