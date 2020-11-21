
import UIKit

class TwitterLoginviewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Twitter"

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
         
         if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
             self.performSegue(withIdentifier: "loginToHome", sender: self)
         }
    }
     
    @IBAction func onLoginButtom(_ sender: Any) {
    
        let myURL = "https://api.twitter.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
       // print("hello World")
        TwitterAPICaller.client?.login(url: myURL, success: {self.performSegue(withIdentifier: "loginToHome", sender: self)},failure: { (Error) in
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
