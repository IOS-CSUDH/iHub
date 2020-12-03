 //
//  TumblrAPICaller.swift
//  iHub
//
//  Created by Marvin H  on 12/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//
import UIKit
import BDBOAuth1Manager

class TumblrAPICaller: BDBOAuth1SessionManager {
    static let client = TumblrAPICaller(baseURL: URL(string: "https://api.tumblr.com"), consumerKey: "FYSv7wqaYsxaPnw3wKb9zEXSmDLLSEB1DroZ2MW3t9MXfQ6MEP", consumerSecret: "s5wCN4TffWHHfEYu7HkNGIpnanlgtqbV6uerH69fqfkPkNrdtz")
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?

    func handleOpenUrl(url: URL){
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        TumblrAPICaller.client?.fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) in
            self.loginSuccess?()
        }, failure: { (error: Error!) in
            self.loginFailure?(error)
        })
    }

    func login(url: String, success: @escaping () -> (), failure: @escaping (Error) -> ()){
        loginSuccess = success
        loginFailure = failure
        TumblrAPICaller.client?.deauthorize()
        TumblrAPICaller.client?.fetchRequestToken(withPath: url, method: "GET", callbackURL: URL(string: "alamoTumblr://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            let url = URL(string: "https://www.tumblr.com/oauth/authorize?oauth_token=\(requestToken.token!)")!
            UIApplication.shared.open(url)
        }, failure: { (error: Error!) -> Void in
            print("Error: \(error.localizedDescription)")
            self.loginFailure?(error)
        })
    }
    func logout (){
        deauthorize()
    }
    
    func getDictionaryRequest(url: String, parameters: [String:Any], success: @escaping (NSDictionary) -> (), failure: @escaping (Error) -> ()){
        TumblrAPICaller.client?.get(url, parameters: parameters, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
            success(response as! NSDictionary)
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            failure(error)
        })
    }
    
    func getDictionariesRequest(url: String, parameters: [String:Any], success: @escaping ([NSDictionary]) -> (), failure: @escaping (Error) -> ()){
        print(parameters)
        TumblrAPICaller.client?.get(url, parameters: parameters, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
            success(response as! [NSDictionary])
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            failure(error)
        })
    }
}
