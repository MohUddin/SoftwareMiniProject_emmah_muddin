//
//  ViewController.swift
//  SWMiniProject
//
//  Created by Emma Howard on 9/7/18.
//  Copyright © 2018 Emma Howard. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate{
    var viewController = UIStoryboard(name: "LandingScreen", bundle: nil).instantiateViewController(withIdentifier: "LandingScreen") as! LandingPageViewController
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        UserDefaults.standard.set("", forKey: "fullName")
        //Try to automatically sign in user
        //GIDSignIn.sharedInstance().signInSilently()
        
        NotificationCenter.default.addObserver(self, selector: #selector(successfulSignIn), name: NSNotification.Name("SuccessfulSignIn"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func successfulSignIn(){
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

