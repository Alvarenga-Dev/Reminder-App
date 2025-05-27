//
//  LoginBottomSheet.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 04/03/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    private let contentView: LoginBottomSheetView
    private let viewModel = LoginBottomSheetViewModel() //Futuro add por DI
    private var handleAreaHeight: CGFloat = 50.0
    
    init(
        contentView: LoginBottomSheetView,
        flowDelegate: LoginBottomSheetFlowDelegate
    ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindView()
        setup()
        bindViewModel()
    }
    
    private func setupBindView() {
        contentView.delegate = self
        self.view.addSubview(contentView)
    }
    
    private func setup() {
        setupContraints()
    }
    
    private func setupContraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func bindViewModel() {
        viewModel.successResult = { [weak self] email in
            self?.setAlertActionSaveLogin(email: email)
        }
        
        viewModel.errorResult = { [weak self] error in
            self?.setAlertErrorMessage(message: error)
        }
    }
    
    private func setAlertActionSaveLogin(email: String) {
        let alertController = UIAlertController(
            title: "Deseja salvar o login?",
            message: "Faça isso para que você possa entrar mais rápido na próxima vez",
            preferredStyle: .alert
        )
        
        let actionButtonSaveLogin = UIAlertAction(title: "Sim", style: .default) { _ in
            let user = User(email: email, isUserSave: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let actionButtonCancel = UIAlertAction(title: "Não", style: .cancel)
        
        alertController.addAction(actionButtonSaveLogin)
        alertController.addAction(actionButtonCancel)
        
        self.present(alertController, animated: true)
    }
    
    private func setAlertErrorMessage(message: String) {
        let alertError = UIAlertController(
            title: "Ops... parece que você teve algum problema",
            message: "O erro apresentado é: \n\n \(message) \n\n Tente novamente.",
            preferredStyle: .alert
        )
        alertError.addAction(
            UIAlertAction(title: "Ok", style: .default)
        )
        self.present(alertError, animated: true)
    }
    
    internal func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}


extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginRequest(user: String, password: String) {
        viewModel.doAuth(user: user, password: password)
    }
}
