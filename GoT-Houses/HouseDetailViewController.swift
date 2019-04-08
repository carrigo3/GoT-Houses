//
//  HouseDetailViewController.swift
//  GoT-Houses
//
//  Created by Cameron Arrigo on 4/8/19.
//  Copyright © 2019 Cameron Arrigo. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo: HouseInfo!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = houseInfo.name
        if houseInfo.words != "" {
            //Need escaping characters to insert ""
            wordsLabel.text = "\"\(houseInfo.words)\""
        } else {
            wordsLabel.text = ""
        }
        regionLabel.text = houseInfo.region
        regionImageView.image = UIImage(named: houseInfo.region)
        if houseInfo.coatOfArms == "" {
            coatOfArmsLabel.isHidden = true
            coatOfArmsTextView.isHidden = true
        } else {
            coatOfArmsTextView.text = houseInfo.coatOfArms
        }
    }
    



}
