//
//  UserDataJson.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 23/06/22.
//

import Foundation
struct UserDataJson: Decodable {
    let results: [Results]
    let info : Info
}
struct Results: Decodable {
    let name : Name
    let location: Location
    let dob : Dob
    let picture : Picture
    let login : Login
}
struct Info: Decodable {
    let seed: String
    let results : Int
}
struct Name: Decodable {
    let title : String
    let first : String
    let last : String
}
struct Location: Decodable {
    let city : String
    let state : String
    let country : String
}
struct Dob: Decodable {
    let date: String
    let age : Int
}
struct Picture: Decodable {
    let medium : String
}
struct Login: Decodable{
    let uuid : String
}
