//
//  AddNoteView.swift
//  NotasApp
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI

struct AddNoteView: View {
    
    @State var note: Note = Note(title: "", content: "")
    @ObservedObject var viewModel: NoteViewModel
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        Form {
            Section {
                TextField("Informe o título", text: $note.title)
            } header: {
                Text("Título")
            }
            
            Section {
                TextEditor(text: $note.content)
            } header: {
                Text("Conteúdo")
            }
            
            Section {
                Button("Salvar") {
                    viewModel.notes.append(note)
                    dismiss()
                }
                .disabled(note.title == "" || note.content == "")
            }
        }
    }
}

#Preview {
    var viewModel = NoteViewModel()
    AddNoteView(viewModel: viewModel)
}
