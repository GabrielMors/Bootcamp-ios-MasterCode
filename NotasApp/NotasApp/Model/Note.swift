//
//  Note.swift
//  NotasApp
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import Foundation

//Identifiable -> O objeto possui um identificador unico
// No SwiftUI usamos MUITO em:
//  - List
// - ForEach

struct Note: Identifiable, Equatable, Codable {
//    UUID
//    Gera um identifcador único para cada nota
//    Muito usado para diferenciar objetos
    var id: UUID = UUID()
    var title: String
    var content: String
    
//  Equatable -> Permite comparar dois objetos Note (Usando ==)
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.content == rhs.content
    }
}
