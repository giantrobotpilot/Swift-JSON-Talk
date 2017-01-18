import Foundation

extension NSDictionary {
    
    func extractChamber(forKey key: String) throws -> Chamber {
        let chamberString: String = try self.extractString(forKey: key)
        guard let chamber = Chamber(rawValue: chamberString) else {
            throw SerializationError.invalid(key, chamberString)
        }
        return chamber
    }
    
    func extractParty(forKey key: String) throws -> Party {
        let partyString: String = try self.extractString(forKey: key)
        guard let party = Party(rawValue: partyString) else {
            throw SerializationError.invalid(key, partyString)
        }
        return party
    }
    
    func extractOptionalUrl(forKey key: String) throws -> URL? {
        if let urlString = self[key] as? String {
            guard let url = URL(string: urlString) else {
                throw SerializationError.invalid(key, urlString)
            }
            return url
        }
        else {
            return nil
        }
    }
}
