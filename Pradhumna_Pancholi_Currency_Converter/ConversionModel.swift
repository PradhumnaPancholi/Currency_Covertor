//
//  CurrencyCoverversionModel.swift
//  Pradhumna_Pancholi_Currency_Converter
//
//  Created by Pradhumna Pancholi on 2019-07-17.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

class ConversionModel {
    var fromCurrency : String?
    var tocurrency: String?
    var exChangeRate: Double?
    
    var currencies = ["USD", "CAD", "INR", "GBP", "TRY"].sorted()
}
