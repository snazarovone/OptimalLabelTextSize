//
//  DeviceDiagonal.swift
//  OptimalLabelTextSize
//
//  Created by Sergey Nazarov on 23/04/2019.
//

import Foundation
import UIKit

public class DeviceDiagonal{
    public static func getDiagonal() -> DeviceSize{
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480, 960:
    //                print("IPHONE 4,4S")
                return .Four_3_5
            case 1136:
    //                print("IPHONE 5,5S,5C")
                return .SE_4_0
            case 1334:
    //                print("IPHONE 6,7,8 IPHONE 6S,7S,8S ")
                return .Eight_4_7
            case 1920, 2208:
    //                print("IPHONE 6PLUS, 6SPLUS, 7PLUS, 8PLUS")
                return .Eight_Plus_5_5
            case 2436:
    //                print("IPHONE X, IPHONE XS")
                return .XS_5_8
            case 2688:
    //                print("IPHONE XS_MAX")
                return .XS_Max_6_5
            case 1792:
    //                print("IPHONE XR")
                return .XR_6_1
            default:
                return .Four_3_5
            }
        }
        else{
            if UIDevice().userInterfaceIdiom == .pad {
                switch UIScreen.main.nativeBounds.height {
                case 2048:
//                    print("iPad 5th Generation, iPad Retina, iPad Air, iPad Pro 9.7")
                    return .iPad_9_7
                case 2224:
//                    print("iPad Pro 10.5")
                    return .iPadPro_10_5
                case 2732:
//                    print("iPad Pro 12.9")
                    return .iPadPro_12_9
                default:
//                    print("iPad unknown")
                    return .iPadPro_10_5
                }
            }
        }
        return .Eight_4_7
    }
}


