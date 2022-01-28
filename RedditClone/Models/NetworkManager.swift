//
//  NetworkManager.swift
//  RedditClone
//
//  Created by Oğulcan Aslan on 27.01.2022.
//

import Foundation

class NetworkManager {
    
    func getDataList(completionHandler: @escaping (Response?) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "https://www.reddit.com/r/flutterdev/top.json?count=20")!
        let decoder = JSONDecoder()
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            do {
                guard let data = data else {
                    return
                }
                let json = try decoder.decode(Response.self, from: data)
                completionHandler(json)
            } catch let error {
                print("JSON error: \(error.localizedDescription)")
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
}
