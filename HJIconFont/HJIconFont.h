/**
 * 👨‍💻 Haijun
 * 📅 2017-07-17
 */

#import "HJIconFontManager.h"
#import "UIFont+HJIconFont.h"

#define HJ_ICONFONT(CODE, SIZE, COLOR) [[HJIconFontManager sharedManager] fontImageWithUnicodeText:(CODE) size:(SIZE) color:(COLOR)]
