//
//  ViewControllerFactoryProtocol.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 07/05/25.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeSplashViewController(
        flowDelegate: SplashFlowDelegate
    ) -> SplashViewController
    
    func makeLoginBottomSheetViewController(
        flowDelegate: LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController
    
    func makeHomeViewController(
        flowDelegate: HomeFlowDelegate
    ) -> HomeViewController
}
