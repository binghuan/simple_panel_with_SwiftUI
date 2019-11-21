//
//  RoutingPathRow.swift
//  mySample
//
//  Created by binghuan on 10/6/19.
//  Copyright © 2019 Studio Bing-Huan. All rights reserved.
//

import SwiftUI

struct RoutingPathRow: View {
    
    var routingPath : RoutingPath
    
    var body: some View {
        
        HStack {
            Image(systemName: "car.fill")
                .foregroundColor(getColorForType())
                .padding()
            
            Text(routingPath.address)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
            Text(String(routingPath.price)).padding()
        }
    }
    
    func getColorForType() -> Color {
        
        var color = Color.blue
        
        switch(routingPath.type) {
        case 1:
            color = Color.blue
            break;
        case 2:
            color = Color.green
            break;
        case 3:
            color = Color.red
            break
        default:
            color = Color.blue
            break;
        }
        
        return color
    }
}

struct RoutingPathRow_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(routingData) { routingPath in
            RoutingPathRow(routingPath: routingPath)
        }
    }
}
