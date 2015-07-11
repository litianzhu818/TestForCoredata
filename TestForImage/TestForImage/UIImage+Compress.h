//
//  UIImage(Compress).h
//  TestForImage
//
//  Created by Peter Lee on 15/3/13.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

- (UIImage *)compressedImage;

- (CGFloat)compressionQuality;

- (NSData *)compressedData;

- (NSData *)compressedData:(CGFloat)compressionQuality;

@end