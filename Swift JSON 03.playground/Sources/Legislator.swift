import Foundation

public enum Chamber: String, RawValueInitializable {
    case house = "house"
    case senate = "senate"
}

public enum Party: String, RawValueInitializable {
    case Democrat = "D"
    case Independent = "I"
    case Republican = "R"
}

public struct Legislator: CustomStringConvertible {
    public let chamber: Chamber
    public let district: Int?
    public let firstName: String
    public let inOffice: Bool
    public let lastName: String
    public let party: Party
    public let website: URL?
    
    public var description: String {
        let title: String = (self.chamber == .house) ? "Rep." : "Sen."
        
        var description = title + " " + self.firstName + " " + self.lastName + ", " + self.party.rawValue
        if let district = self.district {
            description += "-\(district)"
        }
        return description
    }
}
