//
//  Hero.swift
//  Iskatu's compagnon
//
//  Created by Charles Corcy on 09/06/2019.
//  Copyright © 2019 Charles Corcy. All rights reserved.
//

import Foundation

struct Hero: Codable {
    var id: Int
    var name: String
    var `class`: String
    var classSlug: String
    var gender: Int
    var level: Int
    var paragonLevel: Int
    var hardcore: Bool
    var seasonal: Bool
    var dead: Bool
    var kills: Kill
}
