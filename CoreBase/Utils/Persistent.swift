//
//  Persistent.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import Foundation

public struct PersistentKey: RawRepresentable {
  static let deviceID = PersistentKey(rawValue: "deviceID")
  public var rawValue: String
  
  public init(rawValue: String) {
    self.rawValue = rawValue
  }
}

extension PersistentKey {
  private func getPrefix() -> String {
#if DEVELOPMENT
    return "dev_"
#elseif STAGING
    return "stg_"
#else
    return "prod_"
#endif
  }
  
  func modifiedKey() -> String {
    return getPrefix() + self.rawValue
  }
}

public struct Persistent {
  public static let shared = Persistent()
  
  public func set(key: PersistentKey, value: String) {
    UserDefaults.standard.set(value, forKey: key.modifiedKey())
    UserDefaults.standard.synchronize()
  }
  
  public func get(key: PersistentKey) -> String? {
    return UserDefaults.standard.value(forKey: key.modifiedKey()) as? String
  }
  
  public func delete(key: PersistentKey) {
    UserDefaults.standard.removeObject(forKey: key.modifiedKey())
    UserDefaults.standard.synchronize()
  }
  
  public func setData(key: PersistentKey, value: Data) {
    UserDefaults.standard.set(value, forKey: key.modifiedKey())
    UserDefaults.standard.synchronize()
  }
  
  public func getData(key: PersistentKey) -> Data? {
    return UserDefaults.standard.value(forKey: key.modifiedKey()) as? Data
  }
}
