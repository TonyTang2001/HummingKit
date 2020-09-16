//
//  HummingKitAuthentication.swift
//  HummingKit
//
//  Created by Tony Tang on 4/18/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation
import StoreKit

@available(iOS 11.0, macOS 11.0, watchOS 7.0, macCatalyst 13.0, *)
/// Get essential Apple Music API's authentication information and tokens and user's subscription status
public struct HummingKitAuthentication {
    
    /// Fetch Apple Music user token from server using developer token.
    /// - Parameters:
    ///   - developerToken: Developer Token provided by the developer who use this package, required for authentication.
    ///   - completion: Completion handler of request result of type Result<String, Error>, containing request status and token returned by server.
    ///   - result: Result of request, .success(userToken) or .failure(Error)
    public static func fetchUserToken(developerToken: String,
                                      completion: @escaping (_ result: Result<String, Error>) -> Void) {
        
        // SKCloudServiceController() is unavailable in macOS
        #if !os(macOS)
        let controller = SKCloudServiceController()
        controller.requestUserToken(forDeveloperToken: developerToken) { (userToken: String?, error: Error?) in
            if let musicUserToken = userToken {
                // Fetching SUCCEEDED
                completion(.success(musicUserToken))
            } else {
                // Fetching FAILED
                guard let error = error else { return }
                completion(.failure(error))
            }
        }
        #else
        completion(.failure(HummingKitEnvironmentError.systemIncompatible))
        #endif
    }
    
    /// Fetch Apple Music User Subscription Status.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Result<[AppleMusicSubscriptionStatus], Error>, containing request status and AppleMusicSubscriptionStatus returned by server.
    ///   - result: Result of request, .success([AppleMusicSubscriptionStatus]) or .failure(Error)
    public static func fetchSubscriptionStatus(completion: @escaping (_ result: Result<[AppleMusicSubscriptionStatus], Error>) -> Void) {
        
        #if !os(macOS)
        let controller = SKCloudServiceController()
        controller.requestCapabilities { (capabilities: SKCloudServiceCapability, error: Error?) in
            let canPlay = capabilities.contains(.musicCatalogPlayback)
            let canAdd = capabilities.contains(.addToCloudMusicLibrary)
            let canSubscribe = capabilities.contains(.musicCatalogSubscriptionEligible)
            
            if let err = error {
                // Error occured
                completion(.failure(err))
            } else {
                // Request succeeded
                var status: [AppleMusicSubscriptionStatus] = []
                if canPlay {
                    status.append(.canPlay)
                }
                if canAdd {
                    status.append(.canAdd)
                }
                if canSubscribe {
                    status.append(.canSubscribe)
                }
                completion(.success(status))
            }
        }
        #else
        completion(.failure(HummingKitEnvironmentError.systemIncompatible))
        #endif
    }
    
}

/// User's Apple Music subscription status on current device as may change under different settings or parental controls
public enum AppleMusicSubscriptionStatus: CaseIterable, Comparable {
    /// The device allows playback of Apple Music catalog tracks.
    case canPlay
    /// The device allows tracks to be added to the user’s music library.
    case canAdd
    /// The device allows subscription to the Apple Music catalog.
    case canSubscribe
}
