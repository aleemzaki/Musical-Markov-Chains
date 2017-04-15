//
//  OrchestraViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem Zaki on 4/15/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit
class OrchestraViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
       Orcoutlet.dataSource = self
       Orcoutlet.delegate = self
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //pageData
        //MyVariables.yourVariable
        return 100
        
    }
    
    
    @IBOutlet weak var Orcoutlet: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "orchestraReuse", for: indexPath) as? orchestraCell
        return temp!
        /*let temp = tableView.dequeueReusableCell(withIdentifier: "viewCellReuse", for: indexPath) as? categoryviewcell
         _ = pokemonArray?[indexPath.item ]
         temp?.imageView.image = UIImage(named: _!)
         return temp!*/
        
    }
    /*
    var instrumBeingEditedString = String()
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? markovCell {
            instrumBeingEditedString = cell.instrumLabel.text!
        }
        // selectedIndexPath = indexPath
        //instrumBeingEditedString =
        performSegue(withIdentifier: "markovToMarkovEdit", sender: nil)
        
    }
    */
    
    
    
    // @IBOutlet weak var tableViewOutlet: UITableView!
    
}
