//
//  BCExploredMutableArray.m
//  NSMutableArrayExplorer
//
//  Created by Bartosz Ciechanowski on 04.03.2014.
//  Copyright (c) 2014 Bartosz Ciechanowski. All rights reserved.
//

#import "BCExploredMutableArray.h"
#import <malloc/malloc.h>

@interface BCExploredMutableArray : NSMutableArray
{
@public
    
#if defined(__arm64__)
    unsigned long long _used;
    unsigned long long _doHardRetain:1;
    unsigned long long _doWeakAccess:1;
    unsigned long long _size:62;
    unsigned long long _hasObjects:1;
    unsigned long long _hasStrongReferences:1;
    unsigned long long _offset:62;
    unsigned long long _mutations;
    void **_list;
    
#elif defined(__arm__)
    unsigned int _used;
    unsigned int _doHardRetain:1;
    unsigned int _doWeakAccess:1;
    unsigned int _size:30;
    unsigned int _hasObjects:1;
    unsigned int _hasStrongReferences:1;
    unsigned int _offset:30;
    unsigned long _mutations;
    void **_list;
#endif
    
}

@end

@implementation BCExploredMutableArray
@end


@implementation NSMutableArray (BufferDescription)

- (NSString *)explored_description
{
    assert([NSStringFromClass([self class]) isEqualToString:@"__NSArrayM"]);
    
    BCExploredMutableArray *array = (BCExploredMutableArray *)self;

    NSUInteger size = array->_size;
    NSUInteger offset = array->_offset;

    NSMutableString *description = [NSMutableString stringWithString:@"\n"];
    
    [description appendFormat:@"Size: %lu\n", (unsigned long)size];
    [description appendFormat:@"Count: %llu\n", (unsigned long long)array->_used];
    [description appendFormat:@"Offset: %lu\n", (unsigned long)offset];
    [description appendFormat:@"Storage: %p\n", array->_list];
    
    for (int i = 0; i < size; i++) {
        [description appendFormat:@"[%d] %p\n", i, array->_list[i]];
    }

    return description;
}

- (NSUInteger)explored_size
{
    assert([NSStringFromClass([self class]) isEqualToString:@"__NSArrayM"]);

    return ((BCExploredMutableArray *)self)->_size;
}

- (size_t)explored_malloc_size
{
    assert([NSStringFromClass([self class]) isEqualToString:@"__NSArrayM"]);
    
    return malloc_size(((BCExploredMutableArray *)self)->_list);
}

- (void **)explored_list
{
    assert([NSStringFromClass([self class]) isEqualToString:@"__NSArrayM"]);

    return ((BCExploredMutableArray *)self)->_list;
}

@end
