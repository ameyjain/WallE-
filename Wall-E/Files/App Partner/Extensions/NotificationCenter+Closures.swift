//
//  NotificationCenter+Closures.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation

extension NotificationCenter
{
    static func when(_ name: Notification.Name, perform block: @escaping (Notification) -> ())
    {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main, using: block)
    }
}
