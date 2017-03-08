/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 * 
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "TXTouchableScrollView.h"

@implementation TXTouchableScrollView

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging)
    {
        [self.superview touchesCancelled:touches withEvent:event];
    }
    else
    {
        [super touchesCancelled:touches withEvent: event];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging)
    {
        [self.superview touchesMoved:touches withEvent:event];
    }
    else
    {
        [super touchesMoved:touches withEvent:event];
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging)
    {
        [self.superview touchesBegan:touches withEvent:event];
    }
    else
    {
        [super touchesBegan:touches withEvent:event];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging)
    {
        [self.superview touchesEnded:touches withEvent:event];
    }
    else
    {
        [super touchesEnded:touches withEvent:event];
    }
}

@end
