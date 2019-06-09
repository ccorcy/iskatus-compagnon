//
//  User.swift
//  Iskatu's compagnon
//
//  Created by Charles Corcy on 08/06/2019.
//  Copyright © 2019 Charles Corcy. All rights reserved.
//

import Foundation

struct User: Codable {
    var battleTag: String
    var paragonLevel: Int
    var paragonLevelSeason: Int
    var paragonLevelSeasonHardcore: Int
    var guildName: String
    var heroes: [Hero]
    var kills: ProfileKill
    var progression: Progression
}
