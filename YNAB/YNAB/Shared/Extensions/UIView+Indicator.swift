//
//  UIView+Indicator.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

extension UIView {

    func startActivityIndicator(location: CGPoint? = nil) {

        let height: CGFloat = 65

        DispatchQueue.main.async(execute: {

            let loc = location ?? self.center

            // Create the activity indicator
            let loadingIndicatorView: UIActivityIndicatorView = {
                let style: UIActivityIndicatorView.Style = {
                    return .medium
                }()

                let indicatorView = UIActivityIndicatorView(style: style)
                indicatorView.color = .black
                indicatorView.translatesAutoresizingMaskIntoConstraints = false
                return indicatorView
            }()

            // Add the tag so we can find the view in order to remove it later
            loadingIndicatorView.tag = 55
            loadingIndicatorView.center = loc
            loadingIndicatorView.hidesWhenStopped = true

            loadingIndicatorView.startAnimating()
            self.addSubview(loadingIndicatorView)
            loadingIndicatorView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
            loadingIndicatorView.layer.cornerRadius = 5

            NSLayoutConstraint.activate([
                loadingIndicatorView.widthAnchor.constraint(equalToConstant: height),
                loadingIndicatorView.heightAnchor.constraint(equalTo: loadingIndicatorView.widthAnchor),
                loadingIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                loadingIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
            loadingIndicatorView.layoutIfNeeded()
            loadingIndicatorView.backgroundColor = .clear

        })
    }

    func stopActivityIndicator(tag: Int) {
        DispatchQueue.main.async(execute: {
            if let loadingIndicatorView = self.subviews.filter({ $0.tag == tag}).first as? UIActivityIndicatorView {
                loadingIndicatorView.stopAnimating()
                loadingIndicatorView.removeFromSuperview()
            }
        })
    }
}
