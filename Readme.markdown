# SunCalc.swift

A direct port of [suncalc](https://github.com/mourner/suncalc) javascript library ([commit b08d1f6f8](https://github.com/mourner/suncalc/commit/b08d1f6f8e56a3c0d85469d6cf0ff8675cba40a5)). Which means this port inherits the same accuracy and issues with the original javascript library. 

## Examples

```swift
// DateFormatter
let formatter = DateFormatter()
formatter.dateStyle = .short
formatter.timeStyle = .short
formatter.timeZone = .current

// Sunrise and sunset
let sunCalc = SunCalc()
let now = Date()
let location = Location(latitude: 25.0, longitude: 120.0)
let riseTime = sunCalc.time(ofDate: now, forSolarEvent: .sunrise, atLocation: location)
let setTime = sunCalc.time(ofDate: now, forSolarEvent: .sunset, atLocation: location)
let sunrise = formatter.string(from: riseTime)
let sunset = formatter.string(from: setTime)

print("Sunrise: \(sunrise)")
print("Sunset: \(sunset)")

// Moon rise and moon set
let moonTimes = try? sunCalc.moonTimes(date: now, location: location)
if let moonTimes = moonTimes {
    print("Moonrise: \(formatter.string(from: moonTimes.moonRiseTime))")
    print("Moonset: \(formatter.string(from: moonTimes.moonSetTime))")
}
```

## LICENSE

BSD License

Copyright (c) 2018, Venj Chu

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
