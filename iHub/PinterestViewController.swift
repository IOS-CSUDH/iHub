//
//  PinterestViewController.swift
//  iHub
//
//  Created by Surendra Pandey on 11/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController {
    
       /*
       
       func authenticate() {
           authenticator.authenticate("ello", callback: { [self] creds, error in
               DispatchQueue.main.async(execute: { [self] in
                   if let error = error {
                       authResultsTextView.text = "Error: \(error.localizedDescription)"
                   } else {
                       session = TMURLSession(configuration: URLSessionConfiguration.default, applicationCredentials: TMAPIApplicationCredentials(consumerKey: "", consumerSecret: ""), userCredentials: TMAPIUserCredentials(token: creds?.token, tokenSecret: creds?.tokenSecret))
                       if let token = creds?.token, let tokenSecret = creds?.tokenSecret {
                           authResultsTextView.text = "Success!\nToken: \(token)\nSecret: \(tokenSecret)"
                       }
                       request()
                   }
               })
           })
       }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tumblr"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
         if UserDefaults.standard.bool(forKey: "tumblrUserLoggedIn") == true{
             self.performSegue(withIdentifier: "tumblrHome", sender: self)
         }
    }
     
    
    
    @IBAction func pinOnLoginButton(_ sender: Any) {
        
        let myURL = "https://www.tumblr.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "tumblrUserLoggedIn")
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

