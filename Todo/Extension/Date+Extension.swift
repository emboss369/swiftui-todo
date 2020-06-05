//
//  Date+Extension.swift
//  Todo
//
//  Created by user.name on 2020/05/28.
//  Copyright © 2020 example.com. All rights reserved.
//

import Foundation

extension Date {
    /// 「時分秒」を切り落とした今日の日付を作成
    static var today : Date {
        let calendar = Calendar(identifier: .gregorian)
        let time = Date()
        let today = calendar.startOfDay(for: time)
        return today
    }
    /// 「時分秒」を切り落とした明日の日付を作成
    static var tomorrow : Date {
        let calendar = Calendar(identifier: .gregorian)
        let tomorrow = calendar.date(byAdding: DateComponents(day: 1), to: Date.today)!
        return tomorrow
    }
}

