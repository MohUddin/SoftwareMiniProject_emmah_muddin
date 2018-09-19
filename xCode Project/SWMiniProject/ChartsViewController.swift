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
    //Array of houses
    
    @IBOutlet weak var lineChart: LineChartView!
    
    let titleLbl:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(r: 132, g: 193, b: 77)
        lbl.text = "Temperature & Humidity Over the Last 5 Hours"
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(titleLbl)
        
        setupTitleLbl()
        setupChart()
        
       chartQuery()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        chartQuery()
    }
    
    
    
    
    
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func chartQuery(){
        var homeArray = [House]()
        
        //Get securely stored user information
        let userId = KeychainWrapper.standard.string(forKey: "userId")
        let houseId = KeychainWrapper.standard.string(forKey: "houseId")
        
        
        
        //Query using stored values
        let homeRef = Firestore.firestore().collection("Users").document(userId!).collection(houseId!)
        
        //Gather documents of 5 most recent hours
        homeRef.order(by: "time").limit(to: 5)
        .getDocuments{ (collSnapshot, error) in
            
            guard let collSnapshot = collSnapshot, !collSnapshot.isEmpty else{
                return
            }
            
            print("SUCCESSFULLY GOT DOC SNAPSHOT")
            let querySnapArray = collSnapshot.documents
            
            //Putting data into array of houses
            for docs in querySnapArray{
                var newData = docs.data()
                
                var newHouse = House()
                newHouse.houseId = houseId
                newHouse.humidity = newData["humidity"] as? Int
                newHouse.temperature = newData["temperature"] as? Int
                
                homeArray.append(newHouse)
            }
            
            self.updateGraph(arr: homeArray)
            
            
    
           
        }
        
        
       
        
        
    }
    
    func updateGraph(arr: [House]){
        
        var tempLineGraphEntry = [ChartDataEntry]()
        var humLineGraphEntry = [ChartDataEntry]()
        
        for i in 0..<arr.count {
            let temp = ChartDataEntry(x: Double(i), y: (Double(arr[i].temperature!)))
            
            let hum = ChartDataEntry(x: Double(i), y: (Double(arr[i].humidity!)))
    
            
            print("TEMP: \(arr[i].temperature)")
            tempLineGraphEntry.append(temp)
            humLineGraphEntry.append(hum)
        }
        
        let line1 = LineChartDataSet(values: tempLineGraphEntry, label: "Temperature")
        let line2 = LineChartDataSet(values: humLineGraphEntry, label: "Humidity")
        
        line1.colors = [NSUIColor.blue]
        line2.colors = [NSUIColor.red]
        
        let data = LineChartData()
        data.addDataSet(line1)
        data.addDataSet(line2)
        
        lineChart.data = data
        
    }
    
    func setupTitleLbl(){
        titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        titleLbl.widthAnchor.constraint(equalToConstant: 400).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant:100).isActive = true
    }
    
    func setupChart(){
        lineChart.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
    }
    
    
}
