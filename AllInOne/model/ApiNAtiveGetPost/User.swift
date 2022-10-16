//
//  User.swift
//  AllInOne
//
//  Created by sweta makuwala on 10/09/22.
//
// note: using url response
import Foundation
struct Endpoint
{
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    static let getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
    //  let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
}

class User {
    var dataFromGetResponse = ""
    //MARK: -  (1) get api using URL only ( DataManagerUserTwo )
    
    
    //MARK: - (2) get api using url request
    
    func GetUserFromServer(){
        // get api using url request
        
        var urlRequest = URLRequest(url: URL(string: Endpoint.getUser)!)
        urlRequest.httpMethod = "get"
        
        URLSession.shared.dataTask(with: urlRequest) { data , httpUrlResponse, error in
            if data != nil  && data?.count != 0 {
                let dataToPrint = String(data: data!, encoding: .utf8)
                self.dataFromGetResponse = dataToPrint!
            }
        }.resume()
    }
    

    
    
    //MARK: - (3) post api using url request using dictionary
    func registerUser(){

        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]
        
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }catch let error {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, httpUrlResponse, error in
            if error != nil {
                print(error)
            }
            if data != nil && data?.count != 0 {
                print("post output : \(String(data: data!, encoding: .utf8))")
            }
        }.resume()
        
    }
    //MARK: - (4) post api using url request using model
    // https://johncodeos.com/how-to-make-post-get-update-and-delete-requests-with-urlsession-using-swift/
    
   
}
