//
//  NetfoxService.swift
//  Base
//
//  Created by Arif Rachman on 30/01/20.
//  Copyright © 2022 ArifRach. All rights reserved.
//

import Foundation
import netfox
import Alamofire

public final class NetfoxService: Alamofire.SessionManager {
  static let sharedManager: NetfoxService = {
    let configuration = URLSessionConfiguration.default
    configuration.protocolClasses?.insert(NFXProtocol.self, at: 0)
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    
    let manager = NetfoxService(configuration: configuration)
    return manager
  }()
}
