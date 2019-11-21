/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for an individual landmark.
 */

import SwiftUI
import CoreLocation

struct RoutingPath: Identifiable, Hashable, Codable {
    var id: Int
    var type: Int
    var address: String
    var price: Int
}
