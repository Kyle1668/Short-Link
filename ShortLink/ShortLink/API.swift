
import Foundation
import AFNetworking

class AppURL {
    
    var url: String
    var shortURL: String
    var shortError: Bool
    
    init() {
        url = ""
        shortURL = ""
        shortError = false
    }
    
    func initializeLongURL(inURL: String) {
        url = inURL
    }
    
    func shortenURL(longURL: String, handler: @escaping (String) -> Swift.Void, errorHandler: @escaping (String) -> Swift.Void) {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        let url = "https://www.googleapis.com/urlshortener/v1/url?key=AIzaSyBRKKil8-hhE8SXdUv9SnYWRV-u2DTjxgs"
        let params : [String : String] = ["longUrl" : longURL]
        
        manager.post( url, parameters: params, progress: nil, success: { (URLSessionDataTask, AnyObject) -> Swift.Void in
            
            if let shortenURL = AnyObject! as? [String:String] {
                self.shortURL = shortenURL["id"]!
                handler(self.shortURL)
            }
            
        }, failure: { (task : URLSessionDataTask?, Error) in
            NSLog("\(Error)")
            errorHandler(Error.localizedDescription)
            self.shortError = true
        })
        
    }

}
