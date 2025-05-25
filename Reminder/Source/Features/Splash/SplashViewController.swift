//
//  SplashViewController.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 04/03/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    public weak var flowDelegate: SplashFlowDelegate?
    
    private let contentView: SplashView
    
    init(
        contentView: SplashView,
        flowDelegate: SplashFlowDelegate
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
        setupComponents()
        animateSplash()
    }
    
    private func setNavigationFlow() {
        if let user = UserDefaultsManager.getUser(), user.isUserSave {
            flowDelegate?.openToHome()
        } else {
            showLoginBottomSheet()
        }
    }
    
    private func setupComponents() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        setupContraints()
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
    
    private func showLoginBottomSheet() {
        animateGoToHome()
        self.flowDelegate?.openLoginBottomSheet()
    }
}

//MARK: Animations
extension SplashViewController {
    private func animateSplash() {
        UIView.animate(
            withDuration: 1.5,
            delay: 0.0,
            animations: {
                self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            },
            completion: { _ in
                self.setNavigationFlow()
            }
        )
    }
    
    private func animateGoToHome() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -140)
            }
        )
    }
}
