//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        return Array(Set(nums))
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        return Array(Set(firstNums).intersection(Set(secondNums)))
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        return Array(Set(firstWord).intersection(Set(secondWord)))
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var collector: [Character: Int] = [:]
           for char in string {
             if(collector[char] != nil) {
                 collector[char]! += 1
             } else if(char != " "){
               collector[char] = 1
             }
           }
           return collector
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var collector: [Character: Int] = [:]
           for char in string {
             if(collector[char] != nil) {
                 collector[char]! += 1
             } else {
               collector[char] = 1
             }
           }
           var highestOccuranceRate = 0
           var highestOccuranceChar = ""
           for (char, occuranceCount) in collector {
             if(occuranceCount > highestOccuranceRate) {
               highestOccuranceRate = occuranceCount
               highestOccuranceChar = String(char)
             }
           }
           return Character(highestOccuranceChar)
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {        
        var counter = 0
           for num in nums {
             if(nums.contains(0 - num)) {
               counter += 1
             }
           }
           return counter / 2
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var tracker: [Int:Int] = [:]
        for (i, val) in Set(array).sorted().enumerated() {
            tracker[val] = i + 1
        }
        var returnArr: [Int] = []
        for num in array {
            returnArr.append(tracker[num]!)
        }
        return returnArr
    }
    
}
