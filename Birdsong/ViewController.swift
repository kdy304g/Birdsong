//
//  ViewController.swift
//  Birdsong
//
//  Created by Danny Kang on 3/28/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerRegions: UIPickerView!
    @IBOutlet weak var showRegion: UILabel!
    @IBOutlet weak var showSeason: UILabel!
    
    var regions: [String]!
    var seasons: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerRegions.delegate = self
        pickerRegions.dataSource = self
        seasons = ["Spring", "Summer", "Fall", "Winter"]
        regions = ["New England","Massachusetts","Maine","New York", "New Hampshire", "Vermont"]
        if let index = regions.firstIndex(of: "Massachusetts") {
            pickerRegions.selectRow(index, inComponent: 0, animated: false)
        }
        
        showRegion.text = "The Region is: Massachusetts at Spring"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return seasons.count
        } else {
            return regions.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return seasons[row]
        } else {
            return regions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let region = regions[row]
        let season = seasons[row]
        showRegion.text = "The region is \(region) at \(season)"
        
    }

}

