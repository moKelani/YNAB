//
//  BudgetListViewController.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

class BudgetListViewController: UIViewController {
    // MARK:- Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BudgetListTableViewCell.self, forCellReuseIdentifier: BudgetListTableViewCell.identifier)
        return tableView
    }()
    // MARK: Injections
    var presenter: BudgetListPresenterInput!
   // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        setConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showLargeNavigationBar()
        title = "Budget List"
        presenter.viewDidLoad()
    }

    // MARK: AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //tableView
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Methods
}

extension BudgetListViewController: BudgetListPresenterOutput {
    func bindToTableView(dataSource: BudgetDataSource) {
        DispatchQueue.main.async {
            self.tableView.delegate = dataSource
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }
}
