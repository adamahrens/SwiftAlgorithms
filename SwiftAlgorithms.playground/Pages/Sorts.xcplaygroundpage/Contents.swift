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

  func bubbleSort() -> Array<Element> {
    guard self.count > 1 else { return self }
    var copy = self

    for index in 0..<copy.count {
      // After each pass the last element will be in it's final position
      let max = (copy.count - 1) - index
      for innerIndex in 0..<max {
        if copy[innerIndex] > copy[innerIndex + 1] {
          swap(&copy[innerIndex], &copy[innerIndex + 1])
        }
      }
    }

    return copy
  }

  func selectionSort() -> Array<Element> {
    guard self.count > 1 else { return self }
    var copy = self

    for index in 0..<copy.count {
      var minIndex = index

      // Find smallest element compared to current element if it exists
      for innerIndex in (index+1)..<copy.count {
        let compareElement = copy[innerIndex]
        if compareElement < copy[minIndex] {
          minIndex = innerIndex
        }
      }

      // Found a smaller element. Swap
      if minIndex != index {
        swap(&copy[index], &copy[minIndex])
      }
    }

    return copy
  }
}

let unsorted = [5, 9, 2, 1, 6, 4, 3, 8, 7, 10]
let sortedInsertion = unsorted.insertionSort()
let sortedBubble = unsorted.bubbleSort()
let sortedSelection = unsorted.selectionSort()
