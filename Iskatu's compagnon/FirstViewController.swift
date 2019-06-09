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
    
    // MARK: Methods
    
    func processData(data: User) {
        self.showProfileInfos(data: data)
        self.loader.removeFromSuperview()
    }

    func requestProfile() {
        // request node server to get profile data (avoid oauth2)
        let request = NSMutableURLRequest(url: URL(string: "http://localhost:3000/profile?battleTag=Cobracharles-2507")!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let user = try parseJSON(data: data!)
                print(user)
                DispatchQueue.main.async {
                    self.processData(data: user)
                    self.loadingState = true
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    func showProfileInfos(data: User) {
        self.profileName.text = data.battleTag
        self.profileName.isHidden = false
        self.paragonLvl.text = String(data.paragonLevel)
        self.paragonLvl.isHidden = false
    }
}

