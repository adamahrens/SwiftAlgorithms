//: [Previous](@previous)

import Foundation

public class Tree <T: Comparable> {

  var data: T
  var left: Tree?
  var right: Tree?

  init(data: T) {
    self.data = data
  }
}

public class BinarySearchTree<T: Comparable> {

  private var root: Tree<T>?

  func append(element: T) {
    guard let current = root else {
      self.root = Tree(data: element)
      return
    }

    recursiveAdd(start: current, toAdd: element)
  }

  func contains(element: T) -> Bool {
    guard let start = root else { return false }
    return recursiveFind(start: start, toFind: element)
  }

  private func recursiveFind(start: Tree<T>, toFind: T) -> Bool {
    if start.data == toFind {
      return true
    }

    if toFind < start.data {
      if let left = start.left {
        return recursiveFind(start: left, toFind: toFind)
      }
    }

    if toFind > start.data {
      if let right = start.right {
        return recursiveFind(start: right, toFind: toFind)
      }
    }

    return false
  }

  private func recursiveAdd(start: Tree<T>, toAdd: T) {
    if toAdd < start.data {
      if let left = start.left {
        recursiveAdd(start: left, toAdd: toAdd)
      } else {
        let tree = Tree(data: toAdd)
        start.left = tree
      }
    } else if toAdd >= start.data {
      if let right = start.right {
        recursiveAdd(start: right, toAdd: toAdd)
      } else {
        let tree = Tree(data: toAdd)
        start.right = tree
      }
    }
  }
}

let numbers = [8, 2, 10, 9, 11, 1, 7]

let bst = BinarySearchTree<Int>()
bst.append(element: 8)
bst.append(element: 2)
bst.append(element: 10)
bst.append(element: 9)
bst.append(element: 11)
bst.append(element: 1)
bst.append(element: 7)

bst.contains(element: 20)
bst.contains(element: 7)
bst.contains(element: 1)
bst.contains(element: 5)
bst.contains(element: 8)

//: [Next](@next)
