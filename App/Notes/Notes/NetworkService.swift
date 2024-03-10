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
    
    func postNote(_ note: String) {
        let params = ["note": note] as [String: Any]
        let url = URL(string: "http://localhost:3000/notes")!
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        catch (let error) {
            print(error)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    print(json)
                }
            }
            catch (let error) {
                print(error)
            }
        }
        
        task.resume()
    }
}
