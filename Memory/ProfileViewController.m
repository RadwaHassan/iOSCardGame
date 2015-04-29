//
//  ProfileViewController.m
//  Memory
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "ProfileViewController.h"
#import "HomeScreenViewController.h";
@interface ProfileViewController (){
    NSData *selectedImage;
    NSString *name;
    UIImage *userImage;
    HomeScreenViewController *home;
   // MyUser *plistUser;
}

@end

@implementation ProfileViewController

@synthesize profileImage,profileNameLabel,profileNameTxtField,changeNameBtn1,changeImageBtn,profileSaveBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
   // [profileImage setImage:selectedImage];

   _user= [self loadUser];
    name=[_user name];
    //
    NSData * imageData=[_user fImage];
    
    //convert the nsdata to uiimage to put it on image view
    UIImage *usersavedImage=[UIImage imageWithData:imageData];
    
    [profileNameTxtField setText:name];
    [profileImage setImage:usersavedImage];

    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];
[profileImage setImage:_userImage];
//   name=[_user name];
////
//    NSData * imageData=[_user fImage];
//    
//    //convert the nsdata to uiimage to put it on image view
//    UIImage *usersavedImage=[UIImage imageWithData:imageData];
//
//    [profileNameTxtField setText:name];
//    [profileImage setImage:usersavedImage];
    
	// Do any additional setup after loading the view.
    
    //self.profileNameLabel.hidden = NO;
   // self.profileNameTxtField.enabled = NO;
    //self.profileNameTxtField.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)changeNamePressed:(id)sender{
//    
//    
//    if ([[[sender titleLabel] text]  isEqual: @"Change Name"]) {
//        self.profileNameLabel.hidden = YES;
//        self.profileNameTxtField.enabled = YES;
//        self.profileNameTxtField.hidden = NO;
//        [self.changeNameBtn1 setTitle:@"Save Name" forState:UIControlStateNormal];
//    }else if ([[[sender titleLabel]text] isEqual:@"Save Name"]){
//        [profileNameLabel setText:[profileNameTxtField text]];
//        self.profileNameLabel.hidden = NO;
//        self.profileNameTxtField.enabled = NO;
//        self.profileNameTxtField.hidden = YES;
//        [self.changeNameBtn1 setTitle:@"Change Name" forState:UIControlStateNormal];
//    }
//    
//}

-(void)changeImagePressed:(id)sender{
    
    //To go to the photo library
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    //write your logic here
    [picker dismissModalViewControllerAnimated:YES];
    [profileImage setImage:image];
    _userImage=image;
    selectedImage=UIImagePNGRepresentation(image);

}

-(void)saveProfile:(id)sender{
    MyUser *plistUser=[MyUser new];
    [plistUser setName:[profileNameTxtField text]];
    [plistUser setFImage:selectedImage];
    [self saveUser:plistUser];
    //NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    //[def setValue:phone forKey:@"username"];

    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)saveUser:(MyUser *)user
{
    NSString *path =@"/Users/mariansamy/Desktop/version44iosproject/iOSProject-2/iOSCardGame/userInfo.plist";
    
    //convert the nsmutable array to nsdata
    //this method call the encoding method in
    //the friend class
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    //save this nsdata to the plist
    [data writeToFile:path atomically:YES];
}

- (MyUser *)loadUser
{
    NSLog(@"lllloooooaaaaadddd");
    
    ////******for real iphone
    //   NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    //       NSString *document=[paths objectAtIndex:0];
    //       NSString *filepath =[document stringByAppendingPathComponent:@"PropertyList.plist"];
    ///*******************
    
    MyUser *loaduser= [MyUser new];

    NSString *path =@"/Users/mariansamy/Desktop/version44iosproject/iOSProject-2/iOSCardGame/userInfo.plist";
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        //load the array that in the plist in nsdata object
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        
        //convert this nsdata obj to nsmutable array
        //this method calls the decode method in
        //friend class
        loaduser= [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
    }
//    else {
//        loaduser=[MyUser new];
//    }
    return loaduser;
}



@end
