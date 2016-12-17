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

  mutating func quickSort() -> Array<Element> {
    guard self.count > 1 else { return self }

    func quickSortRecursive(start: Int, end: Int, array: inout Array<Element>) {
      if start >= end { return }
      let partition = pivot(start: start, end: end, array: &array)
      quickSortRecursive(start: start, end: partition - 1, array: &array)
      quickSortRecursive(start: partition + 1, end: end, array: &array)
    }

    func pivot(start: Int, end: Int, array: inout Array<Element>) -> Int {
      let pivotValue = array[end]
      var low = start
      var high = end

      while low < high {
        while array[low] < pivotValue {
          low += 1
        }

        while array[high] > pivotValue {
          high -= 1
        }

        if low < high {
          swap(&array[low], &array[high])
        }
      }

      if low != end && array[low] < pivotValue {
        swap(&array[low], &array[end])
      }

      return low
    }

    quickSortRecursive(start: 0, end: self.count - 1, array: &self)
    return self
  }
}

var unsorted = [5, 9, 2, 1, 6, 4, 3, 8, 7, 10]
var reverse = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
var other = [10, 1, 9, 2, 8, 4, 7, 3, 6, 5]

let sortedInsertion = unsorted.insertionSort()
let sortedBubble = unsorted.bubbleSort()
let sortedSelection = unsorted.selectionSort()
let sortedQuicksort = unsorted.quickSort()
let anotherQuicksort = reverse.quickSort()
let againQuickstor = other.quickSort()