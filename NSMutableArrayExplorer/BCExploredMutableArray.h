//
//  BCExploredMutableArray.h
//  NSMutableArrayExplorer
//
//  Created by Bartosz Ciechanowski on 04.03.2014.
//  Copyright (c) 2014 Bartosz Ciechanowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BufferDescription)

- (NSString *)explored_description;

- (NSUInteger)explored_size;
- (size_t)explored_malloc_size;
- (void **)explored_list;

@end
