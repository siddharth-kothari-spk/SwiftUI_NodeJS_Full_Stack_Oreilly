//
//  AddNoteView.swift
//  Notes
//
//  Created by Siddharth Kothari on 10/03/24.
//

import SwiftUI

struct AddNoteView: View {
    @State private var noteEntered: String = ""    
    var body: some View {
        HStack {
            TextField("Write a note", text: $noteEntered)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .clipped()
                .border(.black, width: 2)
            
            Button(action: addNote) {
                Text("Add")
            }
            .padding(8)
        }
        .padding()
    }
    
    func addNote() {
        print("note entered: \(noteEntered)")
        NetworkService().postNote(noteEntered)
    }
}

#Preview {
    AddNoteView()
}
