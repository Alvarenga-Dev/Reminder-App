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
    
    private let contentView: LoginBottomSheetView //Futuro add por DI
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
        
        contentView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupContraints()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func bindViewModel() {
        viewModel.successResult = { [weak self] user in
            self?.flowDelegate?.navigateToHome()
        }
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
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
