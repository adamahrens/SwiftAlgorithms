//: [Previous](@previous)

import Foundation

extension Array where Element : Comparable {

  func insertionSort() -> Array<Element> {
    guard self.count > 1 else { return self }

    var copy = self

    for index in 1..<self.count {
      let currentElement = copy[index]
      for compareIndex in (0...index-1).reversed() {
        let element = copy[compareIndex]

        if currentElement < element {
          // Swap
          let removed = copy.remove(at: compareIndex)
          copy.insert(removed, at: compareIndex + 1)
        }
      }
    }

    return copy
  }
}

let unsorted = [5, 9, 2, 1, 6, 4, 3, 8, 7, 10]
let sorted = unsorted.insertionSort()