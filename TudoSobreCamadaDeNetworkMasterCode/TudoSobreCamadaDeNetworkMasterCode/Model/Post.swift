//
//  Post.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 09/04/26.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
