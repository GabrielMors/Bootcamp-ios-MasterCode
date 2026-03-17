//
//  List.swift
//  CollectionViewMasterCode
//
//  Created by Caio Fabrini on 16/03/26.
//

import Foundation

class ListViewModel {

  private var list = [Detail(text: "Olá mundo", image: "house"),
                      Detail(text: "Preciso de ferias", image: "house"),
                      Detail(text: "Bora estudar?", image: "house"),
                      Detail(text: "Esse trabalho ta me matando", image: "house"),
                      Detail(text: "Copa do mundo 2026", image: "house")
  ]

  var numberOfItems: Int {
    return list.count
  }

  func loadCurrentDetail(row: Int) -> Detail {
    return list[row]
  }

  func getTile(row: Int) -> String {
    let detail = loadCurrentDetail(row: row)
    return detail.text
  }
}
