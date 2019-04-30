//
//  ObservationsViewController.swift
//  Field
//
//  Created by Knobel, Niklas (MU-Student) on 4/30/19.
//  Copyright © 2019 Knobel, Niklas (MU-Student). All rights reserved.
//

import UIKit

class ObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ObservationsTableView: UITableView!
    
    
    
    let Observations = ObservationJSONLoader.load(fileName: "field_observations")
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hier")
        return Observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObservationCell", for: indexPath)
        if let cell = cell as? ObservationTableViewCell {
            let Observation = Observations[indexPath.row]
            cell.ObserveIconImageView.image = Observation.classification.image
            cell.titleLabel.text = Observation.title
            cell.dateLabel.text = dateFormatter.string(from: Observation.date)
            
        }
        print("hi")
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
            let row = ObservationsTableView.indexPathForSelectedRow?.row {
            destination.Observation = Observations[row]
        
        }
    }

}
