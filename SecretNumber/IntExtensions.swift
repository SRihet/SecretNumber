//
//  IntExtensions.swift
//  SecretNumber
//
//  Created by Stéphane Rihet on 29/04/2020.
//  Copyright © 2020 SapinRocher. All rights reserved.
//

import Foundation

extension Int {
    
    init(withRandomNUmberBetween minValue:Int, and maxValue:Int) {
        self = minValue + Int(arc4random_uniform(UInt32(maxValue-minValue+1)))
    }
}
