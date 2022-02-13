//
//  NetworkService.swift
//  Base
//
//  Created by Arif Rachman on 30/01/20.
//  Copyright © 2022 ArifRach. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import ObjectMapper
import RxSwift

public protocol NetworkAPI: TargetType {
  var endpointClosure: (TargetType) -> Endpoint  { get }
}

public final class NetworkService {
  public static let shared = NetworkService()

  public func connect<T: Mappable, A: NetworkAPI>(api: A, mappableType: T.Type) -> Observable<T> {
    let subject = ReplaySubject<T>.createUnbounded()
    makeRequest(api: api, mappableType: mappableType, subject: subject)
    return subject
  }

  public static func getNetworkManager() -> Alamofire.SessionManager {
    #if DEVELOPMENT || NETFOX
    return NetfoxService.sharedManager
    #else
    let configuration = URLSessionConfiguration.default
    return Alamofire.SessionManager(configuration: configuration)
    #endif
  }

  public func makeRequest<T: Mappable, A: NetworkAPI>(api: A, mappableType: T.Type, subject: ReplaySubject<T>) {
    let networkManager = NetworkService.getNetworkManager()
    let provider = MoyaProvider<A>(endpointClosure: api.endpointClosure, manager: networkManager)

    provider.request(api) { result in
      switch result {
      case .success(let value):
        do {
          guard let jsonResponse = try value.mapJSON() as? [String: Any] else {
            subject.onError(ApiError.invalidJSONError)
            return
          }

          if let success = jsonResponse["status"] as? String {
            if success != "ok" {
              subject.onError(ApiError.middlewareError(code: value.statusCode, message: jsonResponse["message"] as? String))
              return
            }
          } else if let resultMessage = jsonResponse["resultMessage"] as? String {
            if resultMessage != "success" {
              subject.onError(ApiError.middlewareError(code: value.statusCode, message: jsonResponse["message"] as? String))
              return
            }
          }

          let map = Map(mappingType: .fromJSON, JSON: jsonResponse)
          guard let responseObject = mappableType.init(map: map) else {
            subject.onError(ApiError.failedMappingError)
            return
          }

          subject.onNext(responseObject)
          subject.onCompleted()
        } catch {
          subject.onError(ApiError.invalidJSONError)
        }
      case .failure:
        subject.onError(ApiError.connectionError)
      }
    }
  }
}
