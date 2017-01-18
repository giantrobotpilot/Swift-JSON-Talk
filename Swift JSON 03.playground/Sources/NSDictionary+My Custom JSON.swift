import Foundation

protocol RawValueInitializable {
    init?(rawValue: String)
}

extension NSDictionary {
    
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
    
    func extractEnum<T: RawValueInitializable>(forKey key: String) throws -> T {
        let paramString: String = try self.extract(forKey: key)
        guard let param = T(rawValue:paramString) else {
            throw SerializationError.invalid(key, paramString)
        }
        return param
    }
    
}
