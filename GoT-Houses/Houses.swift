//
//  Houses.swift
//  GoT-Houses
//
//  Created by Cameron Arrigo on 4/8/19.
//  Copyright © 2019 Cameron Arrigo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Houses {
    var houseArray: [HouseInfo] = []
    var apiURL = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber: Int = 1
    
    
    func getHouses(completed: @escaping () -> () ) {
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json == [] {
                    self.apiURL = ""
                }
                self.pageNumber += 1
                self.apiURL = "https://www.anapioficeandfire.com/api/houses?page=\(self.pageNumber)&pageSize=50"
                for index in 0..<json.count {
                    let name = json[index]["name"].stringValue
                    let region = json[index]["region"].stringValue
                    let coatOfArms = json[index]["coatOfArms"].stringValue
                    let words = json[index]["words"].stringValue
                    self.houseArray.append(HouseInfo(name: name, region: region, coatOfArms: coatOfArms, words: words))
                }
            case .failure(let error):
                print("*** ERROR: \(error.localizedDescription) calling Alamofire at URl \(self.apiURL)")
            }
            completed()
        }
    }
    
    
}
