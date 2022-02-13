//
//  UIViewController.swift
//  Base
//
//  Created by Arif Rachman on 30/01/20.
//  Copyright © 2022 ArifRach. All rights reserved.
//

import UIKit

// MARK: - Handle NavigationBar
public protocol NavigationBarButtonHandler {
  func rightNavigationBarButtonTapped(sender: UIBarButtonItem?)
  func leftNavigationBarButtonTapped(sender: UIBarButtonItem?)
}

extension UIViewController: NavigationBarButtonHandler {
  @objc open func rightNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }

  @objc open func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
}

// MARK: - Handle Alert
public extension UIViewController {
  func showAlert(title: String?, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

// MARK: - Handle Error
public extension UIViewController {
  func handleError(error: ApiError?) {
    guard let apiError = error else {
      return
    }

    showAlert(title: "failed".localized(), message: apiError.localizedDescription)
  }
}
