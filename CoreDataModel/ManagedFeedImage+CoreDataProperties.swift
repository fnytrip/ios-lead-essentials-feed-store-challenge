//
//  ManagedFeedImage+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by Fei Wen on 6/5/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension ManagedFeedImage {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedFeedImage> {
		return NSFetchRequest<ManagedFeedImage>(entityName: "ManagedFeedImage")
	}

	@NSManaged public var id: UUID
	@NSManaged public var imageDescription: String?
	@NSManaged public var location: String?
	@NSManaged public var url: URL
	@NSManaged public var cache: ManagedCache
}

extension ManagedFeedImage: Identifiable {}
