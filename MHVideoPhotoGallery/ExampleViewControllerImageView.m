//
//  ExampleViewControllerImageView.m
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 14.01.14.
//  Copyright (c) 2014 Mario Hahn. All rights reserved.
//

#import "ExampleViewControllerImageView.h"

@interface ExampleViewControllerImageView () <MHGalleryImageOperationDelegate, MHGalleryDataSource, MHGalleryDelegate>
@property (nonatomic, strong) NSArray *galleryItems;
@end

@implementation ExampleViewControllerImageView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"ImageView";
    
    MHGalleryItem *youtube = [[MHGalleryItem alloc]initWithURL:@"http://www.youtube.com/watch?v=YSdJtNen-EA"
                                                   galleryType:MHGalleryTypeVideo];
    
    MHGalleryItem *vimeo0 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/35515926"
                                                  galleryType:MHGalleryTypeVideo];
    MHGalleryItem *vimeo1 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/50006726"
                                                  galleryType:MHGalleryTypeVideo];
    MHGalleryItem *vimeo3 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/66841007"
                                                  galleryType:MHGalleryTypeVideo];
    
    MHGalleryItem *landschaft = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(47).jpg"
                                                      galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft1 = [[MHGalleryItem alloc]initWithURL:@"http://de.flash-screen.com/free-wallpaper/bezaubernde-landschaftsabbildung-hd/hd-bezaubernde-landschaftsder-tapete,1920x1200,56420.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft2 = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(64).jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft3 = [[MHGalleryItem alloc]initWithURL:@"http://www.dirks-computerseite.de/wp-content/uploads/2013/06/purpleworld1.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft4 = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(42).jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft5 = [[MHGalleryItem alloc]initWithURL:@"http://woxx.de/wp-content/uploads/sites/3/2013/02/8X2cWV3.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft6 = [[MHGalleryItem alloc]initWithURL:@"http://kwerfeldein.de/wp-content/uploads/2012/05/Sharpened-version.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft7 = [[MHGalleryItem alloc]initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/sunset-glow-trees-beautiful-scenery.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft8 = [[MHGalleryItem alloc]initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/beautiful_scenery_wallpaper_The_Eiffel_Tower_at_night_.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft9 = [[MHGalleryItem alloc]initWithURL:@"http://p1.pichost.me/i/40/1638707.jpg"
                                                       galleryType:MHGalleryTypeImage];
    
    MHGalleryItem *landschaft10 = [[MHGalleryItem alloc]initWithURL:@"http://4.bp.blogspot.com/-8O0ZkAgb6Bo/Ulf_80tUN6I/AAAAAAAAH34/I1L2lKjzE9M/s1600/Beautiful-Scenery-Wallpapers.jpg"
                                                        galleryType:MHGalleryTypeImage];
    
    self.galleryItems = @[landschaft,landschaft1,landschaft2,landschaft3,landschaft4,landschaft5,landschaft6,landschaft7,landschaft8,landschaft9];
    
    self.iv.currentImageIndex = 0;
    self.iv.viewController = self;
    [self.iv setImageWithURL:[NSURL URLWithString:landschaft.URLString]];
    [self.iv setUserInteractionEnabled:YES];
    self.iv.shoudlUsePanGestureReconizer = YES;
    self.iv.galleryDelegate = self;
    self.iv.galleryDataSource = self;
    self.iv.imageOperationDelegate = self;
    MHUICustomization *customzation = [[MHUICustomization alloc] init];
    self.iv.customization = customzation;
    
    __weak typeof(self)blockSelf = self;
    self.iv.finishedCallback = ^(NSUInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition,MHGalleryViewMode viewMode) {
        if (viewMode == MHGalleryViewModeOverView) {
            [blockSelf dismissViewControllerAnimated:YES completion:nil];
        }else{
            blockSelf.iv.image = image;
            blockSelf.iv.currentImageIndex = currentIndex;
            [blockSelf.presentedViewController dismissViewControllerAnimated:YES dismissImageView:blockSelf.iv completion:nil];
        }
    };
}


- (void)galleryImageOperationDidDeleteAtIndex:(NSInteger)index
{
    NSLog(@" ExampleViewControllerImageView delete at: %ld", index);
}



/**
 *  @param index which is currently needed
 *
 *  @return MHGalleryItem
 */
- (MHGalleryItem*)itemForIndex:(NSInteger)index {
    return self.galleryItems[index];
}
/**
 *  @param galleryController
 *
 *  @return the number of Items you want to Display
 */
- (NSInteger)numberOfItemsInGallery:(MHGalleryController*)galleryController
{
    return self.galleryItems.count;
}

@end
