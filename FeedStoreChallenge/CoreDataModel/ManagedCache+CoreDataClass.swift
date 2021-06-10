//
//  ManagedCache+CoreDataClass.swift
//  FeedStoreChallenge
//
//  Created by Fei Wen on 6/5/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedCache)
final class ManagedCache: NSManagedObject {
	static func findFirst(in context: NSManagedObjectContext) throws -> ManagedCache? {
		return try findAll(in: context).first
	}

	static func deleteAll(in context: NSManagedObjectContext) throws {
		try findAll(in: context).forEach(context.delete)
	}

	static private func findAll(in context: NSManagedObjectContext) throws -> [ManagedCache] {
		let request = ManagedCache.fetchRequest() as NSFetchRequest<ManagedCache>
		request.returnsObjectsAsFaults = false
		return try context.fetch(request)
	}

	var localFeed: [LocalFeedImage] {
		return feed.compactMap { $0 as? ManagedFeedImage }.map { $0.local }
	}
}

extension ManagedCache {
	@nonobjc class func fetchRequest() -> NSFetchRequest<ManagedCache> {
		return NSFetchRequest<ManagedCache>(entityName: "ManagedCache")
	}

	@NSManaged var timestamp: Date
	@NSManaged var feed: NSOrderedSet
}
