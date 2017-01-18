import Foundation

public extension Legislator {
    
    public init?(json: NSDictionary) {
        
        // 1 - required JSON object parameters
        
        guard let firstName = json["first_name"] as? String,
            let inOffice = json["in_office"] as? Bool,
            let lastName = json["last_name"] as? String,
            let state = json["state"] as? String
        else {
            return nil
        }
        self.firstName = firstName
        self.inOffice = inOffice
        self.lastName = lastName
        self.state = state
        
        
        // 2 - required two-step parameter
        
        guard let chamberString = json["chamber"] as? String,
            let chamber = Chamber(rawValue: chamberString)
        else {
            return nil
        }
        self.chamber = chamber
        
        guard let partyString = json["chamber"] as? String,
            let party = Party(rawValue: partyString)
            else {
                return nil
        }
        self.party = party
        
        
        // 3 - optional JSON object parameter
        
        if let district = json["district"] as? Int {
            self.district = district
        }
        else {
            self.district = nil
        }
        
        
        // 4 - optional two-step parameter
        
        if let websiteString = json["website"] as? String,
            let url = URL(string: websiteString) {
            self.website = url
        }
        else {
            self.website = nil
        }
    }
    
}
