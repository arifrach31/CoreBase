//
//  Helpers.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import UIKit

// MARK: - WebView
public func openBrowser(_ url: String) {
  if let url = URL(string: url) {
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url)
    } else {
      UIApplication.shared.openURL(url)
    }
  }
}

// MARK: - Debug Console
public func console(_ text: String) {
  if Config.showConsole {
    return print("Console: \(text)")
  }
}
