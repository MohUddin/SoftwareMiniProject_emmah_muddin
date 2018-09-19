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
import Firebase
import SwiftKeychainWrapper

class LandingPageViewController: UIViewController{
    var chartViewController = UIStoryboard(name: "Charts", bundle: nil).instantiateViewController(withIdentifier: "Charts") as! ChartsViewController
    
    var newHouse = House()
    
    let greetingLbl:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.text = "Hello"
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let tempTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        lbl.text = "Temperature"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let humTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        lbl.text = "Humidity"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let humLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 49, g: 89, b: 53)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        lbl.text = "-"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let tempLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 49, g: 89, b: 53)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        lbl.text = "-"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let chartBtn:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 132, g: 193, b: 77)
        button.setTitle("Chart", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        button.addTarget(self, action: #selector(handleChartClick), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        view.addSubview(greetingLbl)
        view.addSubview(tempTitle)
        view.addSubview(humTitle)
        view.addSubview(tempLbl)
        view.addSubview(humLbl)
        view.addSubview(chartBtn)
        
        setupGreetingLbl()
        setupTemptitle()
        setupHumTitle()
        setupHumLbl()
        setupTempLbl()
        setupChartBtn()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.addSubview(greetingLbl)
        
        setupGreetingLbl()
        
        if(self.newHouse.houseId != ""){
            humLbl.text = (newHouse.humidity! as NSNumber).stringValue + "%"
            tempLbl.text = (newHouse.temperature! as NSNumber).stringValue + "°F"
        }else{
            humLbl.text = "-"
            tempLbl.text = "-"
        }
        
        if ( UserDefaults.standard.string(forKey: "fullName") != nil){
            greetingLbl.text = "Hello, " + UserDefaults.standard.string(forKey: "fullName")!
        }else{
            greetingLbl.text = "Hello"
        }
    }
    
    func setupGreetingLbl(){
        
        greetingLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greetingLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        greetingLbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        greetingLbl.heightAnchor.constraint(equalToConstant:100).isActive = true
    }
    
    func setupTemptitle(){
        tempTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempTitle.topAnchor.constraint(equalTo: greetingLbl.bottomAnchor, constant: 10).isActive = true
        tempTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        tempTitle.heightAnchor.constraint(equalToConstant:60).isActive = true
    }
    
    func setupTempLbl(){
        tempLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLbl.topAnchor.constraint(equalTo: tempTitle.bottomAnchor, constant: 10).isActive = true
        tempLbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        tempLbl.heightAnchor.constraint(equalToConstant:60).isActive = true
    }
    
    
    func setupHumTitle(){
        humTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        humTitle.topAnchor.constraint(equalTo: tempLbl.bottomAnchor, constant: 10).isActive = true
        humTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        humTitle.heightAnchor.constraint(equalToConstant:60).isActive = true
    }
    
    func setupHumLbl(){
        humLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        humLbl.topAnchor.constraint(equalTo: humTitle.bottomAnchor, constant: 10).isActive = true
        humLbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        humLbl.heightAnchor.constraint(equalToConstant:60).isActive = true
    }
    
    func setupChartBtn(){
        chartBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chartBtn.topAnchor.constraint(equalTo: humLbl.bottomAnchor, constant: 30).isActive = true
        chartBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        chartBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleChartClick(){
        self.navigationController?.pushViewController(chartViewController, animated: true)
        
    }
    
    @objc func handleLogout(){
        GIDSignIn.sharedInstance().signOut()
        self.navigationController?.popViewController(animated: true)
    }
    


}

extension UIColor {
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
