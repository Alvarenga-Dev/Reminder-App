//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 05/03/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var successResult: ((String) -> Void)?
    
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print("deu ruim")
                return
            }
            
            self?.successResult?(user)
        }
    }
}
