//
//  UserMedia.swift
//  InstagramParse
//
//  Created by Danyal Rizvi on 2/28/16.
//  Copyright © 2016 dsrizvi. All rights reserved.
//

import UIKit
import Parse

class UserMedia: NSObject {
	
	/**
	Method to post user media to Parse by uploading image file
	
	- parameter image: Image that the user wants upload to parse
	- parameter caption: Caption text input by the user
	- parameter username : username of the author of the post
	- parameter completion: Block to be executed after save operation is complete
	*/
	
	class func postUserImage(image: UIImage?, withCaption caption: String?, withUsername username: String?, withCompletion completion : PFBooleanResultBlock?){
		let media = PFObject(className: "UserMedia")
		
		media["caption"] = caption
		media["autor"] = username
		media["image"] = getPFFileFromImage(image)
		
		media.saveInBackgroundWithBlock(completion)
	}
	
	/**
	Method to post user media to Parse by uploading image file
	
	- parameter image: Image that the user wants to upload to parse
	
	- returns: PFFile for the the data in the image
	*/
	class func getPFFileFromImage(image: UIImage?) -> PFFile? {
		// check if image is not nil
		if let image2 = image {
			// get image data and check if that is not nil
			if let imageData = UIImagePNGRepresentation(resize(image2, newSize: CGSize(width: 150.0, height: 150.0))) {
				return PFFile(name: "image.png", data: imageData)
			}
		}
		return nil
	}
	
	class func resize(image: UIImage, newSize: CGSize) -> UIImage {
		let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
		resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
		resizeImageView.image = image
		
		UIGraphicsBeginImageContext(resizeImageView.frame.size)
		resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return newImage
	}

}
