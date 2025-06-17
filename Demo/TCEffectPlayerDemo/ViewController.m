// Copyright (c) 2021 Tencent. All rights reserved.

#import "ViewController.h"
#import <TCEffectPlayer/TCEffectPlayer.h>
#import <TCMediaX/TCMediaX.h>
#import <Masonry/Masonry.h>

@interface ViewController ()<TCEPAnimViewDelegate, TCMediaXBaseDelegate>

@property (nonatomic, strong) TCEffectAnimView *alphaAnimView1;
@property (nonatomic, strong) TCEffectAnimView *alphaAnimView2;
@property (nonatomic, strong) TCEffectAnimView *alphaAnimView3;

@property (nonatomic, strong) TCEffectAnimView *alphaAnimView4;

@property (nonatomic, strong) TCEffectAnimView *mixedView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startVideoPlay)
                                                 name:@"TCEffectPlayerLicenseCheckerSuccess"
                                               object:nil];
    
    NSString *sdkVersion = [TCEffectAnimView getSdkVersion];
    NSLog(@"sdkVersion = %@", sdkVersion);
    
    [self.view addSubview:self.alphaAnimView1];
    [self.alphaAnimView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(100));
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
    
    [self.view addSubview:self.alphaAnimView2];
    [self.alphaAnimView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(self.alphaAnimView1.mas_bottom).offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
    
    [self.view addSubview:self.alphaAnimView3];
    [self.alphaAnimView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(self.alphaAnimView2.mas_bottom).offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
    

    
    [self.view addSubview:self.mixedView];
    [self.mixedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(30));
        make.top.equalTo(self.alphaAnimView3.mas_bottom).offset(10);
        make.width.equalTo(@(250));
        make.height.equalTo(@(100));
    }];
    
}
    
- (void)startVideoPlay {
    

    NSString *fileUrl1 = [[NSBundle mainBundle] pathForResource:@"tcmp_01" ofType:@"tcmp4"];
    [self.alphaAnimView1 startPlay:fileUrl1];
    
    NSString *fileUrl2 = [[NSBundle mainBundle] pathForResource:@"tcmp_02" ofType:@"tcmp4"];
    [self.alphaAnimView2 startPlay:fileUrl2];
    
    NSString *fileUrl3 = [[NSBundle mainBundle] pathForResource:@"tcmp_03" ofType:@"tcmp4"];
    [self.alphaAnimView3 startPlay:fileUrl3];
    

}

#pragma mark - Lazzy Load

- (TCEffectAnimView *)alphaAnimView1 {
    if (!_alphaAnimView1) {
        _alphaAnimView1 = [[TCEffectAnimView alloc] initWithFrame:CGRectZero];
        _alphaAnimView1.backgroundColor = [UIColor clearColor];
        _alphaAnimView1.effectPlayerDelegate = self;
        _alphaAnimView1.loop = YES;
        [_alphaAnimView1 setRenderMode:TCEPVPViewContentModeAspectFit];
    }
    return _alphaAnimView1;
}

- (TCEffectAnimView *)alphaAnimView2 {
    if (!_alphaAnimView2) {
        _alphaAnimView2 = [[TCEffectAnimView alloc] initWithFrame:CGRectZero];
        _alphaAnimView2.backgroundColor = [UIColor clearColor];
        _alphaAnimView2.effectPlayerDelegate = self;
        _alphaAnimView2.loop = YES;
        [_alphaAnimView2 setRenderMode:TCEPVPViewContentModeAspectFit];
    }
    return _alphaAnimView2;
}

- (TCEffectAnimView *)alphaAnimView3 {
    if (!_alphaAnimView3) {
        _alphaAnimView3 = [[TCEffectAnimView alloc] initWithFrame:CGRectZero];
        _alphaAnimView3.backgroundColor = [UIColor clearColor];
        _alphaAnimView3.effectPlayerDelegate = self;
        _alphaAnimView3.loop = YES;
        [_alphaAnimView3 setRenderMode:TCEPVPViewContentModeAspectFit];
        [_alphaAnimView3 setVideoMode:TCEPVAPVFTextureBlendMode_AlphaRight];
    }
    return _alphaAnimView3;
}

- (TCEffectAnimView *)alphaAnimView4 {
    if (!_alphaAnimView4) {
        _alphaAnimView4 = [[TCEffectAnimView alloc] initWithFrame:CGRectZero];
        _alphaAnimView4.backgroundColor = [UIColor clearColor];
        _alphaAnimView4.effectPlayerDelegate = self;
        _alphaAnimView4.loop = YES;
        [_alphaAnimView4 setRenderMode:TCEPVPViewContentModeAspectFit];
        [_alphaAnimView4 setVideoMode:TCEPVAPVFTextureBlendMode_AlphaRight];
    }
    return _alphaAnimView4;
}

- (TCEffectAnimView *)mixedView {
    if (!_mixedView) {
        _mixedView = [[TCEffectAnimView alloc] initWithFrame:CGRectZero];
        _mixedView.backgroundColor = [UIColor clearColor];
        _mixedView.effectPlayerDelegate = self;
        _mixedView.loop = YES;
        [_mixedView setRenderMode:TCEPVPViewContentModeAspectFit];
        [_alphaAnimView4 setVideoMode:TCEPVAPVFTextureBlendMode_AlphaBottom];
    }
    return _mixedView;
}

#pragma mark - TCEPAnimViewDelegate


- (void)onPlayEvent:(ITCEffectPlayer *)player
              event:(int)EvtID
          withParam:(NSDictionary *)param {
    NSLog(@"player = %p, EvtID = %@", player, @(EvtID));
}

- (void)tcePlayerError:(ITCEffectPlayer *)player error:(NSError *)error {
    NSLog(@"error = %@", error);
}

// Pass in the image information in the fusion animation resource
- (void)loadImageForPlayer:(ITCEffectPlayer *)player
                   context:(NSDictionary *)context
                completion:(void(^)(UIImage *image,
                                    NSError *error))completionBlock {
    
    NSString *tag = context[TCEPContextSourceTypeImageIndex];   // tag（index）
    NSString *imageName = context[@"imageurl"];
    if ([tag isEqualToString:@"test_tag"]) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"user_head" ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        if (image) {
            completionBlock(image, nil);
        }
    }
}


// Replace the text placeholder in the Fusion Animation resource configuration, and support the configuration file's alignment, color and other properties.
- (TCEffectText *)loadTextForPlayer:(ITCEffectPlayer *)player
                            withTag:(NSString *)tag {
    if ([tag isEqualToString:@"test_tag"]) {
        TCEffectText *effectText = [[TCEffectText alloc] init];
        effectText.text = @"test_value";
        effectText.color = [UIColor grayColor];
        return effectText;
    }
    return nil;
}

@end

