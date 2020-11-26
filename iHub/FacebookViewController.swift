//
//  FacebookViewController.swift
//  iHub
//
//  Created by Surendra Pandey on 11/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Facebook"

        // Do any additional setup after loading the view.
        
        AppEvents.logEvent(.viewedContent)
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    @IBAction func fbOnLoginButton(_ sender: Any) {
    }
    
    
    // Swift
    //
    // Add this to the header of your file, e.g. in ViewController.swift





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
