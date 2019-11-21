//
//  RoutingData.swift
//  mySample
//
//  Created by binghuan on 10/6/19.
//  Copyright © 2019 Studio Bing-Huan. All rights reserved.
//

import Combine
import SwiftUI

final class RoutingViewModel: ObservableObject {
    @Published var isAbleToAddNewItem = true
    @Published var routingArray = routingData
}

let routingData = [
    
    RoutingPath(id: 1, type: 1, address: "Hello" ),
    RoutingPath(id: 2, type: 2, address: "ok" )
]
