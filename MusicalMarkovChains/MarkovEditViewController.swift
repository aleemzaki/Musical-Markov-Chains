//
//  MarkovEditViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem on 4/7/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit
class MarkovEditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var editableInstrumlist: [String]?
    var InstrBeingEdited: String?
    var markovEditValues: [Float32]?
    
    override func viewDidLoad() {
       markovEditOutlet.dataSource = self
       markovEditOutlet.delegate = self
       super.viewDidLoad()
       initarray()
    }
    func initarray(){
        //markovEditValues.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var confirmButton: UIButton!
    var i = Int()
    @IBAction func confirmButtonPushed(_ sender: Any) {
        
    }
    @IBOutlet weak var markovEditOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (editableInstrumlist?.count)!
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "markovEditReuse", for: indexPath) as? markovEditCell
        temp?.PrLabel.text = "Pr["+InstrBeingEdited!+" to "+(editableInstrumlist?[indexPath.item])!+"]"
        temp?.markoveditcelltextfield.keyboardType = UIKeyboardType.decimalPad
        if (indexPath.item == 0) {
           // temp?.markoveditcelltextfield.text = "1"
        } else {
           // temp?.markoveditcelltextfield.text = "0"
        }
       /* i = 0
        while (i < (editableInstrumlist?.count)!) {
            
            markovEditValues?.append(temp.)
            i = i + 1
        }*/
        if (indexPath.item ==
            ((editableInstrumlist?.count)! - 1)) {
            confirm(tableView,cellForRowAt: indexPath)
        }
        return temp!
        /*let temp = tableView.dequeueReusableCell(withIdentifier: "viewCellReuse", for: indexPath) as? categoryviewcell
         _ = pokemonArray?[indexPath.item ]
         temp?.imageView.image = UIImage(named: _!)
         return temp!*/
        
    }
    func confirm(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) {
        i = 0
        while (i < (editableInstrumlist?.count)!) {
            if let testcell = tableView.cellForRow(at: indexPath) as? markovEditCell {
                
                markovEditValues?.append(Float(testcell.markoveditcelltextfield.text!)!)
            }
            i = i + 1
        }
        print(markovEditValues)
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // selectedIndexPath = indexPath
        
        //performSegue(withIdentifier: "categoryToInfo", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        
        /*  if segue.identifier == "categoryToInfo" {
         let destination = segue.destination as? PokemonInfoViewController
         destination?.pokemon = pokemonArray?[(selectedIndexPath?.row)!]
         destination?.image = cachedImages[(selectedIndexPath?.row)!]
         }*/
    }
    
    
    // @IBOutlet weak var tableViewOutlet: UITableView!
    
}
