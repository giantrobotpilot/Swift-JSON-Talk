import Foundation

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

extension Legislator {
    
    public init(jsonDict: NSDictionary) throws {
        
        // 1 - required JSON object parameters
        
        guard let firstName = jsonDict["first_name"] as? String else {
            throw SerializationError.missing("first_name")
        }
        self.firstName = firstName
        
        guard let inOffice = jsonDict["in_office"] as? Bool else {
            throw SerializationError.missing("in_office")
        }
        self.inOffice = inOffice
        
        guard let lastName = jsonDict["last_name"] as? String else {
            throw SerializationError.missing("last_name")
        }
        self.lastName = lastName
        
        guard let state = jsonDict["state"] as? String else {
            throw SerializationError.missing("state")
        }
        self.state = state
        
        
        // 2 - required two-step parameter
        
        guard let chamberString = jsonDict["chamber"] as? String else {
            throw SerializationError.missing("chamber")
        }
        guard let chamber = Chamber(rawValue: chamberString) else {
            throw SerializationError.invalid("chamber", chamberString)
        }
        self.chamber = chamber
        
        guard let partyString = jsonDict["party"] as? String else {
            throw SerializationError.missing("party")
        }
        guard let party = Party(rawValue: partyString) else {
            throw SerializationError.invalid("party", partyString)
        }
        self.party = party
        
        
        // 3 - optional JSON object parameter
        
        if let district = jsonDict["district"] as? Int {
            self.district = district
        }
        else {
            self.district = nil
        }
        
        
        // 4 - optional two-step parameter
        
        if let urlString = jsonDict["website"] as? String {
            guard let url = URL(string: urlString) else {
                throw SerializationError.invalid("website", urlString)
            }
            self.website = url
        }
        else {
            self.website = nil
        }
    }
}
