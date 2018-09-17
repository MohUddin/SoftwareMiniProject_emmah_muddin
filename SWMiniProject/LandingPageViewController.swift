//
//  LandingPageViewController.swift
//  SWMiniProject
//
//  Created by Emma Howard on 9/7/18.
//  Copyright © 2018 Emma Howard. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class LandingPageViewController: UIViewController{
    
    let greetingLbl:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        
        if ( UserDefaults.standard.string(forKey: "fullName") != nil){
            lbl.text = "Hello, " + UserDefaults.standard.string(forKey: "fullName")!
        }else{
            lbl.text = "Hello"
        }
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let tempTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        lbl.text = "Temperature"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let humTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        lbl.text = "Humidity"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        view.addSubview(greetingLbl)
        view.addSubview(tempTitle)
        view.addSubview(humTitle)
        
        setupGreetingLbl()
        setupTemptitle()
        setupHumTitle()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.addSubview(greetingLbl)
        
        setupGreetingLbl()
    }
    
    func setupGreetingLbl(){
        
        greetingLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greetingLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: -30).isActive = true
        greetingLbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        greetingLbl.heightAnchor.constraint(equalToConstant:300).isActive = true
    }
    
    func setupTemptitle(){
        tempTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempTitle.topAnchor.constraint(equalTo: greetingLbl.bottomAnchor, constant: 10).isActive = true
        tempTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        tempTitle.heightAnchor.constraint(equalToConstant:300).isActive = true
    }
    
    func setupHumTitle(){
        humTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        humTitle.topAnchor.constraint(equalTo: tempTitle.bottomAnchor, constant: 10).isActive = true
        humTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        humTitle.heightAnchor.constraint(equalToConstant:300).isActive = true
    }
    
  

}

extension UIColor {
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
