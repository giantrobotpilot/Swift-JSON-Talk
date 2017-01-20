import Foundation

open class SunlightWebService {
    
    static let apiKey = "a14a3e60a70f4c6abe83c5a89c3383a2"
    static let baseUrl = "https://congress.api.sunlightfoundation.com/legislators/"
    
    open static func fetchLegislators(forState state: String, completion: @escaping (_: [Legislator]?, _: Error?) -> Void) {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents!.queryItems = [URLQueryItem(name: "apikey", value: "a14a3e60a70f4c6abe83c5a89c3383a2"),
                                     URLQueryItem(name: "per_page", value: "50"),
                                     URLQueryItem(name: "state", value: state)]
        let session = URLSession(configuration: .default)
        if let url = urlComponents?.url {
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                print("\n")
                do {
                    if let data = data,
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary,
                        let members = jsonObject["results"] as? [NSDictionary] {
                        var legislators: [Legislator] = []
                        for member in members {
                            do {
                                let legislator = try Legislator(jsonDict: member)
                                legislators.append(legislator)
                            } catch {
                                print("error initializing legislator: \(error)")
                            }
                        }
                        completion(legislators, error)
                    }
                    else {
                        completion(nil, error)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            }).resume()
        }
    }
}
