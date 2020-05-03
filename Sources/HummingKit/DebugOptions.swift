//
//  DebugOptions.swift
//  HummingKit
//
//  Created by 唐子轩 on 2019/9/5.
//  Copyright © 2019 TonyTang. All rights reserved.
//

import Foundation

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    
    #if DEBUG
    
    var idx = items.startIndex
    let endIdx = items.endIndex
    
    repeat {
        Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
        idx += 1
    }
        while idx < endIdx
    
    #endif
}
