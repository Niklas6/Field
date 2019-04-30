//
//  ObservationJSON.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import Foundation

class  ObservationJSON {
    
    static let dateFormater = DateFormatter()
    
    class func parse(_ data: Data) -> [Observation] {
        var Observations = [Observation]()
        dateFormater.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
        let root = json as? [String: Any],
        let status = root["status"] as? String,
        status == "ok" {
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationName = observation["classification"],
                        let title = observation["title"],
                        let description = observation["description"],
                        let dateString = observation["date"],
                        let date = dateFormater.date(from: dateString) {
                            
                            if let Observation = Observation( classificationName: classificationName, title: title, description: description, date: date) {
                                Observations.append(Observation)
                            }
                        }
                    }
                }
            }
        }
        
        
        return Observations
    }
}
