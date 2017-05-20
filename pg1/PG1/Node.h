// Ben Harris
// Node.h

#ifndef Node_h
#define Node_h

#import <Foundation/Foundation.h>

@interface Node: NSObject {
  NSString *title;
  Node *next;
}

-(id) init:(NSString *)s next:(Node *)n;
-(void) print;
-(Node *)add:(NSString *)title;
-(Node *) remove:(NSString *)s;

@end

#endif
