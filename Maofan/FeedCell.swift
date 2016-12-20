//
//  FeedCell.swift
//  Maofan
//
//  Created by Catt Liu on 2016/12/20.
//  Copyright © 2016年 Catt Liu. All rights reserved.
//

import UIKit
import YYText
import SDWebImage
import FLAnimatedImage

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var label: YYLabel!
    @IBOutlet weak var photo: FLAnimatedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.displaysAsynchronously = true
        label.ignoreCommonProperties = true
        label.highlightTapAction = { (view, attrString, range, rect) in
            let hightlight = attrString.attributedSubstring(from: range).attribute(YYTextHighlightAttributeName, at: 0, effectiveRange: nil)
            print((hightlight as! YYTextHighlight).userInfo!["urlString"] as! String)
        }
    }
    
    var gif: FLAnimatedImage?

    func config(feed: Feed) {
        feed.applyLayoutTo(label: label)
        photo.sd_setImage(with: feed.photo)
//        
//        
//        if let gif = gif {
//            self.photo.animatedImage = gif
//        } else {
//            SDWebImageDownloader.shared().downloadImage(with: url, options: SDWebImageDownloaderOptions.lowPriority, progress: nil, completed: {(image, data, error, bool) in
//                self.gif = FLAnimatedImage(animatedGIFData: data)
//            })
//        }
        
    }

}
