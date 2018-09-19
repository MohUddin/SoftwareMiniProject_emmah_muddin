//
//  ChartsViewController.swift
//  SWMiniProject
//
//  Created by Emma Howard on 9/19/18.
//  Copyright © 2018 Emma Howard. All rights reserved.
//

import Foundation
import UIKit
import Charts
import Firebase
import SwiftKeychainWrapper

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var lineChart: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
    }
    
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func chartQuery(){
        //Array of house objects
        var homeArray = [House]()
        
        //Get securely stored user information
        let userId = KeychainWrapper.standard.string(forKey: "userId")
        let houseId = KeychainWrapper.standard.string(forKey: "houseId")
        
        var newHouse = House()
        
        //Query using stored values
        let homeRef = Firestore.firestore().collection("Users").document(userId!).collection(houseId!)
        
        //Gather documents of 5 most recent hours
        homeRef.order(by: "time").limit(to: 5)
        .getDocuments{ (collSnapshot, error) in
            
            guard let collSnapshot = collSnapshot, collSnapshot.isEmpty else{
                return
            }
            
            let querySnapArray = collSnapshot.documents
            
            //Putting data into array of houses
            for docs in querySnapArray{
                let newData = docs.data()
                
                
                newHouse.houseId = houseId
                newHouse.humidity = newData["humidity"] as? Int
                newHouse.temperature = newData["temperature"] as? Int
                
                homeArray.append(newHouse)
            }
            
            
            
        }
        
    }
    
}
