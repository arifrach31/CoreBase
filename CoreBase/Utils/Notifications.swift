//
//  Notifications.swift
//  Base
//
//  Created by Arif Rachman on 30/01/20.
//  Copyright © 2022 ArifRach. All rights reserved.
//

import Foundation

public extension NSNotification.Name {
  func post(with object: Any? = nil) {
    NotificationCenter.default.post(name: self, object: object)
  }
}
