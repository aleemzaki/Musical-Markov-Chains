//
//  MarkovViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem on 4/7/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit
class MarkovViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var dictionaryLabel: UILabel!
    
    
    /*
     Clarence tyr to find a way to make these variables global such that we don't have to keep passing them between MarkovViewController and MarkovEditViewController via prepare for segues funcs
 
     Then try to make an Orchestrate button that will segue to a new View Controller if all the instrument's in instrumList have had their Markov chains completed and confirmed (their prs add up to one)
    */
    var instrumlist: [String]?
    var markovDict: [String:[Double]] = ["sitar":[7.3,4.3]]
    var justCompletedInstrum: String?
    var markovDoubles: [Double] = []
    
    override func viewDidLoad() {
        MCoutlet.dataSource = self
        MCoutlet.delegate = self
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func update(){//called by MarkovEditViewController only when its values add up to 1
        print(markovDict.description)
        markovDict[justCompletedInstrum!] = markovDoubles
        print(markovDict.description)
        //dictionaryLabel.text="markovDict.description"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (instrumlist?.count)!
        
    }
    
    
    
    @IBOutlet weak var MCoutlet: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "markovReuse", for: indexPath) as? markovCell
        temp?.instrumLabel.text = instrumlist?[indexPath.item]
        if (temp?.instrumLabel.text == justCompletedInstrum){
            temp?.statusLabel.text = "complete!"
            temp?.statusLabel.textColor = UIColor.green
        } else {
            temp?.statusLabel.text = "incomplete"
            //temp?.statusLabel.textColor = UIColor.green
        }
        return temp!
        /*let temp = tableView.dequeueReusableCell(withIdentifier: "viewCellReuse", for: indexPath) as? categoryviewcell
         _ = pokemonArray?[indexPath.item ]
         temp?.imageView.image = UIImage(named: _!)
         return temp!*/
        
    }
    var instrumBeingEditedString = String()
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? markovCell {
            instrumBeingEditedString = cell.instrumLabel.text!
        }
       // selectedIndexPath = indexPath
        //instrumBeingEditedString =
        performSegue(withIdentifier: "markovToMarkovEdit", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        
        if segue.identifier == "markovToMarkovEdit" {
            let destination = segue.destination as? MarkovEditViewController
            destination?.editableInstrumlist = instrumlist
            destination?.InstrBeingEdited = instrumBeingEditedString//instrumLabel.text
        }
    }
    
    
   // @IBOutlet weak var tableViewOutlet: UITableView!
    
}
