//
//  String.swift
//  Base
//
//  Created by ArifRachman on 08/02/22.
//  Copyright © 2022 Base. All rights reserved.
//

import Foundation

// MARK: - Localized String
public extension String {
  func localized() -> String {
    return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
  }
}
