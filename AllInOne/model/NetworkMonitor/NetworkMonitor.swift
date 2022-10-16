//
//  NetworkMonitor.swift
//  AllInOne
//
//  Created by sweta makuwala on 09/07/22.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor = NWPathMonitor()
    
    public private(set) var isConnected : Bool = false
    
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied ? false : true
            print(path.status)
            print(self?.isConnected)
        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
}
