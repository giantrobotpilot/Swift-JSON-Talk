//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true


SunlightWebService.fetchLegislators(forState: "MN") { (legislators: [Legislator]?, error) in
    if var legislators = legislators {
        legislators.sort(by: { $0.chamber.rawValue < $1.chamber.rawValue })
        for legislator in legislators {
            print(legislator)
        }
    } else {
        print("error fetching: \(error)")
    }
}
