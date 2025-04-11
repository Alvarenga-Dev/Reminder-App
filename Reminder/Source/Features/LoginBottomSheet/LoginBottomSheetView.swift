//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 04/03/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    public weak var delegate: LoginBottomSheetViewDelegate? // weak -> Prevents strong reference cycles (memory leaks)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "login.email.title".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "login.password.title".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(
            self,
            action: #selector(loginButtonDidTapped),
            for: .touchUpInside
        )
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = .white
        button.layer.cornerRadius = Metrics.medium
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),
            
            emailLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            emailLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),

            emailTextField.topAnchor.constraint(
                equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),
            emailTextField.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -Metrics.extraLarge),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),
            
            passwordTextField.topAnchor.constraint(
                equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),
            passwordTextField.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -Metrics.extraLarge),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            loginButton.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -Metrics.huge),
            loginButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: Metrics.extraLarge),
            loginButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -Metrics.extraLarge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
    
    @objc
    private func loginButtonDidTapped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        delegate?.sendLoginRequest(user: user, password: password)
    }
}
