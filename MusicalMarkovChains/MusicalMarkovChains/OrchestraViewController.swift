//
//  OrchestraViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem Zaki on 4/15/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension Double {
    private static let arc4randomMax = Double(UInt32.max)
    
    static func random0to1() -> Double {
        return Double(arc4random()) / arc4randomMax
    }
}



class OrchestraViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var chainArray: [String] = []
    var player: AVAudioPlayer?

    
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
        var i = 0.0
        for item in chainArray {
            let when = DispatchTime.now() + Double(1.5 * i) // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.playSound(instrName: item)
                print("playing", item)
            }
            i += 1
        }
    }
    
    func playSound(instrName: String) {
        switch instrName {
        case "trumpet":
            let url = Bundle.main.url(forResource: "trumpetapp", withExtension: "mp3")!
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "violin":
            let url = Bundle.main.url(forResource: "violinapp", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "flute":
            let url = Bundle.main.url(forResource: "fluteapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
                
                
            } catch let error as NSError {
                print(error.description)
            }
        case "elguitar":
            let url = Bundle.main.url(forResource: "elguiarapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "acguitar":
            let url = Bundle.main.url(forResource: "acguiatarapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "piano":
            let url = Bundle.main.url(forResource: "gpianoapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "keyboard":
            let url = Bundle.main.url(forResource: "keyboardapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        case "drum":
            let url = Bundle.main.url(forResource: "drumapp", withExtension: "wav")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        default:
            let url = Bundle.main.url(forResource: "trumpet", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        }

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
