//
//  ContentView.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = [Note]()
    @State private var showAdd = false
    
    @State private var showAlert = false
    @State private var deleteItem: Note?
    
    @State private var editMode: EditMode = .inactive
    @State private var updateNote: String = ""
    @State private var noteId: String = ""
    
    var alert: Alert {
        Alert(title: Text("Delete note"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")), secondaryButton: .cancel())
    }
    
    var body: some View {
        NavigationStack {
            List(notes, id: \.self) { note in
                if editMode == .inactive {
                    Text(note.note)
                        .padding()
                        .onLongPressGesture {
                            self.showAlert.toggle()
                            self.deleteItem = note
                        }
                }
                else {
                    HStack {
                        Image(systemName: "pencil.fill.circle")
                            .foregroundStyle(.cyan)
                        Text(note.note)
                            .padding()
                    }
                    .onTapGesture {
                        updateNote = note.note
                        noteId = note._id
                        showAdd.toggle()
                    }
                }
            }
            .alert("Delete note", isPresented: $showAlert, actions: {
                HStack {
                    Button("Delete", role: .destructive) {
                        delete()
                    }
                    Button("Cancel", role: .cancel) {
                        print("Deletion cancelled")
                    }
                }
            })
            .sheet(isPresented: $showAdd, onDismiss: fetch ,content: {
                if editMode == .inactive {
                    AddNoteView()
                }
                else {
                    UpdateNoteView(noteEntered: $updateNote, noteId: $noteId)
                }
            })
            .onAppear(perform: {
                fetch()
            })
            .navigationTitle("Notes")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        switch self.editMode {
                        case .inactive:
                            self.editMode = .active
                        default:
                            self.editMode = .inactive
                        }
                        
                    }, label: {
                        Text(editMode == .inactive ? "Edit" : "Done")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAdd.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            })
        }
    }
    
    func fetch() {
        guard let notes = NetworkService().fetchNotes() else { return }
        self.notes = notes
        print("notes= \(notes)")
        
        if self.editMode == .active {
            self.editMode = .inactive
        }
    }
    
    func delete() {
        guard let noteToDelete = deleteItem else {
            print("No note to delete")
            return
        }
        NetworkService().deleteNote(noteToDelete)
        deleteItem = nil
        fetch()
    }
    
    func edit() {
        
    }
}

#Preview {
    ContentView()
}
