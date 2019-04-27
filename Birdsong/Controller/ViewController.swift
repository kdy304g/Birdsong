//
//  ViewController.swift
//  Birdsong
//
//  Created by Danny Kang on 3/28/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, TestViewControllerDelegate, UINavigationControllerDelegate {
    
    func testViewControllerGoBack(_ controller: TestViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var pickerRegions: UIPickerView!
    @IBOutlet weak var showRegion: UILabel!
    
    var regions: [String]!
    var region = "Northeast"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerRegions.delegate = self
        pickerRegions.dataSource = self
        regions = ["Northeast","Northwest","Southeast","Southwest"]
        if let index = regions.firstIndex(of: "Massachusetts") {
            pickerRegions.selectRow(index, inComponent: 0, animated: false)
        }
        showRegion.text = "The Region is Northeast"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return regions.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return regions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rowRegion = pickerRegions.selectedRow(inComponent: 0)
        showRegion.text = "The region is \(regions[rowRegion])"
        region = regions[rowRegion]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TestViewController {
            if let test = segue.destination as? TestViewController {
                test.regionName = region
                test.allQuestions = QuestionSet(region: region)
            }
        }
    }
}


