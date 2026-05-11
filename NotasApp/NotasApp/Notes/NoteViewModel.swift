//
//  NoteViewModel.swift
//  NotasApp
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import Foundation
internal import Combine

//@ObservedObject -> é usado em uma View para reagir as mudanças em um ObservableObject

//@StateObject -> É bem similar a ObservedObject, mas é responsavel pela criação e destruição do objeto observado, sendo mais apropriado para objetos que a view deve possuir

//@Published -> É utilizado para notificar mudanças em propriedade de um ObservableObject.

//ObservableObject -> Permite que o SwiftUI observe mudanças nessa classe
class NoteViewModel: ObservableObject {
    
// Sempre que notes mudar, a interface será atualziado automaticamente
    @Published var notes: [Note] = [] {
        didSet { // Executa após alteracao do valor
            saveNotes()
        }
    }
    
    init() {
//         Salvando automaticamente após qualquer alteração
        guard let data = UserDefaults.standard.data(forKey: "notes"),
              let list = try? JSONDecoder().decode([Note].self, from: data) else {
            return
        }
        notes = list
    }
    
    func saveNotes() {
        UserDefaults.standard.set(try? JSONEncoder().encode(notes), forKey: "notes")
    }
}
