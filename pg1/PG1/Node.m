// Ben Harris
// PG1 Node class

#import <Foundation/Foundation.h>

#import "Node.h"

@implementation Node

-(id) init:(NSString *)s next:(Node *)n {
  title = s;
  next = n;
  return self;
}

-(void) print {
  printf(">\t%s\n", [title UTF8String]);
  [next print];
}

-(Node *)add:(NSString *)s {

  if ([s caseInsensitiveCompare:title] == NSOrderedSame) {
        // ==
      printf("Add aborted. Cannot add duplicates.\n");
     return self;
  }
  if ([s caseInsensitiveCompare:title] == NSOrderedAscending) {
        // s<title
      return [[Node alloc] init:s next:self];
  }

  if (!next) {
    next = [[Node alloc] init:s next:NULL];
    return self;
  }
  
  next = [next add:s];

  return self;
}

-(Node *) remove:(NSString *)s {
  next = [next remove:s];
  if([title localizedCaseInsensitiveContainsString:s] || s.length == 0) {
    Node *t = next;
    next = nil;
    return t;
  }
  return self;
}

@end
