//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {

    /// Using print command
        func printWord(word: String) {
            print(word)
        }
        
        /// input "hello" should print "HELLO"
        func printUpperCase(word: String) {
            print(word.uppercased())
        }
        
        /// Using for loop, print each char in word
        func printLetters(word: String) {
            for char in word {
                print(char)
              }
        }
        
        /// given a word, flip its characters, and print the result
        /// e.g. football -> llabtoof
        func flipWord(word: String) {
            print(String(word.reversed()))
        }
        
        /// Using for-in-enumerated(), print odd-position chars in word
        func printOddCharsEnumerated(word: String) {
            for (i, char) in word.enumerated() {
                if (i % 2 == 0) {
                  print(char)
                }
              }
        }
        
        /**
         Pig Latin:
         1) Move the first letter to the end and add "ay"
         pig -> igpay
         latin -> atinay
         2) IF word starts with a vowel, add "yay" to the word
         one -> oneyay
         */
        func printPigLatin(word: String) {
            let firstChar = word.prefix(1).lowercased()
            var returnWord = word
            if(firstChar == "a" || firstChar == "e" || firstChar == "i" || firstChar == "o" || firstChar == "u") {
                print("\(returnWord)yay")
            } else {
                returnWord.removeFirst()
                print("\(returnWord)\(firstChar)ay")
            }
        }
        
        /// Using loop and string.index, return true if input is a palindrome
        func isPalindrome(word: String) -> Bool {
            let i = word.count / 2
            let length = word.count
            for count in 0...i {
                var startVal = word[word.index(word.startIndex, offsetBy: count)]
                var endVal = word[word.index(word.startIndex, offsetBy: length - count - 1)]
                if(startVal != endVal) {
                    return false
                }
            }
            return true
        }
}
