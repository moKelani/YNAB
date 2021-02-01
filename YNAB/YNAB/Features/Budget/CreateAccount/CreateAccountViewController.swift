//
//  CreateAccountViewController.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import UIKit

class CreateAccountViewController: UIViewController {
    // MARK: - IBOutles
    private lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        return textField
    }()
    private lazy var typeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Type"
        return textField
    }()
    private lazy var balanceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Balance"
        return textField
    }()
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subnit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onTappedSubmit), for: .touchUpInside)
        button.backgroundColor = .background2Gray
        return button
    }()
    // MARK: Injections
    var presenter: CreateAccountPresenterInput!
   // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDefaultNavigationBar()
        title = "Create Account"
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(inputStackView)
        [nameTextField, typeTextField, balanceTextField, submitButton].forEach{
            inputStackView.addArrangedSubview($0)
        }
        setConstraints()
    }

    // MARK: AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //tableView
            inputStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.heightAnchor.constraint(equalToConstant: 46),
            inputStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            inputStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: Actions
    
    @objc func onTappedSubmit() {
        guard let name = nameTextField.text, let type = typeTextField.text, let balance = balanceTextField.text, !name.isEmpty, !type.isEmpty, !balance.isEmpty else {
            showAlert(alertText: "Inputs", alertMessage: "Fields must not be Empty")
            return
        }
        presenter.createAccount(name: name, type: type, balance: balance)
    }
    
   

}
extension CreateAccountViewController: CreateAccountPresenterOutput {
    func accountCreate() {
        self.showAlert(alertText: "Create Account", alertMessage: "account created successfully")
        dismiss(animated: true, completion: nil)
    }
    
    
}
