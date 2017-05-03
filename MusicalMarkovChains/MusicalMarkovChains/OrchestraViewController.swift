//
//  OrchestraViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem Zaki on 4/15/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    private static let arc4randomMax = Double(UInt32.max)
    
    static func random0to1() -> Double {
        return Double(arc4random()) / arc4randomMax
    }
}



class OrchestraViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var chainArray: [String] = []

    
    override func viewDidLoad() {
       Orcoutlet.dataSource = self
       Orcoutlet.delegate = self
        super.viewDidLoad()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //populate array
        print("ViewWillAppear")
        print("ViewWillAppear")
        print("ViewWillAppear")
        
        }
    
    var note = String()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //play sounds
        print("Chain Array length:")
        print(chainArray.count)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //pageData
        //MyVariables.yourVariable
        return chainArray.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140;//Choose your custom row height
    }
    
    @IBOutlet weak var Orcoutlet: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "orchestraReuse", for: indexPath) as! orchestraCell
        //temp?.orcLabel.text = indexPath.item.description
        temp.orcImage.image = UIImage(named: self.chainArray[indexPath.row])
        return temp
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
