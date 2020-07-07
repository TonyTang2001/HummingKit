//
//  HummingKitErrors.swift
//  HummingKit
//
//  Created by Tony Tang on 5/2/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation

enum HummingKitRequestGenerationError: Error {
    case exceedMaxFetchLimit(maxLimit: Int)
    case invalidArgument
    case unknownInternalError
}

enum HummingKitEnvironmentError: Error {
    case systemVersionOutdated
}

enum HummingKitResponseError: Error {
    case responseCorrupted
}
