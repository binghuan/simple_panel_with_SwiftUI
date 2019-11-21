//
//  ContentView.swift
//  mySample
//
//  Created by binghuan on 10/6/19.
//  Copyright © 2019 Studio Bing-Huan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var routingViewModel: RoutingViewModel
    
    func getHeightOfList()->CGFloat {
        return CGFloat(routingViewModel.routingArray.count * 60)
    }
    
    var body: some View {
        VStack() {
            Spacer()
            HStack() {
                Spacer()
                Button(action: {
                    self.routingViewModel.isExpanded = false
                }) {
                    if(routingViewModel.isExpanded) {
                        Image(systemName: "arrowtriangle.down.circle.fill")
                    }
                }
            }.padding()
            List {
                
                if(routingViewModel.isExpanded) {
                    
                    ForEach(routingViewModel.routingArray) { routingPath in
                        RoutingPathRow(routingPath: routingPath)
                    }
                    .onDelete(perform: delete)
                    
                }
                
            }.frame(height: routingViewModel.isExpanded ? self.getHeightOfList():0)
            
            HStack() {
                Text("現在車資 NTD: \(self.routingViewModel.getTotalPrice())")
                Spacer()
                Button(action: {
                    if(self.routingViewModel.isExpanded) {
                        if(self.routingViewModel.routingArray.count == 2) {
                            self.routingViewModel.routingArray.insert(
                                RoutingPath(id: 3,type: 3, address: "台北101", price: 400),
                                at: self.routingViewModel.routingArray.count - 1)
                        } else if(self.routingViewModel.routingArray.count == 3) {
                            self.routingViewModel.routingArray.insert(
                                RoutingPath(id: 4,type: 3, address: "淡水老街", price: 200),
                                at: self.routingViewModel.routingArray.count - 1)
                        }
                    } else {
                        self.routingViewModel.isExpanded = true
                    }
                }) {
                    if(routingViewModel.isExpanded) {
                        HStack {
                            Text("新增行程").foregroundColor(Color.white)
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color.white)
                        }
                        
                    } else {
                        HStack {
                            Text("展開行程").foregroundColor(Color.white)
                            Image(systemName: "arrowtriangle.up.circle.fill")
                                .foregroundColor(Color.blue)
                        }
                    }
                }.disabled(routingViewModel.routingArray.count >= 4
                    && self.routingViewModel.isExpanded )
                    .foregroundColor(getColorStateForAddingItem())
            }.padding()
                .background(Color.orange)
            Spacer().frame(height: 200)
        }
        .alert(isPresented: $routingViewModel.isAlertEnabled) {
            Alert(title: Text("WARNING"), message: Text("Please don't delete your pickup location and destination"), dismissButton: .default(Text("Got it!")))
        }
    }
    
    func getColorStateForAddingItem() -> Color {
        
        if(routingViewModel.routingArray.count >= 4) {
            return Color.gray
        }
        
        return Color.blue
    }
    
    func delete(at offsets: IndexSet) {
        if(offsets.contains(0) || offsets.contains(routingViewModel.routingArray.count-1)) {
            
            routingViewModel.isAlertEnabled = true
            
        } else {
            routingViewModel.routingArray.remove(atOffsets: offsets)
            routingViewModel.isAlertEnabled = false
        }   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(RoutingViewModel())
    }
}
