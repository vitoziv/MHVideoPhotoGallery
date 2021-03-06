//
//  MHGalleryPresenterImageView.h
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 20.02.14.
//  Copyright (c) 2014 Mario Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHTransitionPresentMHGallery.h"
#import "MHTransitionDismissMHGallery.h"
#import "MHCustomization.h"

@class MHTransitionPresentMHGallery;
@class MHTransitionDismissMHGallery;
@class MHPresenterImageView;
@protocol MHGalleryImageOperationDelegate;
@protocol MHGalleryDelegate;
@protocol MHGalleryDataSource;

@protocol MHPresenterImageViewDelegate <NSObject>

- (void)presenterImageViewDidTap:(MHPresenterImageView *)presenterImageView;

@end

@interface MHPresenterImageView : UIImageView <UIGestureRecognizerDelegate>

@property (nonatomic)       BOOL shoudlUsePanGestureReconizer;
/**
 *  set your Current ViewController
 */
@property (nonatomic,weak) UIViewController *viewController;
/**
 *  set your the Data Source
 */
@property (nonatomic,strong) NSArray *galleryItems;
/**
 *  set the currentIndex
 */
@property (nonatomic)        NSInteger currentImageIndex;

@property (nonatomic, strong) MHUICustomization *customization;

@property (nonatomic, copy) void (^finishedCallback)(NSUInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition,MHGalleryViewMode viewMode);

@property (nonatomic,strong) MHTransitionPresentMHGallery *presenter;

@property (nonatomic, weak) id<MHGalleryImageOperationDelegate> imageOperationDelegate;
@property (nonatomic, weak) id<MHGalleryDelegate> galleryDelegate;
@property (nonatomic, weak) id<MHGalleryDataSource> galleryDataSource;
@property (nonatomic, weak) id<MHPresenterImageViewDelegate> delegate;

-(void)setInseractiveGalleryPresentionWithItems:(NSArray*)galleryItems
                              currentImageIndex:(NSInteger)currentImageIndex
                          currentViewController:(UIViewController*)viewController
                                 finishCallback:(void(^)(NSUInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition,MHGalleryViewMode viewMode)
                                                 )FinishBlock;
@end
