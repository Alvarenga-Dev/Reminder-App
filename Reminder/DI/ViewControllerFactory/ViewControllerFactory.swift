//
//  ViewControllerFactory.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 07/05/25.
//

import Foundation

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    func makeSplashViewController(
        flowDelegate: any SplashFlowDelegate
    ) -> SplashViewController {
        let splashView = SplashView()
        let viewControllerFactory = SplashViewController(
            contentView: splashView,
            flowDelegate: flowDelegate
        )
        return viewControllerFactory
    }
    
    func makeLoginBottomSheetViewController(
        flowDelegate: any LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController {
        let loginBottomSheetView = LoginBottomSheetView()
        let viewControllerFactory = LoginBottomSheetViewController(
            contentView: loginBottomSheetView,
            flowDelegate: flowDelegate
        )
        return viewControllerFactory
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let homeView = HomeView()
        let viewControllerFactory = HomeViewController(
            contentView: homeView,
            flowDelegate: flowDelegate
        )
        return viewControllerFactory
    }
}
