import UIKit

var str = "Hello, playground"

extension Array where Element: Comparable {
  func quicksort() -> Array<Element> {
    guard self.count > 1 else { return self }
    var arr = self
    return qSort(array: &arr, begin: 0, end: arr.count - 1)
  }

  private func qSort(array: inout Array<Element>, begin: Int, end: Int) -> Array<Element> {
    if begin < end {
      print("Begin Index = \(begin), End Index = \(end). Array Slice is \(array[begin...end])")
      let partitionIndex = part(array: &array, begin: begin, end: end)
      qSort(array: &array, begin: begin, end: partitionIndex - 1)
      qSort(array: &array, begin: partitionIndex + 1, end: end)
    }

    return array
  }

  private func part(array: inout Array<Element>, begin: Int, end: Int) -> Int {
    let random = Int.random(in: begin...end)
    let pivot = array[random]
    print("Pivot is \(pivot) at index \(random)")
    if random != begin {
      array.swapAt(random, begin)
      print("Swapped pivot to begin \(array)")
    }

    var left = begin + 1
    var right = end

    while left < right {
      print("left = \(left), right = \(right)")
      while array[left] < pivot {
        print("moving left")
        left += 1
      }

      while array[right] > pivot {
        print("moving right")
        right -= 1
      }

      if left < right {
        // swap
        let r = array[right]
        array[right] = array[left]
        array[left] = r
        print("Swapped \(array)")
      }
    }

    if right < left {
      let r = array[right]
      array[begin] = r
      array[right] = pivot
      print("Swapped pivot at begin index to old right")
      print("\(array)")
    }
    return right
  }
}

let unsorted1 = [7, 2, 1, 6, 8, 5, 3, 4]
let unsorted2 = [6, 3, 7, 1, 5, 9, 4, 2, 8]

print(unsorted1.quicksort())
print(unsorted2.quicksort())
