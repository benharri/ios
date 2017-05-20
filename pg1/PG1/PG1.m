// Ben Harris
// CS344 PG1

#import <Foundation/Foundation.h>

#import "List.h"

int main(int argc, const char * argv[]){
  @autoreleasepool {
    List *list = [[List alloc] init];

    printf("objcBookTitleLibrary v0.1 - type help for a list of commands\n");
    char *line;
    size_t lsz = 100;
    line = malloc(lsz);
    printf(">>> ");
    getline(&line, &lsz, stdin);
    line[strlen(line) - 1] = 0;
    NSString *nsline = [NSString stringWithUTF8String:line];

    while ([nsline caseInsensitiveCompare: @"exit"] != NSOrderedSame) {

      if([nsline caseInsensitiveCompare: @"help"] == NSOrderedSame) printf("This program accepts the following commands:\n\n\tADD \"book title\"\n\tREMOVE \"search query\"\n\tPRINT\n\tEXIT\n\nhint: clear the library with REMOVE \"\"\nQuotation marks are mandatory.");

      else if([[nsline lowercaseString] hasPrefix: @"add"]) {
        printf("%s\n", line);
        [list add: nsline];
      }
      else if([[nsline lowercaseString] hasPrefix: @"remove"]) {
        printf("%s\n", line);
        [list remove: nsline];
      }
      else if([nsline caseInsensitiveCompare: @"print"] == NSOrderedSame) {
        printf("%s\n\n", line);
        [list print];
      }
      else printf("Command not recognized. Type help if you don't understand the commands.");

      printf("\n>>> ");
      getline(&line, &lsz, stdin);
      line[strlen(line) - 1] = 0;
      nsline = [NSString stringWithUTF8String:line];
    }
  }
  return 0;
}
