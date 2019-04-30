//
//  ObservationJSONLoader.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import Foundation

class ObservationJSONLoader {
    
    class func load(fileName: String) -> [Observation] {
        var observation = [Observation]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observation = ObservationJSON.parse(data)
        }
        
    }
    
}
