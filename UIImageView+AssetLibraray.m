//
//  UIImageView+AssetLibraray.m
//  BBP
//
//  Created by TangYunfei on 15/9/11.
//  Copyright (c) 2015年 TangYunfei. All rights reserved.
//

#import "UIImageView+AssetLibraray.h"
#import <AssetsLibrary/AssetsLibrary.h>

static inline BOOL isURLForAssetLibrary(NSURL *url)
{
    BOOL isForAssetLibrary = NO;
    
    NSError *merror = nil;
    NSString *pattern = @"^assets-library://";
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                options:0
                                                                                  error:&merror];
    
    NSUInteger matchNum = [expression numberOfMatchesInString:url.absoluteString.lowercaseString options:0 range:NSMakeRange(0, url.absoluteString.length)];
    
    if (matchNum > 0) {
        isForAssetLibrary = YES;
    }
    
    return isForAssetLibrary;
}





@implementation UIImageView(AssetLibraray)

- (void)ezo_setImageWithAssetURL:(NSURL *)url
{
    [self ezo_setImageWithAssetURL:url withImageType:EZOAssetImageTypeAspectRatioThumbnail];
}

- (void)ezo_setImageWithAssetURL:(NSURL *)url withImageType:(EZOAssetImageType)imageType
{
    
    if (isURLForAssetLibrary(url)) {
        ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
        
        [assetLibrary assetForURL:url resultBlock:^(ALAsset *asset) {
            
            UIImage *img = nil;
            
            switch (imageType) {
                case EZOAssetImageTypeThumbnail:
                    img = [UIImage imageWithCGImage:[asset thumbnail]];
                    break;
                    
                case EZOAssetImageTypeAspectRatioThumbnail:
                    img = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
                    break;
                    
                case EZOAssetImageTypeFullScreenImage:
                    img = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
                    break;
                    
                case EZOAssetImageTypeFullResolutionImage:
                    img = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
                    break;
                    
                default:
                    break;
            }
            
            
            self.image = img;
            
        } failureBlock:^(NSError *error) {
            self.image = nil;
        }];
    }
    
    
}


@end
