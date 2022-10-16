//
//  UserTwo.swift
//  AllInOne
//
//  Created by sweta makuwala on 10/09/22.
//

import Foundation
protocol DataManagerDelegate{
    func passData(_ data : UserDeatailDataArray)
}
class DataManagerUserTwo {
    var delegate : DataManagerDelegate?
    func fetchData(){
        let url = URL(string: Endpoint.getUser)!
        URLSession.shared.dataTask(with: url) { data, response , error in
            if error != nil{
                return
            }
            if data != nil && data?.count != 0 {
               // print(String(data: data!, encoding: .utf8))
              let output =   self.parseData(data!)
              //  print(output)
                self.delegate?.passData(output)
            } else {
                
            }
        }.resume()
    }
    func parseData(_ data: Data) -> UserDeatailDataArray {
      var output = UserDeatailDataArray()
        let decoder = JSONDecoder()
        do {
            let decodedOutput = try decoder.decode(UserDeatailDataArray.self, from: data)
          // print("decoded output : \(decodedOutput)")
            output = decodedOutput
        } catch let error {
            print(error.localizedDescription)
        }
        return output
    }
}
