//
//  ViewController.m
//  TestForImage
//
//  Created by Peter Lee on 15/3/13.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Compress.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI
{
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [imageView setContentMode:UIViewContentModeCenter];
        
        [self.view addSubview:imageView];
        
        NSMutableArray *Constraints = [NSMutableArray array];
        
        [Constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
        
        
        [Constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[imageView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
        
        [self.view addConstraints:Constraints];
        
        imageView;
    });
    
//    UIImage *image = [ViewController thumbnailWithImageWithoutScale:[UIImage imageNamed:@"图片1.jpeg"] size:CGSizeMake(200, 200)];
//    
//    NSUInteger length = [UIImageJPEGRepresentation(image, 1.0) length]/1024;
//    NSData *data1 = nil;
//    
//    if (length > 5) {
//        data1 = UIImageJPEGRepresentation(image, 5/length);
//    }
    
    self.imageView.image = [UIImage imageWithData:[[[UIImage imageNamed:@"图片1.jpeg"] compressedImage] compressedData] ];
    
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 1.0) ;
    NSLog(@"====>%ldK",[data length]/1024);
    
    //self.imageView.backgroundColor = [UIColor redColor];
}


//1.自动缩放到指定大小

+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        UIGraphicsBeginImageContext(asize);
        
        [image drawInRect:CGRectMake(0, 0, asize.width, asize.height)];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}

//2.保持原来的长宽比，生成一个缩略图

+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
            
        }
        
        else{
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    
    return newimage;
    
}

//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

@end
