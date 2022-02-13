//
//  APIError.swift
//  Base
//
//  Created by Arif Rachman on 30/01/20.
//  Copyright © 2022 ArifRach. All rights reserved.
//

import Foundation

public enum ApiError: Error {
  case connectionError
  case invalidJSONError
  case middlewareError(code: Int, message: String?)
  case failedMappingError
  
  var localizedDescription: String {
    switch self {
    case .connectionError:
      return "error_connection".localized()
    case .invalidJSONError:
      return "error_json".localized()
    case .middlewareError(_, let message):
      return message ?? ""
    case .failedMappingError:
      return "error_format".localized()
    }
  }
}
