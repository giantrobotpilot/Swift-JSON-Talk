import Foundation

extension Legislator {
    
    
    public init(jsonDict: NSDictionary) throws {
        
        // 1 - required JSON object parameters
        
        self.firstName = try jsonDict.extract(forKey: "first_name")
        self.inOffice = try jsonDict.extract(forKey: "in_office")
        self.lastName = try jsonDict.extract(forKey: "last_name")
        
        
        // 2 - required two-step parameter
        
        self.chamber = try jsonDict.extractEnum(forKey: "chamber")
        self.party = try jsonDict.extractEnum(forKey: "party")
        
        
        // 3 - optional JSON object parameter
        
        self.district = try jsonDict.extractOptional(forKey: "district")

        
        // 4 - optional two-step parameter
        
        self.website = try jsonDict.extractOptionalUrl(forKey: "website")
    }
}
