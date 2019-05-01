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
    
    let jsonFileName = "field"
    var Obse: Observations1?
    //let Observations = ObservationJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        Obse = ObservationJSONLoader.load(fileName: jsonFileName)
        print(Obse?.observations.count ?? 0)
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Obse?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObservationCell", for: indexPath)
        //Obse?.observations[indexPath.row]
        if let cell = cell as? ObservationTableViewCell,
            let Observation = Obse?.observations[indexPath.row] {
            cell.titleLabel.text = Observation.title
            cell.dateLabel.text = dateFormatter.string(from: Observation.date)
            cell.ObserveIconImageView.image = Observation.classification.image
            
        }
        print("kk")
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
            let selectedIndexPath = ObservationsTableView.indexPathForSelectedRow {
            destination.Observation = Obse?.observations[selectedIndexPath.row]
        }
    }

}
