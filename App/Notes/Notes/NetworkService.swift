//
//  NetworkService.swift
//  Notes
//
//  Created by Siddharth Kothari on 09/03/24.
//

import Foundation

class NetworkService {
    
    func fetchNotes() -> [Note]? {
        var notes: [Note]?
        let url = URL(string: "http://localhost:3000/notes")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8) as Any)
            
            do {
                notes =  try JSONDecoder().decode([Note].self, from: data)
            }
            catch (let error) {
                print("error: \(error.localizedDescription)")
            }
        }
        task.resume()
        
        return notes
    }
}
