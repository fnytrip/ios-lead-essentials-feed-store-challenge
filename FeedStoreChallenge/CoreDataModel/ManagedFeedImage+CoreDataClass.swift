//
//  ManagedFeedImage+CoreDataClass.swift
//  FeedStoreChallenge
//
//  Created by Fei Wen on 6/5/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}

	static func managedFeedImages(from localFeedImages: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeedImages.map { local in
			let managedFeedImage = ManagedFeedImage(context: context)
			managedFeedImage.id = local.id
			managedFeedImage.imageDescription = local.description
			managedFeedImage.location = local.location
			managedFeedImage.url = local.url
			return managedFeedImage
		})
	}
}

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
