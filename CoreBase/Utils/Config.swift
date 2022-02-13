//
//  Constants.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import UIKit

// MARK: - Config Constants
public struct Config: RawRepresentable {
  public var rawValue: String

  public static var showConsole = false
  public enum Environment {
    case development
    case staging
    case production
  }
  
  public init(rawValue: String) {
    self.rawValue = rawValue
  }
}
