//
//  Observation.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import Foundation

struct Observation {
    let classification: Obs
    let title: String
    let description: String
    let date: Date
    
    init(classification: Obs, title: String, description: String, date: Date) {
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(classificationName: String, title: String, description: String, date: Date) {
        if let classification = Obs(rawValue: classificationName){
            self.init(classification: classification, title: title, description: description, date: date)
        } else {
            return nil
        }
    }
    
}
