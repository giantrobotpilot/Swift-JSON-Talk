//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true


SunlightWebService.fetchLegislators(forState: "CO") { (legislators: [Legislator]?, error: Error?) in
    if var legislators = legislators {
        print("returned \(legislators.count) results")
        legislators.sort(by: { $0.chamber.rawValue < $1.chamber.rawValue })
        for legislator in legislators {
            print(legislator)
        }
    } else {
        print("error fetching: \(error)")
    }
}
