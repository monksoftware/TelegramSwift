//
//  BadgeNode.swift
//  TGUIKit
//
//  Created by keepcoder on 11/10/2016.
//  Copyright © 2016 Telegram. All rights reserved.
//

import Cocoa


public class BadgeNode: Node {
    private var textLayout:(TextNodeLayout,()->TextNode)
    public var fillColor:NSColor {
        didSet {
            if fillColor != oldValue {
                self.view?.setNeedsDisplay()
            }
        }
    }
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        
        ctx.setFillColor(fillColor.cgColor)
        
        ctx.round(self.size, self.size.height/2.0)
        ctx.fill(layer.bounds)

        let focus = view?.focus(textLayout.0.size) ?? NSZeroRect
        textLayout.1().draw(focus, in: ctx)
    }
    
    public init(_ attributedString:NSAttributedString, _ fillColor:NSColor) {
        textLayout = TextNode.layoutText(nil)(attributedString, nil, 1, .middle, NSMakeSize(CGFloat.greatestFiniteMagnitude, CGFloat.greatestFiniteMagnitude), nil, false, .left)
        self.fillColor = fillColor
        super.init()
        
        
        size = NSMakeSize(textLayout.0.size.width + 8, textLayout.0.size.height + 7)
        size = NSMakeSize(max(size.height,size.width), size.height)
        
    }
    
    
}
