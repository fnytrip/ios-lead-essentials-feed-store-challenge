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
public class ManagedCache: NSManagedObject {
	static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
		let request = ManagedCache.fetchRequest() as NSFetchRequest<ManagedCache>
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	var localFeeds: [LocalFeedImage] {
		return feed.compactMap { $0 as? ManagedFeedImage }.map { $0.local }
	}
}
