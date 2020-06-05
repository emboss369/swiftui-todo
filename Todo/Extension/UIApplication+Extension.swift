//
//  UIApplication+Extension.swift
//  Todo
//
//  Created by user.name on 2020/05/29.
//  Copyright © 2020 example.com. All rights reserved.
//
import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}

