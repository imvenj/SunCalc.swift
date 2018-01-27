//
//  ViewController.swift
//  SunCalcExample
//
//  Created by venj on 1/27/18.
//  Copyright © 2018 venj. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sunCalc = SunCalc()
        let now = Date()
        let location = Location(latitude: 25.0, longitude: 120.0)
        let set = sunCalc.time(ofDate: now, forSolarEvent: .sunset, atLocation: location)
        let aDusk = sunCalc.time(ofDate: now, forSolarEvent: .astronomicalDusk, atLocation: location)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .current
        let sunset = formatter.string(from: set)
        let astronomicalDusk = formatter.string(from: aDusk)
        print("Sunset: \(sunset)")
        print("Astronomical Dusk: \(astronomicalDusk)")

        let illumination = sunCalc.moonIllumination()
        let phase = illumination.phase
        print("Current moon phase \(phase)")


        let moonTimes = try? sunCalc.moonTimes(date: now, location: location)
        if let moonTimes = moonTimes {
            print("Moonrise: \(formatter.string(from: moonTimes.moonRiseTime))")
            print("Moonset: \(formatter.string(from: moonTimes.moonSetTime))")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

