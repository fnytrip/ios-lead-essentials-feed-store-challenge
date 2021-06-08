//
//  ManagedCache+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by Fei Wen on 6/5/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension ManagedCache {
	@nonobjc class func fetchRequest() -> NSFetchRequest<ManagedCache> {
		return NSFetchRequest<ManagedCache>(entityName: "ManagedCache")
	}

	@NSManaged var timestamp: Date
	@NSManaged var feed: NSOrderedSet
}

// MARK: Generated accessors for feed
extension ManagedCache {
	@objc(addFeedObject:)
	@NSManaged public func addToFeed(_ value: ManagedFeedImage)

	@objc(removeFeedObject:)
	@NSManaged public func removeFromFeed(_ value: ManagedFeedImage)

	@objc(addFeed:)
	@NSManaged public func addToFeed(_ values: NSSet)

	@objc(removeFeed:)
	@NSManaged public func removeFromFeed(_ values: NSSet)
}

extension ManagedCache: Identifiable {}
