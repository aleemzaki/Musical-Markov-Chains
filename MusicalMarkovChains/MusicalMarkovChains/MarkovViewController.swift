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
    
    
    var instrumlist: [String]?
    
    override func viewDidLoad() {
        MCoutlet.dataSource = self
        MCoutlet.delegate = self
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (instrumlist?.count)!
        
    }
    @IBOutlet weak var MCoutlet: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "markovReuse", for: indexPath) as? markovCell
        temp?.instrumLabel.text = instrumlist?[indexPath.item]
        return temp!
        /*let temp = tableView.dequeueReusableCell(withIdentifier: "viewCellReuse", for: indexPath) as? categoryviewcell
         _ = pokemonArray?[indexPath.item ]
         temp?.imageView.image = UIImage(named: _!)
         return temp!*/
        
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
