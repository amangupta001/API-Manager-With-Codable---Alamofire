//
//  Created by Aman gupta on 06/04/23.
//

import Foundation
import Alamofire
enum API_Response
{
    enum UserData {
        struct Request: Codable
        {
            let email:String
            let password:String
        }
       
        struct DataResponse: Codable
        {
            let access_token:String?
            let refresh_token:String?
        }
    }
    enum Places {
        
        struct DataResponse: Codable
        {
            let placesName:String?
        }
    }
    struct Connectivity {
      static let sharedInstance = NetworkReachabilityManager()!
      static var isConnectedToInternet:Bool {
          return self.sharedInstance.isReachable
        }
    }
}
