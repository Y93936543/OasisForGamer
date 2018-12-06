//
//  NSString+JudgeString.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "NSString+JudgeString.h"

#define NUMBERS @"0123456789"
BOOL isNumber (char ch)
{
    if (!(ch >= '0' && ch <= '9')) {
        return FALSE;
    }
    return TRUE;
}

@implementation NSString (JudgeString)

/*邮箱验证*/
- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/*手机号码验证*/
- (BOOL) isValidateMobile
{
    BOOL bRtn = NO;
    if (11 == self.length)
    bRtn = YES;
    return bRtn;
    //    //手机号以13， 15，17,18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    //    NSLog(@"phoneTest is %@",phoneTest);
    //    return [phoneTest evaluateWithObject:self];
}

/*车牌号验证*/
- (BOOL)isValidateCarNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}

/*QQ号验证*/
- (BOOL) isValidateQQNumber
{
    const char *cvalue = [self UTF8String];
    int len = (int)strlen(cvalue);
    for (int i = 0; i < len; i++) {
        if (!isNumber(cvalue[i])){
            return FALSE;
        }
    }
    return TRUE;
}

/*整形验证*/
- (BOOL)isPureInt2
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/*浮点验证*/
- (BOOL)isPureFloat2
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
/*ascii */
- (BOOL)isValidateAscII {
    NSString *ascIIRegex = @"^[a-zA-Z0-9]+$";
    //NSString *ascIIRegex = @"^[\u4e00-\u9fa5_a-zA-Z0-9]+$";
    NSPredicate *ascIITest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ascIIRegex];
    NSLog(@"carTest is %@",ascIITest);
    return [ascIITest evaluateWithObject:self];
}
/* */
- (BOOL) isValidCreditNumber
{
    BOOL result = TRUE;
    NSInteger length = [self length];
    if (length >= 13 && length <= 20)
    {
        result = [self isValidNumber];
        if (result)
        {
            NSInteger twoDigitBeginValue = [[self substringWithRange:NSMakeRange(0, 2)] integerValue];
            NSInteger threeDigitBeginValue = [[self substringWithRange:NSMakeRange(0, 3)] integerValue];
            NSInteger fourDigitBeginValue = [[self substringWithRange:NSMakeRange(0, 4)] integerValue];
            //Diner's Club
            if (((threeDigitBeginValue >= 300 && threeDigitBeginValue <= 305)||
                 fourDigitBeginValue == 3095||twoDigitBeginValue==36||twoDigitBeginValue==38) && (14 != length))
            {
                result = FALSE;
            }
            //VISA
            else if ([self hasPrefix:@"4"] && !(13 == length||16 == length))
            {
                result = FALSE;
            }
            //MasterCard
            else if ((twoDigitBeginValue >= 51||twoDigitBeginValue <= 55) && (16 != length))
            {
                result = FALSE;
            }
            //American Express
            else if (([self hasPrefix:@"34"]||[self hasPrefix:@"37"]) && (15 != length))
            {
                result = FALSE;
            }
            //Discover
            else if ([self hasPrefix:@"6011"] && (16 != length))
            {
                result = FALSE;
            }
            else
            {
                NSInteger begin = [[self substringWithRange:NSMakeRange(0, 6)] integerValue];
                //CUP
                if ((begin >= 622126 && begin <= 622925) && (16 != length))
                {
                    result = FALSE;
                }
                //other
                else
                {
                    result = TRUE;
                }
            }
        }
        if (result) {
            NSInteger digitValue;
            NSInteger checkSum = 0;
            NSInteger index = 0;
            NSInteger leftIndex;
            //even length, odd index
            if (0 == length%2)
            {
                index = 0;
                leftIndex = 1;
            }
            //odd length, even index
            else
            {
                index = 1;
                leftIndex = 0;
            }
            while (index < length)
            {
                digitValue = [[self substringWithRange:NSMakeRange(index, 1)] integerValue];
                digitValue = digitValue*2;
                if (digitValue >= 10)
                {
                    checkSum += digitValue/10 + digitValue;
                }
                else
                {
                    checkSum += digitValue;
                }
                digitValue = [[self substringWithRange:NSMakeRange(leftIndex, 1)] integerValue];
                checkSum += digitValue;
                index += 2;
                leftIndex += 2;
            }
            result = (0 == checkSum) ? TRUE:FALSE;
        }
    }
    else
    {
        result = FALSE;
    }
    return result;
}

/*
 * 判断是否为 62 开头的银行卡号 (62开头、16-19位) - 支持自动添加空格
 */
- (BOOL) isValidBankNumber {
    NSString *bankRegex = @"^62[0-9]{14,17}$";
    NSPredicate *bankTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankRegex];
    return [bankTest evaluateWithObject:self];
}

/*number */
- (BOOL) isValidNumber
{
    const char *cvalue = [self UTF8String];
    int len = (int)strlen(cvalue);
    for (int i = 0; i < len; i++) {
        if (!isNumber(cvalue[i])){
            return FALSE;
        }
    }
    return TRUE;
}

- (BOOL)isValidFloat:(NSUInteger)intLength floatLength:(NSUInteger)floatLength
{
    if (![self isPureFloat2] && ![self isPureInt2]) {
        return NO;
    }
    
    NSArray *array = [self componentsSeparatedByString:@"."];
    
    if (array.count==2) {
        NSString *str = array[1];
        
        if (str.length > floatLength)
        return NO;
        
        str = array[0];
        
        if (str.length > intLength)
        return NO;
    } else if (array.count == 1) {
        if (self.length > intLength)
        return NO;
    } else {
        return NO;
    }
    
    return YES;
}

- (BOOL) isAllChinese
{
    for (int i = 0; i < [self length]; i++)
    {
        int a = [self characterAtIndex:i];
        if ( a < 0x4e00 || a > 0x9fff)
        return NO;
    }
    return YES;
}

- (BOOL) hasChinese
{
    for (int i = 0; i < [self length]; i++)
    {
        int a = [self characterAtIndex:i];
        if ( a >= 0x4e00 && a <= 0x9fff)
        return YES;
    }
    return NO;
}

-(BOOL)isValidPasswordString
{
    BOOL result = NO;
    //if ([self length] >= 8 && [self length] <= 16){
        //数字条件
        NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
        
        //符合数字条件的有几个
        NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:self
                                                                           options:NSMatchingReportProgress
                                                                             range:NSMakeRange(0, self.length)];
        
        //英文字条件
        NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
        
        //符合英文字条件的有几个
        NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:self
                                                                                 options:NSMatchingReportProgress
                                                                                   range:NSMakeRange(0, self.length)];
        
        if(tNumMatchCount >= 1 && tLetterMatchCount >= 1){
            result = YES;
        }
        
    //}
    return result;
}


@end
