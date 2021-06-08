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
		let request = ManagedCache.fetchRequest() as NSFetchRequest<ManagedCache>
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	static func deleteFirst(in context: NSManagedObjectContext) throws {
		let _ = try findFirst(in: context).map { context.delete($0) }
	}

	var localFeed: [LocalFeedImage] {
		return feed.compactMap { $0 as? ManagedFeedImage }.map { $0.local }
	}
}
