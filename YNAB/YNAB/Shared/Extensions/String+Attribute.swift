//
//  String+Attribute.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import UIKit

extension String {
    func setLabelText(title: String) -> NSMutableAttributedString {
        let titleAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.subTitleGray]
        let valueAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.descriptionGray]
        let title = NSAttributedString(string: title, attributes: titleAttribute)
        let value = NSAttributedString(string: self, attributes: valueAttribute)
        let fullText = NSMutableAttributedString()
        fullText.append(title)
        fullText.append(value)
        
        return fullText
    }
}
