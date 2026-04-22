//
//  GetInfo.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import Foundation

enum KeyInfo: String {
  case imageBaseURL = "ImageBaseURL"
  case apiKey = "APIKey"
  case baseURL = "BaseURL"
}

struct GetInfo {
  static func info(key: KeyInfo) -> Any {
    guard let value = Bundle.main.infoDictionary?[key.rawValue] else {
      fatalError("APIKey não encontrada no Info.plist")
    }
    return value
  }
}
