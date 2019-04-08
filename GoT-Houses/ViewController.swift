//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Cameron Arrigo on 4/8/19.
//  Copyright © 2019 Cameron Arrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var houses = Houses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        houses.getHouses {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHouseInfo" {
            let destination = segue.destination as! HouseDetailViewController
            let selectedIndex = tableView.indexPathForSelectedRow!
            destination.houseInfo = houses.houseArray[selectedIndex.row]
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if houses.houseArray.count >= 50 && houses.apiURL != "" {
            houses.getHouses {
                tableView.reloadData()
            }
        }
        return houses.houseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(houses.houseArray[indexPath.row].name)"
        return cell
    }
    
    
}

