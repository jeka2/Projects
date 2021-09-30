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
        var myDictionary: [Character:Int] = [:]
                for char in string {
                    if (char != " ") {
                        if( myDictionary[char] != nil) {
                            myDictionary[char]! += 1
                        } else {
                            myDictionary[char] = 1
                        }
                    }
                }
                return myDictionary
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var myDictionary: [String:Int] = [:]
        for (i, v) in string.enumerated() {
            myDictionary[String(v)] = 0
        }
        for (i, v) in string.enumerated() {
            myDictionary[String(v)]! += 1
        }
        var mostUsedCount = 0
        var mostUsedChar = Character(" ")
        for (k, v) in myDictionary {
            if v > mostUsedCount {
                print(mostUsedChar)
                mostUsedChar = Character(k)
                mostUsedCount = myDictionary[k]!
            }
        }
        return mostUsedChar
        
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {
        var pairs = 0
        var array2: [Int] = []
        for (i, v) in nums.enumerated() {
            if i != 0 {
                array2.append(v)
            }
        }
        for (i, j) in array2.enumerated() {
            if j + nums[i] == 0 {
                pairs += 1
            }
        }
        return pairs
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let priorities = Array(Set(array)).sorted()
        var myDictionary: [Int:Int] = [:]
        var answer: [Int] = []
        for (i, v) in priorities.enumerated() {
            myDictionary[v] = i + 1
        }
        for v in array {
            answer.append(myDictionary[v]!)
        }
        return answer
    }
    
}
