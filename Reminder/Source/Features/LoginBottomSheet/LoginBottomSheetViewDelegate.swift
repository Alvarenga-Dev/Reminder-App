//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 05/03/25.
//

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginRequest(user: String, password: String)
}
