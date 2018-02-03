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

        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .current

        let sunCalc = SunCalc()
        let now = Date()
        let location = SunCalc.Location(latitude: 75.0, longitude: 120.0)
        do {
            let rise = try sunCalc.time(ofDate: now, forSolarEvent: .sunrise, atLocation: location)
            let sunrise = formatter.string(from: rise)
            print("Sunrise: \(sunrise)")
        }
        catch let e as SunCalc.SolarEventError {
            switch e {
            case .sunNeverRise:
                print("Sun never rise")
            case .sunNeverSet:
                print("Sun never set")
            }
        }
        catch let e {
            print("Unknown error: \(e)")
        }

        do {
            let set = try sunCalc.time(ofDate: now, forSolarEvent: .sunset, atLocation: location)
            let sunset = formatter.string(from: set)
            print("Sunset: \(sunset)")
        }
        catch let e as SunCalc.SolarEventError {
            switch e {
            case .sunNeverRise:
                print("Sun never rise")
            case .sunNeverSet:
                print("Sun never set")
            }
        }
        catch let e {
            print("Unknown error: \(e)")
        }

        do {
            let aDusk = try sunCalc.time(ofDate: now, forSolarEvent: .astronomicalDusk, atLocation: location)
            let astronomicalDusk = formatter.string(from: aDusk)
            print("Astronomical Dusk: \(astronomicalDusk)")
        }
        catch let e as SunCalc.SolarEventError {
            switch e {
            case .sunNeverRise:
                print("Sun never rise")
            case .sunNeverSet:
                print("Sun never set")
            }
        }
        catch let e {
            print("Unknown error: \(e)")
        }

        do {
            let moonTimes = try sunCalc.moonTimes(date: now, location: location)
            print("Moonrise: \(formatter.string(from: moonTimes.moonRiseTime))")
            print("Moonset: \(formatter.string(from: moonTimes.moonSetTime))")
        }
        catch let e as SunCalc.LunarEventError {
            switch e {
            case .moonNeverRise:
                print("Moon never rise")
            case .moonNeverSet:
                print("Moon never set")
            }
        }
        catch let e {
            print("Unknown error: \(e)")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

