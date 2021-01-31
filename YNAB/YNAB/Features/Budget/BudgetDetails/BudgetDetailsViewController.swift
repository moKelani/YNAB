//
//  BudgetDetailsViewController.swift
//  YNAB
//
//  Created by Mohamed Kelany on 31/01/2021.
//

import UIKit

class BudgetDetailsViewController: UIViewController {
    // MARK: IBOutlets
    private lazy var budgetView: BudgetView = {
        let view = BudgetView()
        view.backgroundColor = .backgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        return collectionView
    }()
    // MARK: Injections
    var presenter: BudgetDetailsPresenterInput!
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
      setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    // MARK: - Methods
    private func setupUI() {
        showDefaultNavigationBar()
        view.backgroundColor = .white
        view.addSubview(budgetView)
        view.addSubview(collectionView)
        setConstraints()
    }
    
    // MARK: - AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //budgetView
            budgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            budgetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            budgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            budgetView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -8),
            //collectionView
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.topAnchor, constant: -8),
        ])
    }
}
extension BudgetDetailsViewController: BudgetDetailsPresenterOutput {
    func bindToCollectionvView(dataSource: AccountDataSource) {
        DispatchQueue.main.async {
            self.collectionView.delegate = dataSource
            self.collectionView.dataSource = dataSource
            self.collectionView.reloadData()
        }
    }
    func bind(budget: Budget) {
        budgetView.bind(with: budget)
    }
}
