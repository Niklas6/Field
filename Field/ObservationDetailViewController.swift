//
//  ObservationDetailViewController.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import UIKit

class ObservationDetailViewController: UIViewController {
    
    var Observation: Observation1?
    
    var dateFormatter = DateFormatter()

    @IBOutlet weak var ObserveIconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        ObserveIconImageView.image = Observation?.classification.image
        titleLabel.text = Observation?.title
        descriptionLabel.text = Observation?.description
        
        if let date = Observation?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }

        // Do any additional setup after loading the view.
    }
    
}
