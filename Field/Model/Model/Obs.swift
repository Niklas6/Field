//
//  Obs.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import UIKit

enum Obs: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammel
    case plant
    case reptile
    
    var image : UIImage? {
        return UIImage(named: self.rawValue + "icon")
    }
}
