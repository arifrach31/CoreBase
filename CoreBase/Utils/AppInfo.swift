//
//  AppInfo.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import Foundation

public struct AppInfo {
  public static let applicationName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "-"
  public static let applicationVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
  public static let applicationBuildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
}
