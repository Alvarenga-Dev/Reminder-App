//
//  String+Ext.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 04/03/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
