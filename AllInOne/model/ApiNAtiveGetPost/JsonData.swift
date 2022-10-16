//
//  JsonData.swift
//  AllInOne
//
//  Created by sweta makuwala on 10/09/22.
//

import Foundation
struct UserDeatailData: Decodable {
    let name, email, id: String
    let joining: String
}
typealias UserDeatailDataArray = [UserDeatailData]
