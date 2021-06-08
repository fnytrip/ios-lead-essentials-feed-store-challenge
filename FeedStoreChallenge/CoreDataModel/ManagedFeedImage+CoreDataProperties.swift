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
	@nonobjc class func fetchRequest() -> NSFetchRequest<ManagedFeedImage> {
		return NSFetchRequest<ManagedFeedImage>(entityName: "ManagedFeedImage")
	}

	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedCache
}

extension ManagedFeedImage: Identifiable {}
