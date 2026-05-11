//
//  NoteDetailView.swift
//  NotasApp
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI

struct NoteDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    //    Conexão direta com a nota original
    @Binding var note: Note
    
    //    Estado local temporario da nota.
    @State var noteState: Note
    
    init(note: Binding<Note>) {
        _note = note
        _noteState = .init(initialValue: note.wrappedValue)
    }
    
    var body: some View {
        VStack {
            TextField("Titulo", text: $noteState.title)
                .font(.title)
            TextEditor(text: $noteState.content)
                .font(.subheadline)
        }
        .padding()
        .navigationTitle("Detalhes da Nota")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Salvar") {
                    note = noteState
                    dismiss()
                }
                .disabled(note == noteState)
            }
        }
    }
}

#Preview {
    @Previewable @State var note = Note(title: "Teste Title", content: "Teste Content")
    return NavigationView {
        NoteDetailView(note: $note)
    }
}
