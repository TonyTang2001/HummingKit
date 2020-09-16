//
//  HummingKitErrors.swift
//  HummingKit
//
//  Created by Tony Tang on 5/2/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation

/// Occurs when composing API requests, might be caused by illegal amount of arguments or arguments of illegal formats.
public enum HummingKitRequestComposingError: Error {
    /// The amount of resources axceeds the upper limit of the Apple Music API.
    case exceedMaxFetchLimit(maxLimit: Int)
    /// Argument(s) being passed to request composing function is invalid.
    case invalidArgument
    /// Unexpected internal error of HummingKit. Please file an issue to report this bug.
    case unknownInternalError
}

/// Occurs when certain functionality is unsupported by the system environment, possibly due to the systemversion being outdated and not supporting some newer features.
public enum HummingKitEnvironmentError: Error {
    /// System version of deploymeny target is outdated, thus certain functionality or feature set is unavailable.
    case systemVersionOutdated
    /// System of deploymeny target is incompatible with certain functionality or feature set. Not necessarily due to outdated firmware, might be hardware restrictions.
    case systemIncompatible
}

/// Occurs when the response content does not match format expected, causing parsing failure, possibly caused by corrupted response body, a new version of Apple Music API that has not been adapted by HummingKit, or errounous codes failed to be inspected beforehand.
public enum HummingKitResponseError: Error {
    /// Response from Apple Music server is not formatted as expected. Response may be corrupted or the Apple Music API has experienced destructive changes.
    case responseCorrupted
}

/// Unexpected fatal HummingKit errors, potentially caused by internal bugs. If this type of error has occured, please file an issue on the HummingKit repo at Issues page. Thank you!
public enum HummingKitInternalError: Error {
    /// Unexpected case has occured. Please file an issue to report this bug.
    case impossibleCase
}
