//
//  House.swift
//  SWMiniProject
//
//  Created by Emma Howard on 9/19/18.
//  Copyright © 2018 Emma Howard. All rights reserved.
//

import Foundation


struct House {
    var temperature: Int?
    var humidity: Int?
    var houseId: String?
    
    init() {
        temperature = nil
        humidity = nil
        houseId = ""
    }
    
    init(temp: Int, hum: Int, id: String) {
        temperature = temp
        humidity = hum
        houseId = id
    }
}
