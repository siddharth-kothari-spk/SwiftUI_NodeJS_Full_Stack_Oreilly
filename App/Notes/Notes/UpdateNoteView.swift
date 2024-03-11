//
//  UpdateNoteView.swift
//  Notes
//
//  Created by Siddharth Kothari on 11/03/24.
//

import SwiftUI

struct UpdateNoteView: View {
    
    @Binding var noteEntered: String
    @Binding var noteId: String
    
    var body: some View {
        HStack {
            TextField("Update the note", text: $noteEntered)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .clipped()
                .border(.black, width: 2)
            
            Button(action: updateNote) {
                Text("Update")
            }
            .padding(8)
        }
        .padding()
    }
    
    func updateNote() {
        NetworkService().updateNote(noteEntered, id: noteId)
    }
}

/*
#Preview {
   // @Binding var dummyNote: String = "dummyNote"
    UpdateNoteView()
}
*/
