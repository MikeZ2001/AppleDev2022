//
//  CardCoreDataEntity+CoreDataProperties.swift
//  TestApp2
//
//  Created by Michele Zurlo on 29/10/22.
//
//

import Foundation
import CoreData


extension CardCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardCoreDataEntity> {
        return NSFetchRequest<CardCoreDataEntity>(entityName: "CardCoreDataEntity")
    }

    @NSManaged public var cardDate: Date
    @NSManaged public var id: UUID
    @NSManaged public var imageOfTheCard: Data
    @NSManaged public var songOfTheDay: String?
    @NSManaged public var thoughtOfTheDay: String?
    @NSManaged public var emotion: NSSet?

}

// MARK: Generated accessors for emotion
extension CardCoreDataEntity {

    @objc(addEmotionObject:)
    @NSManaged public func addToEmotion(_ value: EmotionCoreDataEntity)

    @objc(removeEmotionObject:)
    @NSManaged public func removeFromEmotion(_ value: EmotionCoreDataEntity)

    @objc(addEmotion:)
    @NSManaged public func addToEmotion(_ values: NSSet)

    @objc(removeEmotion:)
    @NSManaged public func removeFromEmotion(_ values: NSSet)

}

extension CardCoreDataEntity : Identifiable {

}
