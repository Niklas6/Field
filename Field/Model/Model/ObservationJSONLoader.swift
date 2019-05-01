//
//  ObservationJSONLoader.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import Foundation

class ObservationJSONLoader {
    
    
    class func load(fileName: String) -> Observations1? {
        var observations: Observations1?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        if let jsonFileUrl = Bundle.main.url(forResource: fileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            observations = try? jsonDecoder.decode(Observations1.self, from: jsonData)
            
        }
        
    return observations
        
    }
}
