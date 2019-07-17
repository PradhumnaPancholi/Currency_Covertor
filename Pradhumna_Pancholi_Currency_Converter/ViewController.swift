//
//  ViewController.swift
//  Pradhumna_Pancholi_Currency_Converter
//
//  Created by Pradhumna Pancholi on 2019-07-17.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

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
        // Do any additional setup after loading the view.
    }

    //variables//
    var currencyModel = CurrencyCoversionModel()
    var fromIndex = 0
    var toIndex = 0
    var BASE_URL = "/api.exchangeratesapi.io/latest"
    
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

}

