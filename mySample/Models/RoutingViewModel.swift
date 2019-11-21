//
//  File.swift
//  mySample
//
//  Created by binghuan on 10/6/19.
//  Copyright © 2019 Studio Bing-Huan. All rights reserved.
//

import Combine
import SwiftUI

final class RoutingViewModel: ObservableObject {
    @Published var isAbleToAddItem = true
    @Published var isExpanded:Bool = false
    @Published var routingArray = routingData
    @Published var isAlertEnabled:Bool = false
    
    func getTotalPrice() -> Int {
        var totalPrice:Int = 0
        for routingPath in routingArray {
            totalPrice += routingPath.price
        }
        return totalPrice
    }
}
