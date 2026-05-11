//
//  NotesView.swift
//  NotasApp
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI

// @StateObject -> Criar e mantém o objeto
// @ObservedObject -> Apenas observa objeto externo

struct NotesView: View {
    
//    StateObject:
//    Responsavel por manter vivo o ViewModel da tela
//    O SwiftUI observa mudanças dentro dele
    
    @StateObject var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationView {
            HStack {
                
                List($viewModel.notes, editActions: .all) { $note in
                    NavigationLink(destination: NoteDetailView(note: $note)) {
                        HStack {
                            Image(systemName: "pencil")
                            VStack(alignment: .leading) {
                                Text(note.title)
                                Text(note.content)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Minhas notas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddNoteView(viewModel: viewModel)) {
                        Text("Adicionar")
                    }
                }
            }
        }
        
    }
}

#Preview {
    NotesView()
}
