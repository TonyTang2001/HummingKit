//
//  HummingKitErrors.swift
//  HummingKit
//
//  Created by Tony Tang on 5/2/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation

public enum HummingKitRequestGenerationError: Error {
    case exceedMaxFetchLimit(maxLimit: Int)
    case invalidArgument
    case unknownInternalError
}

public enum HummingKitEnvironmentError: Error {
    case systemVersionOutdated
}

public enum HummingKitResponseError: Error {
    case responseCorrupted
}

/// HummingKitInternalError indicates unexpected fatal HummingKit errors, potentially caused by internal bugs. If this type of error is encountered, please file an issue on the HummingKit repo at Issues page. Thank you!
public enum HummingKitInternalError: Error {
    case impossibleCase
}
