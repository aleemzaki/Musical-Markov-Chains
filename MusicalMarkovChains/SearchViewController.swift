//
//  SearchViewController.swift
//  MusicalMarkovChains
//
//  Created by Aleem on 4/6/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var chosenInstrumentArray: [String] = []
    var player: AVAudioPlayer?
    //struct MyVariables {
        static var yourVariable = "someString"
    
    
    override func viewDidLoad() {
        CVCoutlet.dataSource = self
        CVCoutlet.delegate = self//UICollectionViewDelegate = self
        //CVCoutlet
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var CVCoutlet: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let temp = collectionView
        
        let temp = collectionView.dequeueReusableCell(withReuseIdentifier: "instCellReuse", for: indexPath) as? instrumentCell
        //temp?.outletll.text = "UNSELCTD"
        //let cellString = PokemonGenerator.categoryDict[indexPath.item ]
        switch indexPath.item {
        case 0:
            temp?.outletii.image = #imageLiteral(resourceName: "Trumpet")
        case 1:
            temp?.outletii.image = #imageLiteral(resourceName: "violin")
        case 2:
            temp?.outletii.image = #imageLiteral(resourceName: "flute")
        case 3:
            temp?.outletii.image = #imageLiteral(resourceName: "EL.guitar")
        case 4:
            temp?.outletii.image = #imageLiteral(resourceName: "Acoutsitcguitar")
        case 5:
            temp?.outletii.image = #imageLiteral(resourceName: "gpiano")
        case 6:
            temp?.outletii.image = #imageLiteral(resourceName: "keyboard")
        case 7:
            temp?.outletii.image = #imageLiteral(resourceName: "drum")
        default:
            temp?.outletii.image = #imageLiteral(resourceName: "Trumpet")
            
            
        }
        //temp?.imageView.image = UIImage(named: cellString!)
        return temp!
        
        // return PokemonGenerator.categoryDict
    }
    
    @IBOutlet weak var instrToMarkovButton: UIButton!
    
    @IBAction func continueWithSelInstrPressed(_ sender: UIButton) {
       // view.backgroundColor = UIColor.green
        performSegue(withIdentifier: "instrumentToMarkov", sender: nil)
        print("success!")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let temp = [Pokemon]
        var i = Int()
        i = 0
        var cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        if (cell.backgroundColor != UIColor.blue){
            cell.backgroundColor = UIColor.blue
            switch indexPath.item {
            case 0:
                chosenInstrumentArray.append("trumpet")
                let url = Bundle.main.url(forResource: "trumpet", withExtension: "mp3")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 1:
                chosenInstrumentArray.append("violin")
                let url = Bundle.main.url(forResource: "violinapp", withExtension: "mp3")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 2:
                chosenInstrumentArray.append("flute")
                let url = Bundle.main.url(forResource: "fluteapp", withExtension: "wav")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 3:
                chosenInstrumentArray.append("elguitar")//electric guitar
                let url = Bundle.main.url(forResource: "elguiarapp", withExtension: "wav")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 4:
                chosenInstrumentArray.append("acguitar")//acoustic guitar
                let url = Bundle.main.url(forResource: "acguiatarapp", withExtension: "wav")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 5:
                chosenInstrumentArray.append("piano")
                let url = Bundle.main.url(forResource: "gpianoapp", withExtension: "wav")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 6:
                chosenInstrumentArray.append("keyboard")
                let url = Bundle.main.url(forResource: "keyboardapp", withExtension: "wav")!
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                    player.play()
                } catch let error as NSError {
                    print(error.description)
                }
            case 7:
                chosenInstrumentArray.append("drum")
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
                chosenInstrumentArray.append("trumpet")
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
        } else {
           cell.backgroundColor = UIColor.white
            i=0
            switch indexPath.item {
            case 0:
                while chosenInstrumentArray[i] != "trumpet" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 1:
                while chosenInstrumentArray[i] != "violin" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 2:
                while chosenInstrumentArray[i] != "flute" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 3:
                while chosenInstrumentArray[i] != "elguitar" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)//electric guitar
            case 4:
                while chosenInstrumentArray[i] != "acguitar" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 5:
                while chosenInstrumentArray[i] != "piano" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 6:
                while chosenInstrumentArray[i] != "keyboard" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            case 7:
                while chosenInstrumentArray[i] != "drum" {
                    i = i + 1
                }
                chosenInstrumentArray.remove(at: i)
            default:
                chosenInstrumentArray.append("trumpet")
            }
            
            //chosenInstrumentArray.remove
        }
        print(chosenInstrumentArray)
        //cell.outletll.text = "SELECTED"
        
        //collectionView.cellForItem(at: indexPath)?.isHighlighted = true//.cewithReuseIdentifier: "instCellReuse", for: indexPath) as? instrumentCell
        //temp?.outletll.text = "UNSELCTD"
        //let chosen = collectionView(collectionView: UICollectionView, cellForItemAt: indexPath)
        //chosen.outletll
        /*
         In didSelectItemAt you'll need to implement the following functionality:
         Use the filteredPokemon(ofType type: Int) function to get an array of Pokemon belonging to the selected category (based off the cell the user selected).
         Then perform a segue to CategoryViewController using the identifier you created in Part 1. (Though we've only gone over triggering segues in Storyboard by control-dragging from a button, you can trigger a segue that you created in Storyboard between two view controllers programmatically by calling the following method in your code: performSegue(withIdentifier: <YourSegueIdentifierFromStoryboard>, sender: <Any?>)
         */
        
        //performSegue(withIdentifier: "searchToCategory", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
       if segue.identifier == "instrumentToMarkov" {
            let destination = segue.destination as? MarkovViewController
            destination?.instrumlist = chosenInstrumentArray
            //[Bool](count:(destination?.instrumlist?.count)!, repeatedValue: nil)
            var tempcompletedArray = [Bool]( repeating: false, count: (destination?.instrumlist?.count)! )
            //completion
            //MyUniVariables.co
        //mp
            GlobalVars.completedArray = tempcompletedArray
            GlobalVars.globalchosenInstrumentArray = chosenInstrumentArray
            print(destination?.instrumlist)
        }
    }
    
    // Utility function to iterate through pokemon array for a single category
    /*func filteredPokemon(ofType type: Int) -> [Pokemon] {
        var filtered: [Pokemon] = []
        for pokemon in pokemonArray {
            if (pokemon.types.contains(PokemonGenerator.categoryDict[type]!)) {
                filtered.append(pokemon)
            }
        }
        return filtered
    }*/
    
    
}
