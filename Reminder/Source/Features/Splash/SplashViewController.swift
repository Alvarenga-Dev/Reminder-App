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
        self.flowDelegate?.openLoginBottomSheet()
    }
}
