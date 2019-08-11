//
//  ViewController.swift
//  Pradhumna_Pancholi_Currency_Converter
//
//  Created by Pradhumna Pancholi on 2019-07-17.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //outlets//
    @IBOutlet weak var fromCurrency: UITextField!
    @IBOutlet weak var toCurrency: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var fromCurrencyDisplay: UILabel!
    @IBOutlet weak var toCurrencyDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

    //variables//
    var currencyModel = ConversionModel()
    var fromIndex = ""
    var toIndex = ""
    
    //for picker view//
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyModel.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyModel.currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(row) - \(component)")
        
        //for "from" currency//
        if(component == 0){
            let fromIndex = currencyModel.currencies[row]
            fromCurrencyDisplay.text = fromIndex
        }else {
            //for "to" currency//
            let toIndex = currencyModel.currencies[row]
            toCurrencyDisplay.text = toIndex
        }
    }

    @IBAction func findExchangeRatePressed(_ sender: UIButton) {
        
        //data required to make a request//
        let BASE_URL = "https://api.exchangeratesapi.io/latest?"
        let HEADER = [
            "Content-Type": "Application/JSON; charset = UTF-8"
        ]
        
        let ER_URL = "\(BASE_URL)base=\(fromIndex)&symbols=\(toIndex)"//URL for req//
        Alamofire.request(ER_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).response { (response) in
            if response.error == nil {
                print(ER_URL as String)
            }else{
                debugPrint(response.error as Any)
            }
        }
    }
}


