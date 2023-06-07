//
//  ViewController.swift
//  API_Call_SampleCode
//
//  Created by Aman on 07/06/23.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func callForPostAPI()
    {
        if API_Response.Connectivity.isConnectedToInternet {
             print("Connected")

         } else {
             print("No Internet")
             return
        }
        
        let body: [String : Any] = ["alias": "aman",
                                    "password": "gupta"]
        let headers: [String: String] = ["Authorization":"Basic dWx0cmF2cG5fYXZfbWF4c2VjdXJlOnBjbW5mZ3p1cm51sd"]

        APIManager(data: body,headers:headers , url: AppHelper.getAPIEndpoint(), method: .post).executeQuery(){
            (result: Result<API_Response.UserData.DataResponse,Error>) in
            switch result{
            case .success(let post):
                print(post)
                
            case .failure(let error):
#if DEBUG
                print(error.localizedDescription)
#else
                print("")
#endif
            }
        }
        
    }
    func callForGetAPI()
    {
        if API_Response.Connectivity.isConnectedToInternet {
             print("Connected")

         } else {
             print("No Internet")
             return
        }
        
        let finalEndpoint:String = AppHelper.getAPIEndpoint()
        APIManager(url: finalEndpoint, method: .get,isJSONRequest: false).executeQuery(){
            (result: Result<[API_Response.Places.DataResponse],Error>) in
            switch result{
            case .success(let post):
                print(post)
                
            case .failure(let error):
#if DEBUG
                print(error.localizedDescription)
#else
                print("")
#endif
            }
            
        }
    }


}

