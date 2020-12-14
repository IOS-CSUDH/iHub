//
//  SettingsViewController.swift
//  iHub
//
//  Created by Aldo Flores on 12/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func homeScreenButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToLogIn", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func twitterLogOut(_ sender: Any) {
        
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        //self.performSegue(withIdentifier: "HomeLogin", sender: self)
    }
    
    @IBAction func facebookLogOut(_ sender: Any) {
    }
    
    @IBAction func tumblrLogOut(_ sender: Any) {
        TumblrAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "tumblrUserLoggedIn")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
