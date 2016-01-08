//
//  Link+CoreDataProperties.h
//  Link
//
//  Created by Piotr Torczyski on 05/01/16.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Link.h"

NS_ASSUME_NONNULL_BEGIN

@interface Link (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *longLink;
@property (nullable, nonatomic, retain) NSString *shortLink;

@end

NS_ASSUME_NONNULL_END
