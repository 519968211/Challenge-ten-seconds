//
//  Prefix.h
//  Golden Ratio
//
//  Created by tt on 2019/7/11.
//  Copyright © 2019 tt. All rights reserved.
//

#ifndef Prefix_h
#define Prefix_h


#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define isIphoneX_XS (kScreenWidth == 375.f && kScreenHeight == 812.f ? YES : NO)
#define isIphoneXR_XSMax (kScreenWidth == 414.f && kScreenHeight == 896.f ? YES : NO)
#define isIphoneX_XR_XS_XSMax (isIphoneX_XS || isIphoneXR_XSMax)
#define kTopHeight (isIphoneX_XR_XS_XSMax?88:64)
#define kBottomHeight (isIphoneX_XR_XS_XSMax?34:0)


#endif /* Prefix_h */
