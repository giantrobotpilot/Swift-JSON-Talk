import Foundation

extension Legislator {
    
    
    public init(jsonDict: NSDictionary) throws {
        
        // 1 - required JSON object parameters
                
        self.firstName = try jsonDict.extractString(forKey: "first_name")
        self.inOffice = try jsonDict.extractBool(forKey: "in_office")
        self.lastName = try jsonDict.extractString(forKey: "last_name")
        self.state = try jsonDict.extractString(forKey: "state")
        
        
        // 2 - required two-step parameter
        
        self.chamber = try jsonDict.extractChamber(forKey: "chamber")
        self.party = try jsonDict.extractParty(forKey: "party")
        
        
        // 3 - optional JSON object parameter
        
        self.district = try jsonDict.extractOptionalInt(forKey: "district")

        
        // 4 - optional two-step parameter
        
        self.website = try jsonDict.extractOptionalUrl(forKey: "website")
    }
}
