//: Playground - noun: a place where people can play

import UIKit

let numbers = [1, 5, 7, 9, 12, 17, 2, 4]

extension Array where Element: Comparable {

  // Linear applies O(n) time grows with input n size growing
  func linearSearch(for key: Element) -> Bool {
    for element in self {
      if element == key {
        return true
      }
    }

    return false
  }
}

let notFound = numbers.linearSearch(for: 200)
let found = numbers.linearSearch(for: 4)