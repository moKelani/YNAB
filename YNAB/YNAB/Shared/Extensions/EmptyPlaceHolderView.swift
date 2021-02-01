//
//  EmptyPlaceHolderView.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

enum EmptyPlaceHolderType {
    case noInternetConnection
    case emptyRecord
    case error(message: String)
    case search

}
protocol EmptyActionDelegate {
    func didTappedActionButton()
}

class EmptyPlaceHolderView: UIView {
    
    var actionFunction: (() -> Void)?

    var emptyPlaceHolderType: EmptyPlaceHolderType = .noInternetConnection {
        didSet {
            switch emptyPlaceHolderType {
            case .noInternetConnection:
                titleLabel.text = "No Internet"
                logoImageView.image = UIImage(named: "retry")
            case .error(let message):
                titleLabel.text = message
                logoImageView.image = UIImage(named: "retry")
            case .search:
                titleLabel.text = "Search"
                logoImageView.image = UIImage(named: "search_icon")
            case .emptyRecord:
                titleLabel.text = "No Records"
            }
        }
    }

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = nil
        return imageView
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(labelsStackView)
        stackView.addArrangedSubview(actionButton)
        return stackView
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing =  0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    @objc func actionButtonTapped() {
        if actionFunction != nil {
            actionFunction!()
        }
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .clear
        addSubview(contentStackView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
