/**
 * 👨‍💻 Haijun
 * 📅 2017-07-17
 */

#import "HJIconFontManager.h"
#import "UIFont+HJIconFont.h"
#import <CoreText/CoreText.h>

@interface HJIconFontManager ()

@property (nonatomic, strong) NSCache *fontImageCache;

@end

@implementation HJIconFontManager

#pragma mark - Class method

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static id manager;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark - Life cycle

- (instancetype)init {
    if (self = [super init]) {
        _fontImageCache = [NSCache new];
        _fontImageCache.countLimit = 50;
        _fontImageCache.totalCostLimit = 1024 * 5;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

#pragma mark - Event response

- (void)didReceiveMemoryWarning {
    [self.fontImageCache removeAllObjects];
}

#pragma mark - Public method

- (void)registerFontWithName:(NSString *)name fontURL:(NSURL *)fontURL {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[fontURL path]], @"The font file does not exist.");
    
    CGDataProviderRef providerRef = CGDataProviderCreateWithURL((__bridge CFURLRef)fontURL);
    CGFontRef newFont = CGFontCreateWithDataProvider(providerRef);
    CGDataProviderRelease(providerRef);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
    
    _currentFontName = name;
}

- (UIImage *)fontImageWithUnicodeText:(NSString *)unicodeText size:(CGFloat)size color:(UIColor *)color {
    if (!color) { color = [UIColor blackColor]; }
    UIImage *resultImage = [self.fontImageCache objectForKey:[self keyFromUnicodeText:unicodeText size:size color:color]];
    if (resultImage) { return resultImage; }
    
    UIFont *font = [UIFont iconFontOfSize:size];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, [UIScreen mainScreen].scale);
    [unicodeText drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    [self.fontImageCache setObject:resultImage forKey:[self keyFromUnicodeText:unicodeText size:size color:color]];
    return resultImage;
}

#pragma mark - Private method

- (NSString *)keyFromUnicodeText:(NSString *)unicodeText size:(CGFloat)size color:(UIColor *)color {
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    NSString *rgbaString = [NSString stringWithFormat:@"%lf,%lf,%lf,%lf", red, green, blue, alpha];
    return [NSString stringWithFormat:@"%@-%lf-%@", unicodeText, size, rgbaString];
}

@end
