//: [Previous](@previous)

import Foundation

let numbersEven = [1 ,5, 7, 8, 11, 22, 100, 109, 125, 139]
let numbersOdd = [1 ,2, 6, 8, 19, 22, 99, 299, 300]

extension Array where Element : Comparable {
  func binarySearch(for element : Element) -> Bool {
    var result = false

    let min = self.startIndex
    let max = self.endIndex - 1
    let mid = self.startIndex + (self.count / 2)

    // Key isn't in the sorted list
    if element < self[min] || element > self[max] { return false }

    let compareElement = self[mid]
    print("Comparing \(compareElement) to key \(element)")

    // Found it
    if compareElement == element { return true }

    if element < self[mid] {
      let end = mid - 1
      let slice = Array(self[min...end])
      result = slice.binarySearch(for: element)
    } else if element > self[mid] {
      let start = mid + 1
      let slice = Array(self[start...max])
      result = slice.binarySearch(for: element)
    } else  {
      // It's not greater or less than. Must be equal
      result = true
    }

    return result
  }
}

let notFoundEven = numbersEven.binarySearch(for: 300)
let foundEven = numbersEven.binarySearch(for: 100)
let notFoundOdd = numbersOdd.binarySearch(for: 3)
let foundOdd = numbersOdd.binarySearch(for: 22)