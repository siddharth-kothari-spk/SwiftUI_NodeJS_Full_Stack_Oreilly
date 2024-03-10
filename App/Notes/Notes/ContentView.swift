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
    var body: some View {
        NavigationStack {
            List(notes, id: \.self) { note in
                Text(note.note)
                    .padding()
            }
            .sheet(isPresented: $showAdd, content: {
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
