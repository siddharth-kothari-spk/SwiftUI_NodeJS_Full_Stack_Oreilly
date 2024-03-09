//
//  Note.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: String { _id}
    var _id: String
    // As mongo DB has _id as identifier , and Identifiable protocol needs an attribute named id , so here is th hack for same
    var note: String
}
