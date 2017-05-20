// Ben Harris
// PG1 List class

#include <Foundation/Foundation.h>
#include "List.h"
#include "Node.h"

@implementation List

-(id) init {
  head = NULL;
  return self;
}

-(void) print { [head print]; }

-(void) add:(NSString *)s {
  if (head){
    head = [head add:[s substringWithRange:NSMakeRange(5, s.length - 6)]];
  }
  else
    head = [[Node alloc] init:[s substringWithRange:NSMakeRange(5, s.length - 6)] next:NULL];
}

-(void) remove:(NSString *)s {
  NSString *query = [s substringWithRange:NSMakeRange(8, s.length - 9)];
  printf("Removing all titles containing '%s'", [query UTF8String]);
  head = [head remove:query];
}

@end
