@import AppKit;

#import "FConvenience.h"

@implementation NSUserDefaults (Subscripts)
- (id)objectForKeyedSubscript:(id)aKey
{
    return [self objectForKey:aKey];
}
- (void)setObject:(id)aObj forKeyedSubscript:(id)aKey
{
    [self setObject:aObj forKey:aKey];
}
- (NSColor*)hexStringToColor:(NSString*)inColorString
{
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner* scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    result = [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
    return result;
}
@end
