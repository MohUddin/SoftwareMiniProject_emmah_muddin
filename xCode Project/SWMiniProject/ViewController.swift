//
//  ViewController.swift
//  SWMiniProject
//
//  Created by Emma Howard on 9/7/18.
//  Copyright © 2018 Emma Howard. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import SwiftKeychainWrapper

class ViewController: UIViewController, GIDSignInUIDelegate{
    var viewController = UIStoryboard(name: "LandingScreen", bundle: nil).instantiateViewController(withIdentifier: "LandingScreen") as! LandingPageViewController
    
    var newHouse = House()
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    let userNotFoundAlert: UIAlertController = {
        let alert = UIAlertController()
        alert.title = "User not found"
        alert.message = "Please register for an account at our website"
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"User not found\" alert occured.")
        }))
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        UserDefaults.standard.set("", forKey: "fullName")
        //Try to automatically sign in user
        GIDSignIn.sharedInstance().signOut()
        
        NotificationCenter.default.addObserver(self, selector: #selector(successfulSignIn), name: NSNotification.Name("SuccessfulSignIn"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func successfulSignIn(){
        
        let userId = KeychainWrapper.standard.string(forKey: "userId")
        var houseID = ""
        
        let userRef = Firestore.firestore().collection("HouseIDs").document(userId!)
        
        userRef.getDocument{ (docSnapshot, error) in
            if (docSnapshot == docSnapshot && (docSnapshot?.exists)!){
                let myData = docSnapshot?.data()
                houseID = myData!["houseID"] as! String
                
                KeychainWrapper.standard.set(houseID, forKey: "houseId")
               
                 let houseRef = Firestore.firestore().collection("Users").document(userId!).collection(houseID)
                
                houseRef.order(by: "time", descending: true).limit(to: 1)
                    .getDocuments{ (collSnapshot, error) in
                    if(collSnapshot == collSnapshot && !((collSnapshot?.isEmpty)!)){
                        let homeData = collSnapshot?.documents[0].data()
                        
                      
                      
                        self.newHouse.houseId = houseID
                        self.newHouse.humidity = homeData?["humidity"] as? Int
                        self.newHouse.temperature = homeData?["temperature"] as? Int
                        
                        self.viewController.newHouse = self.newHouse
                        
                        self.navigationController?.pushViewController(self.viewController, animated: true)
                    }else{
                        self.present(self.userNotFoundAlert, animated: true, completion: nil)
                    }
                    
                }
                
        
                
            
            }else{
                self.present(self.userNotFoundAlert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    

}

