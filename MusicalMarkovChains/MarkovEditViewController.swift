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
    var markovEditValues: [String] = []
    var markovEditDoubles: [Double] = []
    var initonce : Bool = false
    
    override func viewDidLoad() {
       markovEditOutlet.dataSource = self
       markovEditOutlet.delegate = self
       super.viewDidLoad()
       initarray()
    markovchaineditlabel.text = markovEditValues.description
    }
    
    func initarray(){
        //markovEditValues.
        if (!initonce){
        for _ in editableInstrumlist! {
            markovEditValues.append(String(0.0))
        }
        print("I should only appear once!")
        initonce = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var confirmButton: UIButton!
    var i = Int()
    var total = Double()
    @IBAction func confirmButtonPushed(_ sender: Any) {
        print(markovEditValues)
        //Double(round(100*(Double(markovEditValues[0])))/100)
        for val in markovEditValues {
            markovEditDoubles.append(Double(round(100*(Double(val))!)/100))
        }
        total = 0
        print(markovEditDoubles)
        for doub in markovEditDoubles {
           total = total + doub
           // markovEditDoubles.append(Double(round(100*(Double(val))!)/100))
        }
        print((String(format: "%.2f", total))+" equal 1.00?" )
        if (String(format: "%.2f", total) == "1.00") {
            print("passed!")
        }
    }
    @IBOutlet weak var markovEditOutlet: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (editableInstrumlist?.count)!
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "markovEditReuse", for: indexPath) as? markovEditCell
        temp?.PrLabel.text = "Pr["+InstrBeingEdited!+" to "+(editableInstrumlist?[indexPath.item])!+"]"
        temp?.markoveditcelltextfield.keyboardType = UIKeyboardType.decimalPad
        //temp?.markoveditcelltextfield.text = String(markovEditValues[indexPath.item])
        
       /* i = 0
        while (i < (editableInstrumlist?.count)!) {
            
            markovEditValues?.append(temp.)
            i = i + 1
        }*/
        if (indexPath.item ==
            ((editableInstrumlist?.count)! - 1)) {
            //confirm(tableView,cellForRowAt: indexPath)
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
                
                markovEditValues.append(testcell.markoveditcelltextfield.text!)
            }
            i = i + 1
        }
        //print(markovEditValues)
    }
    
    @IBOutlet weak var markovchaineditlabel: UILabel!
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //l5.text  = String(format: "%.2f", (Zahl / 95) * 100)
        // selectedIndexPath = indexPath
        if let tempcell = tableView.cellForRow(at: indexPath) as? markovEditCell {
            //tempcell.markoveditcelltextfield.
            if ((tempcell.markoveditcelltextfield.text) != "") {
                let floatemp = Float(tempcell.markoveditcelltextfield.text!)!
                let stringtemp = String(format: "%.2f", floatemp)
                
            markovEditValues[indexPath.item] = stringtemp
                markovchaineditlabel.text = String(describing: markovEditValues)
                //markovEditDoubles.append(Double(round(100*(Double(markovEditValues[0]))!)/100))
                tempcell.markoveditcelltextfield.resignFirstResponder()
            }
        }
        
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
