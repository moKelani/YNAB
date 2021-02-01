//
//  UIView+EmptyState.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import UIKit

extension UIView {

    func setViewEmptyView(emptyPlaceHolderType: EmptyPlaceHolderType, action: (() -> Void)? )  {
        let frame = CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height)
        let emptyPlaceHolderView = EmptyPlaceHolderView(frame: frame)
        emptyPlaceHolderView.tag = 66
        emptyPlaceHolderView.actionFunction = action
        emptyPlaceHolderView.translatesAutoresizingMaskIntoConstraints = false
        emptyPlaceHolderView.emptyPlaceHolderType = emptyPlaceHolderType
        addSubview(emptyPlaceHolderView)
        NSLayoutConstraint.activate([
            emptyPlaceHolderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            emptyPlaceHolderView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func removeEmptyState() {
        DispatchQueue.main.async(execute: {
            if let emptyView = self.subviews.filter({ $0.tag == 66}).first as? EmptyPlaceHolderView {
                emptyView.removeFromSuperview()
            }
        })
    }
}

