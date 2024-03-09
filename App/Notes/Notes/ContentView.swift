//
//  ContentView.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = [Note]()
    var body: some View {
        NavigationStack {
            List(notes, id: \.self) { note in
                Text(note.note)
                    .padding()
            }
            .onAppear(perform: {
                fetch()
            })
            .navigationTitle("Notes")
            .toolbar(content: {
                Button {
                    print("dummy action")
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
