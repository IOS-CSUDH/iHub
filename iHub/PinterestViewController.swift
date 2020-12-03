//
//  PinterestViewController.swift
//  iHub
//
//  Created by Surendra Pandey on 11/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pinterest"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
         if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
             self.performSegue(withIdentifier: "tumblrHome", sender: self)
         }
    }
     
    
    
    @IBAction func pinOnLoginButton(_ sender: Any) {
        
        let myURL = "https://www.tumblr.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        TumblrAPICaller.client?.login(url: myURL, success: {self.performSegue(withIdentifier: "tumblrHome", sender: self)},failure: { (Error) in
                                        print("Could not log in!")
                                       })
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

