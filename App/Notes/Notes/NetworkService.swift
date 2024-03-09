//
//  NetworkService.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import Foundation

class NetworkService {
    
    func fetchNotes() {
        let url = URL(string: "http://localhost:3000/notes")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8))
        }
        task.resume()
    }
}
