//
//  utils.swift
//  Iskatu's compagnon
//
//  Created by Charles Corcy on 08/06/2019.
//  Copyright © 2019 Charles Corcy. All rights reserved.
//

import Foundation

func parseJSON(data: Data) throws -> User {
    do {
        let decoder = JSONDecoder()
        let model = try decoder.decode(User.self, from: data)
        return model
    } catch let error {
        print(error)
        throw error
    }
}

func makeRequest(url: URL, method: String, callback: @escaping (User) -> ()) {
    let request = NSMutableURLRequest(url: url)
    let session = URLSession.shared
    request.httpMethod = method
    let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
        if error != nil {
            print(error?.localizedDescription ?? "Response Error")
            return }
        do {
            let jsonData = try parseJSON(data: data!)
            print(jsonData)
            callback(jsonData)
        } catch let error {
            print(error)
        }
    }
    task.resume()
}
