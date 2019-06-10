//
//  FirstViewController.swift
//  Iskatu's compagnon
//
//  Created by Charles Corcy on 30/05/2019.
//  Copyright © 2019 Charles Corcy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var loadingState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loader.startAnimating()
        requestProfile()
    }
    
    // MARK: Outlet
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var paragonLvl: UILabel!
    @IBOutlet weak var paragonLvlSeason: UILabel!
    @IBOutlet weak var GuildName: UILabel!
    @IBOutlet weak var KillMonster: UILabel!
    @IBOutlet weak var KillChampion: UILabel!
    @IBOutlet weak var KillElite: UILabel!
    
    
    // MARK: Methods
    
    func processData(data: User) {
        self.showProfileInfos(data: data)
        self.loader.removeFromSuperview()
    }

    func requestProfile() {
        // request node server to get profile data (avoid oauth2)
        makeRequest(url: URL(string: "http://192.168.1.47:3000/profile?battleTag=Cobracharles-2507")!, method: "GET") {
            profileData in
            DispatchQueue.main.async {
                self.processData(data: profileData)
                self.loadingState = true
            }
        }
    }
    
    func showProfileInfos(data: User) {
        self.profileName.text = data.battleTag
        self.profileName.isHidden = false
        self.paragonLvl.text = String(data.paragonLevel)
        self.paragonLvl.isHidden = false
        self.paragonLvlSeason.text = String(data.paragonLevelSeason)
        self.paragonLvlSeason.isHidden = false
        self.GuildName.text = data.guildName
        self.KillMonster.text = String(data.kills.monsters)
        self.KillChampion.text = String(data.kills.hardcoreMonsters)
        self.KillElite.text = String(data.kills.elites)
    }
}

