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
    var alert: Alert {
        Alert(title: Text("Delete note"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")), secondaryButton: .cancel())
    }
    
    var body: some View {
        NavigationStack {
            List(notes, id: \.self) { note in
                Text(note.note)
                    .padding()
                    .onLongPressGesture {
                        self.showAlert.toggle()
                        self.deleteItem = note
                    }
            }
            .alert("Delete note", isPresented: $showAlert, actions: {
                HStack {
                    Button("Delete", role: .destructive) {
                    
                    }
                    Button("Cancel", role: .cancel) {
                        print("Deletion cancelled")
                    }
                }
               
                
            })
            .sheet(isPresented: $showAdd, onDismiss: fetch ,content: {
                AddNoteView()
            })
            .onAppear(perform: {
                fetch()
            })
            .navigationTitle("Notes")
            .toolbar(content: {
                Button {
                    showAdd.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            })
        }
    }
    
    func fetch() {
        guard let notes = NetworkService().fetchNotes() else { return }
        self.notes = notes
        print("notes= \(notes)")
    }
}

#Preview {
    ContentView()
}
