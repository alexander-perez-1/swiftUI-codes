//
//  Contact+CoreDataProperties.swift
//  SimpleContactApp
//
//  Created by Alexander Perez on 2023/12/6.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var phone: String?
    @NSManaged public var name: String?

}

extension Contacts : Identifiable {

}
