/**
 * 👨‍💻 Haijun
 * 📅 2017-07-17
 */

#import <UIKit/UIKit.h>

@interface HJIconFontManager : NSObject

@property (nonatomic, copy, readonly) NSString *currentFontName;

+ (instancetype)sharedManager;

- (void)registerFontWithName:(NSString *)name fontURL:(NSURL *)fontURL;

- (UIImage *)fontImageWithUnicodeText:(NSString *)unicodeText size:(CGFloat)size color:(UIColor *)color;

@end
