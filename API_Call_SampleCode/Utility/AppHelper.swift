//  Created by Aman gupta on 07/06/23.


import Cocoa
class AppHelper {
    
    private init(){}
    static let shared = AppHelper()
   
    class func getAPIEndpoint() -> String
    {
        var endpoint:String = ""
#if DEBUG
        endpoint = APIEndPoint.devEndPoint
#else
        endpoint = APIEndPoint.prodEndPoint
#endif
        
        return endpoint
    }
    
   
}

