//
//  User+CoreDataProperties.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 24/06/22.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var dob: String?
    @NSManaged public var picture: String?
    @NSManaged public var uuid: String?

}

extension People : Identifiable {

}
