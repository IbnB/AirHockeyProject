//
//  FittedLabelNode.swift
//  AirHockeyProject
//
//  Created by divms on 4/3/15.
//  Copyright (c) 2015 divms. All rights reserved.
//

import Foundation
import SpriteKit


//this is a label node that automatically resizes text to fit a box of the given size
//only works with single line text
public class FittedLabelNode : SKLabelNode {
    private var size : CGSize
    private var MAX_FONTSIZE : CGFloat = 300
    init(s : CGSize, str : String) {
        size = s
        super.init()
        
        self.text = str
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func getFontSizeToFitWidth(s : String) -> CGFloat {
        // won't fit if it is empty, so just return 1
        if (s.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty){
            return 1
        }
        var testSize : CGFloat = 1
        let temp : NSString = s
        while (testSize<MAX_FONTSIZE) {
            let dict = [NSFontAttributeName:UIFont(name: self.fontName, size: testSize)!]
            
            let curSize : CGSize = temp.sizeWithAttributes(dict)
            
            if (curSize.width>size.width || curSize.height>size.height) {
                break;
            }
            
            
            testSize = testSize + 0.5
        }
        return testSize - 0.5
    }
    
    
    
    
    public func setSize(s : CGSize) {
        size = s
        self.fontSize = getFontSizeToFitWidth(self.text)

    }
    public func getSize() -> CGSize {
        return size
    }
    
    public func setText(t : String) {
        self.fontSize = getFontSizeToFitWidth(t)
        
        super.text = t
    }
    
    public func setFontName(t : String) {
        
        super.fontName = t
        
        self.fontSize = getFontSizeToFitWidth(self.text)
    }
    
}