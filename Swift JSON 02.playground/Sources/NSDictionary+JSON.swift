import Foundation

public enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

extension NSDictionary {

    // JSON Objects
    
    func extractString(forKey key: String) throws -> String {
        guard let param = self[key] as? String else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    func extractBool(forKey key: String) throws -> Bool {
        guard let param = self[key] as? Bool else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    func extractInt(forKey key: String) throws -> Int {
        guard let param = self[key] as? Int else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    func extractDecimal(forKey key: String) throws -> Decimal {
        guard let param = self[key] as? Decimal else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    func extractDictionary(forKey key: String) throws -> NSDictionary {
        guard let param = self[key] as? NSDictionary else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    func extractArray(forKey key: String) throws -> [Any] {
        guard let param = self[key] as? [Any] else {
            throw SerializationError.missing(key)
        }
        return param
    }
    
    
    // Optional JSON Objects
    
    func extractOptionalString(forKey key: String) throws -> String? {
        if let param = self[key] as? String {
            return param
        }
        else {
            return nil
        }
    }
    
    func extractOptionalBool(forKey key: String) throws -> Bool? {
        if let param = self[key] as? Bool {
            return param
        }
        else {
            return nil
        }
    }
    
    func extractOptionalInt(forKey key: String) throws -> Int? {
        if let param = self[key] as? Int {
            return param
        }
        else {
            return nil
        }
    }
    
    func extractOptionalDecimal(forKey key: String) throws -> Decimal? {
        if let param = self[key] as? Decimal {
            return param
        }
        else {
            return nil
        }
    }
    
    func extractOptionalDictionary(forKey key: String) throws -> NSDictionary? {
        if let param = self[key] as? NSDictionary {
            return param
        }
        else {
            return nil
        }
    }
    
    func extractOptionalArray(forKey key: String) throws -> [Any]? {
        if let param = self[key] as? [Any] {
            return param
        }
        else {
            return nil
        }
    }
    
}
