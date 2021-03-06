//
//  HubType.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum HubType {
    
    case boost
    case boostV1
    case poweredUp
    case remoteControl
    case duploTrain
    case controlPlus
}

public extension HubType {
    
    init?(manufacturerData: Data) {
        guard manufacturerData.count > 3 else { return nil }
        
        switch manufacturerData[3] {
        case 0x40:
            if manufacturerData[6] & 0x02 > 0 {
                self = .boost
            } else {
                self = .boostV1
            }
        case 0x41:
            self = .poweredUp
        case 0x42:
            self = .remoteControl
        case 0x20:
            self = .duploTrain
        case 0x80:
            self = .controlPlus
        default:
            return nil
        }
    }
}

extension HubType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .boost:
            return "BOOST Move Hub"
        case .boostV1:
            return "BOOST Move Hub (F/W 1.x)"
        case .poweredUp:
            return "Powered Up Smart Hub"
        case .remoteControl:
            return "Powered Up Remote Control"
        case .duploTrain:
            return "Duplo Train Base"
        case .controlPlus:
            return "CONTROL+ Smart Hub"
        }
    }
}

