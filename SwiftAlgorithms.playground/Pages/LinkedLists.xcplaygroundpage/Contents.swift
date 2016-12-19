//: [Previous](@previous)

import Foundation

protocol List: CustomStringConvertible {
  associatedtype Element

  func add(element: Element) -> Bool
  func clear()
  func isEmpty() -> Bool
  func size() -> Int
  func contains(element: Element) -> Bool
}

class SingleLinkedList<T: Comparable> : List {

  private var front: Node<T>?
  private var currentSize = 0

  var description: String {
    var result = ""
    var current = front
    while current != nil {
      if let node = current {
        result += "\(node)"
      }

      current = current?.next
    }

    return result
  }

  func add(element: T) -> Bool {
    if currentSize == 0 {
      front = Node(data: element)
    } else {
      let addedNode = Node(data: element)
      var current = front

      // Iterate to the end O(n) for adding
      while current?.next != nil {
        current = current?.next
      }

      current?.next = addedNode
    }

    currentSize += 1
    return true
  }

  func clear() {
    front = nil
    currentSize = 0
  }

  func isEmpty() -> Bool {
    return size() == 0
  }

  func size() -> Int {
    return currentSize
  }

  func contains(element: T) -> Bool {
    var currentNode = front
    while currentNode != nil {
      if let data = currentNode?.data, data == element {
        return true
      }

      currentNode = currentNode?.next
    }

    return false
  }
}

class DoubleLinkedList<T: Comparable> : List {

  private var front: Node<T>?
  private var end: Node<T>?
  private var currentSize = 0

  var description: String {
    var result = ""
    var current = front
    while current != nil {
      if let node = current {
        result += "\(node)"
      }

      current = current?.next
    }

    return result
  }

  func add(element: T) -> Bool {
    if currentSize == 0 {
      front = Node(data: element)
      end = front
    } else {
      let addedNode = Node(data: element)
      end?.next = addedNode
      addedNode.previous = end
      end = addedNode
    }

    currentSize += 1
    return true
  }

  func clear() {
    front = nil
    end = nil
    currentSize = 0
  }

  func isEmpty() -> Bool {
    return size() == 0
  }

  func size() -> Int {
    return currentSize
  }

  func contains(element: T) -> Bool {
    var currentNode = front
    while currentNode != nil {
      if let data = currentNode?.data, data == element {
        return true
      }

      currentNode = currentNode?.next
    }
    
    return false
  }
}

class Node<T: Comparable> : CustomStringConvertible {
  var data: T?
  var next: Node?
  var previous: Node?

  init(data: T) {
    self.data = data
  }

  var description: String {
    var node = ""

    if let _ = previous {
      node += "<-"
    }

    if let data = data {
      node += "\(data)"
    }

    if let _ = next {
      node += "->"
    }

    return node
  }
}

let linkedList = SingleLinkedList<String>()
linkedList.add(element: "First")
print(linkedList)
linkedList.add(element: "Second")
print(linkedList)
linkedList.add(element: "Third")
print(linkedList)
linkedList.contains(element: "Second")
linkedList.contains(element: "Fourth")
linkedList.clear()
linkedList.isEmpty()
print(linkedList)

let doubledLinkedList = DoubleLinkedList<String>()
doubledLinkedList.add(element: "1")
print(doubledLinkedList)
doubledLinkedList.add(element: "2")
print(doubledLinkedList)
doubledLinkedList.add(element: "3")
print(doubledLinkedList)