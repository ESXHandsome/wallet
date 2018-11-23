//
//  UIImage+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/6.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIImage+Set.h"

@implementation UIImage (Set)
//+ (NSData *)zipImageWithImage:(UIImage *)image
//{
//    if (!image) {
//        return nil;
//    }
//
//
//
//    CGFloat maxFileSize = 32*1024;
//    CGFloat compression = 0.9f;
//    NSData *compressedData = UIImageJPEGRepresentation(image, compression);
//    while ([compressedData length] > maxFileSize) {
//        compression *= 0.9;
//        compressedData = UIImageJPEGRepresentation([[self class] compressImage:image newWidth:image.size.width*compression], compression);
//    }
//    return compressedData;
//}
//+ (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth
//{
//    if (!image) return nil;
//    float imageWidth = image.size.width;
//    float imageHeight = image.size.height;
//    float width = newImageWidth;
//    float height = image.size.height/(image.size.width/width);
//
//    float widthScale = imageWidth /width;
//    float heightScale = imageHeight /height;
//
//    // 创建一个bitmap的context
//    // 并把它设置成为当前正在使用的context
//    UIGraphicsBeginImageContext(CGSizeMake(width, height));
//
//    if (widthScale > heightScale) {
//        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
//    }
//    else {
//        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
//    }
//
//    // 从当前context中创建一个改变大小后的图片
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    // 使当前的context出堆栈
//    UIGraphicsEndImageContext();
//
//    return newImage;
//
//}

/*
 剪裁并压缩 直接带上想要被压缩后的大小
 */
- (NSData *)zipImage{

//        NSLog(@"图片压缩前大小：%luKB",[self length]/1024);

    return [self zipImageWithKB:100];
    
}
/**
 尺寸
 */
- (NSData *)zipImageWithKB:(CGFloat)kb{
    
    
    float scoal = self.size.width / self.size.height;
    
    UIImage *newimage;
    
    float width = [UIScreen mainScreen].bounds.size.width;
    
    if (self.size.width > [UIScreen mainScreen].bounds.size.width) {
        
        newimage = [self imageWithScaledToSize:CGSizeMake(width * 2, width * 2/scoal)];
        
    }else {
        
        newimage = self;
    }
    
    return [newimage compressImageData:kb];
}
-(NSData *)compressImageData:(CGFloat)kb
{
    UIImage *largeImage = self;
    double compressionRatio = 1;
    NSData * imgData = UIImageJPEGRepresentation(largeImage,compressionRatio);
    
    NSLog(@"图片压缩前大小：%luKB",[imgData length] / 1024);
    
    while ([imgData length]  / 1024 > kb && compressionRatio > 0) {
        
        compressionRatio -= 0.1;
        imgData = UIImageJPEGRepresentation(largeImage,compressionRatio);
    }
    NSLog(@"图片压缩后大小：%luKB",[imgData length]/1024);

    return imgData;
}
/*
 剪裁图片
 */
 - (UIImage*)imageWithScaledToSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContext(newSize);
    
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height+5)];//加一段距离解决剪裁之后有白边的问题
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
