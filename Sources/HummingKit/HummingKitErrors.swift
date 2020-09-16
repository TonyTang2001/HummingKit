//
//  HummingKitErrors.swift
//  HummingKit
//
//  Created by Tony Tang on 5/2/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation

/// Errors occur when composing API requests, might be caused by illegal amount of arguments or arguments of illegal formats.
public enum HummingKitRequestComposingError: Error {
    case exceedMaxFetchLimit(maxLimit: Int)
    case invalidArgument
    case unknownInternalError
}

/// Errors occur when certain functionality is unsupported by the system environment, possibly due to the systemversion being outdated and not supporting some newer features.
public enum HummingKitEnvironmentError: Error {
    case systemVersionOutdated
    case systemVersionIncompatible
}

/// Errors occur when the response content does not match format expected, causing parsing failure, possibly caused by corrupted response body, a new version of Apple Music API that has not been adapted by HummingKit, or errounous codes failed to be inspected beforehand.
public enum HummingKitResponseError: Error {
    case responseCorrupted
}

/// Unexpected fatal HummingKit errors, potentially caused by internal bugs. If this type of error has occured, please file an issue on the HummingKit repo at Issues page. Thank you!
public enum HummingKitInternalError: Error {
    case impossibleCase
}
