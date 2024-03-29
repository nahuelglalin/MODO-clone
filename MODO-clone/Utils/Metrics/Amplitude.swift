//
//  Amplitude.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/02/2024.
//

import Foundation
import AmplitudeSwift

let AMPLITUDE_API_KEY = "482daa73629be6c2292f09d94f0fa7c7"

class AmplitudeMetrics {
    static let shared = AmplitudeMetrics()
    static var amplitude: Amplitude = {
           return Amplitude(configuration: Configuration(apiKey: AMPLITUDE_API_KEY))
       }()
    
    static func logEvent(_ event: String) {
        print("Log Amplitude Event: ", event)
        amplitude.track(eventType: event)
    }
}

