//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 05/03/25.
//

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginRequest(email: String, password: String)
}
