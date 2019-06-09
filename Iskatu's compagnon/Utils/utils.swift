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
