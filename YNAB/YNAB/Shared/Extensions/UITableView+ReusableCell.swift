//
//  UITableView+ReusableCell.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: CellReusable>(for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
