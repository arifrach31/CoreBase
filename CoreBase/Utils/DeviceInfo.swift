//
//  DeviceInfo.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import UIKit

public struct DeviceInfo {
  public static let iosVersion = UIDevice.current.systemVersion
  public static var deviceIdentifier : String {
    get {
      if let uid = Persistent.shared.get(key: .deviceID) {
        return uid
      } else {
        if let uid = UIDevice.current.identifierForVendor?.uuidString {
          Persistent.shared.set(key: .deviceID, value: uid)
          return uid
        }
        
        return "application_generated_device_id"
      }
    }
  }
  
  public static var screenWidth: CGFloat {
    get {
      if UIDevice.current.orientation.isLandscape {
        return max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
      } else {
        return min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
      }
    }
  }
}
