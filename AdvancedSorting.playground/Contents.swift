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
      let partitionIndex = part(array: &array, begin: begin, end: end)
      print("after partition \(array[begin...end])")
      qSort(array: &array, begin: begin, end: partitionIndex - 1)
      qSort(array: &array, begin: partitionIndex + 1, end: end)
    }

    return array
  }

  private func part(array: inout Array<Element>, begin: Int, end: Int) -> Int {

    guard end - begin > 1 else {
      if array[begin] > array[end] {
        let temp = array[end]
        array[end] = array[begin]
        array[begin] = temp
      }

      return end
    }

    let random = Int.random(in: begin...end)
    let pivot = array[random]
    if random != begin {
      array.swapAt(random, begin)
    }

    var left = begin + 1
    var right = end

    while left < right {
      while array[left] < pivot {
        left += 1
      }

      while array[right] > pivot {
        right -= 1
      }

      if left < right {
        let temp =  array[right]
        array[right] = array[left]
        array[left] = temp
      }
    }

    // Did left and right cross
    if right < left {
      let temp =  array[right]
      array[right] = array[begin]
      array[begin] = temp
    }

    return right
  }
}

let unsorted1 = [7, 2, 1, 6, 8, 5, 3, 4]
let unsorted2 = [6, 3, 7, 1, 5, 9, 4, 2, 8]

print(unsorted1.quicksort())
print(unsorted2.quicksort())
