//  Created by Aman gupta on 07/06/23.

import Foundation
import Alamofire
import Cocoa
enum APIEndPoint
{
    static let devEndPoint = "Dev URL"
    static let prodEndPoint = "Production URL"

}

class APIManager : NSObject{
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String = ""
    var encoding: ParameterEncoding! = JSONEncoding.default
    private let delegate:AppDelegate = NSApplication.shared.delegate as! AppDelegate

    init(data: [String:Any] = [:],headers: [String:String] = [:],url :String?, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if !(url ?? "").isEmpty {
            self.url = url ?? ""
        }
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
#if DEBUG
        print("Service: \(self.url) \n data: \(parameters)")
#else
                    print("")
#endif
    }
    
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        delegate.session.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        ///
                        do {
                            
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
#if DEBUG
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
#else
                    print("")
#endif
                            completion(.failure(error))
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    
}
