//
//  EmotionCoreDataEntity+CoreDataProperties.swift
//  TestApp2
//
//  Created by Michele Zurlo on 29/10/22.
//
//

import Foundation
import CoreData


extension EmotionCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmotionCoreDataEntity> {
        return NSFetchRequest<EmotionCoreDataEntity>(entityName: "EmotionCoreDataEntity")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: UUID?
    @NSManaged public var size: NSNumber?
    @NSManaged public var relationship: CardCoreDataEntity?

}

extension EmotionCoreDataEntity : Identifiable {

}
