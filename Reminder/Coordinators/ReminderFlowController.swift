//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 24/04/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationViewController: UINavigationController?
    private let viewControllerFactory = ViewControllerFactory()
    
    //MARK: - Start
    public func start() -> UINavigationController? {
        let splashViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationViewController =  UINavigationController(rootViewController: splashViewController)
        return navigationViewController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationViewController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue
        self.navigationViewController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheetViewController = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        self.navigationViewController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
    
    func openToHome() {
        self.navigationViewController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue
        self.navigationViewController?.pushViewController(viewController, animated: true)
    }
}
