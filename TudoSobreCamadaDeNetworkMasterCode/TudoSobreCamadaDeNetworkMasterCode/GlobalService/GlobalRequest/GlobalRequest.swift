//
//  GlobalRequest.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 13/04/26.
//

import Foundation

protocol GlobalRequest {
  func request(apiRequest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest?
}

struct DefaultRequest: GlobalRequest {
  func request(apiRequest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest? {
    let urlString = baseURL + apiRequest.endpoint
    guard let url = URL(string: urlString) else { return nil }

    var request = URLRequest(url: url)
    request.httpMethod = apiRequest.httpMethod.rawValue
    request.timeoutInterval = timeout
    request.allHTTPHeaderFields = apiRequest.headers

    if let parameters = apiRequest.parameters {
      switch parameters {
      case .encodable(let encodable):
        request.httpBody = try? JSONEncoder().encode(encodable)
      case .dictionary(let dictionary):
        request.httpBody = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
      }
    }

   return request
  }
}
