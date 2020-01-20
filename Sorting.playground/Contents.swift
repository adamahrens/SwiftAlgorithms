import UIKit

var sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let unsorted = [8, 2, 10, 9, 7, 5]

extension Array where Element: Comparable {

  func selectionSort() -> Array<Element> {
    guard count > 1 else { return self }
    var result = self
    let total = result.count
      for i in 0..<(total-1) {
        var minIndex = i
        for j in (i+1)..<(total) {
          if result[minIndex] > result[j] {
            minIndex = j
          }
        }

        if minIndex != i {
          // swap
          result.swapAt(i, minIndex)
        }
      }

    return result
  }

  func bubbleSort() -> Array<Element> {
    guard count > 1 else { return self }
    var result = self
    let total = result.count
    for i in 0..<(total-1) {
      for j in (i+1)..<(total) {
        let left = result[i]
        let right = result[j]

        if left > right {
          result[j] = left
          result[i] = right
        }
      }
    }

    return result
  }

  func insertionSort() -> Array<Element> {
    guard count > 1 else { return self }
    var result = self
    for index in 1..<result.count {
      var currentIndex = index
      var previousIndex = index - 1

      while previousIndex > -1 {
        let right = result[currentIndex]
        let left = result[previousIndex]

        if left > right {
          result[currentIndex] = left
          result[previousIndex] = right
        } else {
          // Sorted already
          previousIndex = -1
        }

        // Drop back
        currentIndex -= 1
        previousIndex -= 1
      }
    }
    return result
  }

  func linearSearch(find: Element) -> Bool {
    for item in self {
      if item == find {
        return true
      }
    }

    // Cant find it
    return false
  }

  mutating func binarySearch(find: Element) -> Bool {
    var result = false
    let min = self.startIndex
    let max = self.endIndex - 1
    let mid = self.startIndex + (count / 2)

    // Make sure it's in bounds
    guard find <= self[max] && find >= self[min] else { return false }

    // Middle
    let middle = self[mid]
    print("Checking \(find) against \(middle)")

    if middle > find {
      // Need to go to the left side of the middle
      print("Moving left")
      let end = mid - 1
      var slice = Array(self[min...end])
      result = slice.binarySearch(find: find)
    } else if middle < find {
      // Need to go to the right side of the middle
      print("Moving right")
      let start = mid + 1
      var slice = Array(self[start...max])
      result = slice.binarySearch(find: find)
    } else {
      result = true
      print("Found element")
    }

    return result
  }
}

print(sorted.linearSearch(find: 11))
print(sorted.linearSearch(find: 5))

print(sorted.binarySearch(find: 11))
print(sorted.binarySearch(find: 5))

print("-----------")
print("Before")
print(unsorted)
print([6,5,3,1,8,7,2,4])
print("Insertion")
print(unsorted.insertionSort())
print("Bubble")
print(unsorted.bubbleSort())
print([6,5,3,1,8,7,2,4].bubbleSort())
print([6,5,3,1,8,7,2,4].selectionSort())

