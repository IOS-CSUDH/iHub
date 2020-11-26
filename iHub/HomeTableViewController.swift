//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Surendra Pandey on 10/1/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var tweetArray = [NSDictionary]()
    var numberOftweet : Int!
    let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    let myRefreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTweet()
        myRefreshControll.addTarget(self, action: #selector(loadTweet), for: .valueChanged)
        self.tableView.refreshControl = myRefreshControll
       self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadTweet()
        tableView.reloadData()

    }
    
    
    @objc func loadTweet(){
        let mypar = ["count": 20]
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: mypar as [String:Any], success: { (tweets : [NSDictionary]) in
            
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            self.tableView.reloadData()
            self.myRefreshControll.endRefreshing()
        }, failure: { (Error) in print("Could not retriuve tweets!")
            
        })
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
     
        
        
       let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        cell.UserNameLabel.text = user["name"] as? String
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as? String
        
        let imageURL = URL(string: ((user["profile_image_url_https"] as? String)!))
        let data =  try? Data(contentsOf: imageURL!)
        
        if let imageData = data {
            cell.profileImageView.image = UIImage(data: imageData)
        }
        
        cell.setFavorite(tweetArray[indexPath.row]["favorited"] as! Bool)
        cell.tweetId = tweetArray[indexPath.row]["id"] as! Int
        cell.setRetweeted(tweetArray[indexPath.row]["retweeted"] as! Bool)
        
        
        return cell
    }
    
    
    
   @IBAction func BackToHome(_ sender: Any)
   {
    self.performSegue(withIdentifier: "BackToHome", sender: self)

       
   
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }


    }
    
