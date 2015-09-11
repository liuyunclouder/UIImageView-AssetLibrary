//
//  UIImageView+AssetLibraray.h
//  BBP
//
//  Created by TangYunfei on 15/9/11.
//  Copyright (c) 2015年 TangYunfei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EZOAssetImageType){
    EZOAssetImageTypeThumbnail,
    EZOAssetImageTypeAspectRatioThumbnail,
    EZOAssetImageTypeFullScreenImage,
    EZOAssetImageTypeFullResolutionImage,
    EZOAssetImageTypeNum
};

@interface UIImageView(AssetLibraray)

/**
 *  set the image content for the current UIImageView,
 *  the default imageType is EZOAssetImageTypeAspectRatioThumbnail;
 *
 *  @param url the asset url
 */
- (void)ezo_setImageWithAssetURL:(NSURL *)url;

/**
 *  set the image content for the current UIImageView,
 *  you can choose from EZOAssetImageType to set the imageType;
 *
 *  @param url       the asset url
 *  @param imageType refer to EZOAssetImageType
 */

- (void)ezo_setImageWithAssetURL:(NSURL *)url withImageType:(EZOAssetImageType)imageType;

@end
