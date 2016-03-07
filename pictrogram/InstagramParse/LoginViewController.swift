//
//  LoginViewController.swift
//  InstagramParse
//
//  Created by Danyal Rizvi on 2/22/16.
//  Copyright © 2016 dsrizvi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.tabBarItem.title = "Niraj"
    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		// Do any additional setup after loading the view.
		if PFUser.currentUser() != nil {
			// if there is a logged in user then load the home view controller
			self.showTabBar()
		}
	}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func signupPressed(sender: AnyObject) {
		let newUser = PFUser()
		
		newUser.username = usernameTextField.text
		newUser.password = passwordTextField.text
		
		newUser.signUpInBackgroundWithBlock { (success : Bool, error : NSError?) -> Void in
			if(success){
				//Do one thing
				print("Created a user")
				self.showTabBar()
			}
			else{
				//Do another
				print(error?.localizedDescription)
				if(error?.code == 202){
					print("Username already taken")//we can do more stuff with this later on
				}
			}
		}
	}
	
	func showTabBar(){
		let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appdelegate.window?.rootViewController = appdelegate.tabBarController
	}

	@IBAction func loginPressed(sender: AnyObject) {
		PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: NSError?) -> Void in
			if(user != nil){
				print("You are logged in")
				self.showTabBar()
			}
			else{
				print(error?.localizedDescription)
			}
		}
		
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
