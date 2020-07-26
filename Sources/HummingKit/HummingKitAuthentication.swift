//
//  HummingKitAuthentication.swift
//  HummingKit
//
//  Created by Tony Tang on 4/18/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation
import StoreKit

public struct HummingKitAuthentication {
    
    /// Static function for fetching Apple Music user token from server using developer token.
    /// - Parameters:
    ///   - developerToken: Developer Token provided by the developer who use this package, required for authentication.
    ///   - completion: Result<String, Error> containing request status and token returned by server.
    public static func fetchUserToken(developerToken: String,
                                      completion: @escaping (Result<String, Error>) -> Void) {
        
        var result: Result<String, Error> = .success("") // initialzation required before closure
        
        if #available(iOS 11.0, macOS 11.0, *) {
            // SKCloudServiceController() is unavailable in macOS
            #if iOS
            let controller = SKCloudServiceController()
            controller.requestUserToken(forDeveloperToken: developerToken) { (userToken: String?, error: Error?) in
                if let musicUserToken = userToken {
                    // Fetching SUCCEEDED
                    result = .success(musicUserToken)
                    completion(result)
                } else {
                    // Fetching FAILED
                    guard let error = error else { return }
                    result = .failure(error)
                    completion(result)
                }
            }
            #endif
        } else {
            // return failure if iOS version is too low to support functionality
            result = .failure(HummingKitEnvironmentError.systemVersionOutdated)
            completion(result)
        }
    }
    
    
    
    
}

