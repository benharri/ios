// Ben Harris
// List.h

#ifndef List_h
#define List_h

#import <Foundation/Foundation.h>
#include "Node.h"

@class Node;

@interface List : NSObject {
  Node *head;
}

-(id) init;
-(void) print;
-(void) add:(NSString *)s;
-(void) remove:(NSString *)s;

@end

#endif
