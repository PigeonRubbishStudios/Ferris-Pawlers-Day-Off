//
//  IntUtils.swift
//  Ferris Pawler's Day Off
//
//  Created by Bolinger, Kyle D on 4/24/19.
//  Copyright © 2019 Pigeon Rubbish Studios. All rights reserved.
//

import CoreGraphics

public extension Int
{
    //Ensures that the Integer Value Stays with the Specified Range
    func clamped(_ range: Range<Int>) -> Int
    {
        return (self < range.lowerBound) ? range.lowerBound : ((self >= range.upperBound) ? range.upperBound - 1: self)
    }
    
    func clamped(_ range: ClosedRange<Int>) -> Int
    {
        return (self < range.lowerBound) ? range.lowerBound : ((self > range.upperBound) ? range.upperBound: self)
    }
    
    //Ensures that the Integer Value Stays with the Specified Range
    mutating func clamp(_ range: Range<Int>) -> Int
    {
        self = clamped(range)
        return self
    }
    
    mutating func clamp(_ range: ClosedRange<Int>) -> Int
    {
        self = clamped(range)
        return self
    }
    
    //Ensures that the Integer Value Stays Between the Given Values,Inclusive
    func clamped(_ v1: Int, _ v2: Int) -> Int
    {
        let min = v1 < v2 ? v1 : v2
        let max = v1 > v2 ? v1 : v2
        return self < min ? min : (self > max ? max : self)
    }
    
    //Ensures that the Integer Value Stays Between the Given Values,Inclusive
    mutating func clamp(_ v1: Int, _ v2: Int) -> Int
    {
        self = clamped(v1, v2)
        return self
    }
    
    //Returns a Random Integer in the Specified Range
    static func random(_ range: Range<Int>) -> Int
    {
        return Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound - 1))) + range.lowerBound
    }
    
    static func random(_ range: ClosedRange<Int>) -> Int
    {
        return Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound))) + range.lowerBound
    }
    
    //Returns a Random Integer Between 0 and n-1
    static func random(_ n: Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    //Returns a Random Integer in the Range Min...Max, Inclusive
    static func random(min: Int, max: Int) -> Int
    {
        assert(min < max)
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
}


