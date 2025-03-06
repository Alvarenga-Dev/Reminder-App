//
//  SplashViewController.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 04/03/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView() //Futuro add por DI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        setupContraints()
        setupGesture()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheetViewController = LoginBottomSheetViewController()
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
}
