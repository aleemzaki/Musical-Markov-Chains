//
//  GlobalVars.swift
//  MusicalMarkovChains
//
//  Created by Aleem Zaki on 4/15/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import Foundation

class GlobalVars{
    
    static var completedArray = [Bool]()
    static var readyToOrchestrate = Bool()
    static var globalchosenInstrumentArray: [String] = []
    static var globalmarkovDict = [String:[Double]]()// = ["sitar":[7.3,4.3]]
    static var lengthChain = 10
}
