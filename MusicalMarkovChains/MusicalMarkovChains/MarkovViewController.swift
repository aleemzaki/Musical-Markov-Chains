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
    
    @IBOutlet weak var OrchestrateButton: UIButton!
    @IBAction func OrchestrateButtonPressed(_ sender: Any) {
        if (GlobalVars.readyToOrchestrate) {
           performSegue(withIdentifier: "toOrchestrate", sender: nil)
         } else {
            let alert = UIAlertController(title: "Error", message: "Not all of the instruments' Markov Chains have been completed", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
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
        //print(markovDict.description)
        markovDict[justCompletedInstrum!] = markovDoubles
        //print(markovDict.description)
        //dictionaryLabel.text="markovDict.description"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //pageData
        //MyVariables.yourVariable
        return (instrumlist?.count)!
        
    }
    
    
    
    @IBOutlet weak var MCoutlet: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "markovReuse", for: indexPath) as? markovCell
        temp?.instrumLabel.text = instrumlist?[indexPath.item]
        if (/*temp?.instrumLabel.text == justCompletedInstrum*/
            GlobalVars.completedArray[indexPath.item] == true
            ){
            temp?.statusLabel.text = "complete!"
            temp?.statusLabel.textColor = UIColor.green
        } else {
            temp?.statusLabel.text = "incomplete"
            //temp?.statusLabel.textColor = UIColor.green
        }
        //var readyToOrchestrate = Bool()
        GlobalVars.readyToOrchestrate = true
        for isComplete in GlobalVars.completedArray {
            if isComplete == false {
                GlobalVars.readyToOrchestrate = false
            }
        }
        if GlobalVars.readyToOrchestrate {
            
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
        if segue.identifier == "toOrchestrate" {
            let goal = segue.destination as? OrchestraViewController
            print("here")
            goal?.note = "hi"
            var chainArray: [String] = []
            var currentKey = GlobalVars.globalchosenInstrumentArray[0]
            print(currentKey)
            var i = 0
            while i < GlobalVars.lengthChain {
                if (i == 0) {
                    //initial state
                    chainArray.append(currentKey)
                }
                else {
                    print("Dict:", GlobalVars.globalmarkovDict)
                    var currentTuple = GlobalVars.globalmarkovDict[currentKey] as [Double]?
                    print("Current Tuple:", currentTuple)
                    let random = Double(drand48())
                    print("random: ", random)
                    var indexInTuple = -1
                    var currTotalCDF = 0.0
                    while (currTotalCDF < random) {
                        print("Index: ", indexInTuple)
                        indexInTuple += 1
                        currTotalCDF += (currentTuple?[indexInTuple])!
                        
                    }
                    var nextKey = GlobalVars.globalchosenInstrumentArray[indexInTuple]
                    chainArray.append(nextKey)
                    currentKey = nextKey
                    print(nextKey)
                }
                i += 1
            }
            goal?.chainArray = chainArray
        }
        
        
    }
    
    @IBAction func editToMarkov(segue:UIStoryboardSegue){
        let source = segue.source as! MarkovEditViewController
        if (source.completed){
            print("EditToMarkov")
            print("EditToMarkov")
            print("EditToMarkov")

            self.justCompletedInstrum = source.InstrBeingEdited
            self.markovDoubles = (source.markovEditDoubles)
            self.update()
        }
        self.instrumlist = source.editableInstrumlist
    }

    
    
   // @IBOutlet weak var tableViewOutlet: UITableView!
    
}
