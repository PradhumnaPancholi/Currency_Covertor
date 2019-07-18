//
//  ExchangeServices.swift
//  Pradhumna_Pancholi_Currency_Converter
//
//  Created by Pradhumna Pancholi on 2019-07-18.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ExchangeRateServices {
    
    static let instance = ExchangeRateServices()
    
    //data required to make a request//
    let BASE_URL = "https://api.exchangeratesapi.io/latest?"
    let HEADER = [
        "Content-Type": "Application/JSON; charset = UTF-8"
    ]
    
    
    //function to get exchange rate//
    func getExchangeRate(fromIndex: String, toIndex : String) {
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
