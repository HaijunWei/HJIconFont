/**
 * 👨‍💻 Haijun
 * 📅 2017-07-17
 */

#import "UIFont+HJIconFont.h"
#import "HJIconFontManager.h"

@implementation UIFont (HJIconFont)

+ (UIFont *)iconFontOfSize:(CGFloat)fontSize {
    NSAssert([HJIconFontManager sharedManager].currentFontName != nil, @"The font is not registered.");
    
    return [UIFont fontWithName:[HJIconFontManager sharedManager].currentFontName size:fontSize];
}

@end
