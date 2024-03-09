//
//  ContentView.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<9) { index in
                Text("Hello test: \(index)")
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
        print("notes= \(notes)")
    }
}

#Preview {
    ContentView()
}
