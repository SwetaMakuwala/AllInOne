//
//  UserDataManager.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 23/06/22.


import Foundation
import UIKit
protocol UserDataDelegate {
    func didUpdateUserData(userData: [UserDataModel])
}
struct UserDataManager {
    let urlString = "https://randomuser.me/api/?results=50#"
    var delegate : UserDataDelegate?
   
    func fetchData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data , response , error  in
                if error != nil {
                    print("error from API: \(error)")
                    return
                }
                if let safeData = data {
                    self.delegate?.didUpdateUserData(userData: parseData(dataToParse: safeData))
                }
            }
            task.resume()
        }
    }
    
    func parseData(dataToParse: Data) -> [UserDataModel]{
        let decoder = JSONDecoder()
        do {
            let decodedOutput = try decoder.decode(UserDataJson.self, from: dataToParse)
            var array = [UserDataModel]()
            for model in decodedOutput.results {
                let fullName = "\(model.name.title) \(model.name.first) \(model.name.last)"
                let dob = "\(model.dob.date) age: \(model.dob.age) "
                let location = "\(model.location.city) \(model.location.state) \(model.location.country)"
                let picture = model.picture.medium
                let uuid = model.login.uuid
                array.append(UserDataModel(name: fullName, dob: dob ,location: location, picture: picture, uuid: uuid ))
                
            }
            return array
        }catch let error {
            print("error in decoding : \(error)")
            return []
        }
    }
}

