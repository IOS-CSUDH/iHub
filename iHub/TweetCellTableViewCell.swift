//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Surendra Pandey on 10/1/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {


    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
   
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
  //  var retweet:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
      
        let toBeFavorited = !favorited
        
        if(toBeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweeiId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorate did not succeed: \(error)")
                
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweeiId: tweetId, success: {
                self.setFavorite(false)
                
            }, failure: { (error) in print("Unfavorite did not succeed:\(error)")})
        }
        
        
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweeiId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in print("Error is retwitting: \(error)")})
    }
        
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    func setFavorite (_ isFavorited:Bool)
        {
        favorited = isFavorited
            if(favorited){
                favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
                
            }
            else
            {
                favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            }
        }
        
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
