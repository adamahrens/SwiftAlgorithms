//: [Previous](@previous)

import Foundation

class Node<T> : CustomStringConvertible {
  var data: T
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

    node += "\(data)"

    if let _ = next {
      node += "->"
    }

    return node
  }
}

protocol Chainable {
  associatedtype Element
  func enqueue(element: Element)
  func dequeue() -> Element?
  func isEmpty() -> Bool
  func peek() -> Element?
}

class Stack<T>: Chainable, CustomStringConvertible {
  private var top: Node<T>?
  private var size = 0

  var description: String {
    var result = "---- Top ----\n"
    var start = top

    while start != nil {
      if let data = start?.data {
        result += "\(data)\n"
      }

      start = start?.next
    }
    result += "--  Bottom --\n\n"
    return result
  }

  func enqueue(element: T) {
    let toEnqueue = Node(data: element)

    if size == 0 {
      top = toEnqueue
    } else {
      toEnqueue.next = top
      top?.previous = toEnqueue
      top = toEnqueue
    }

    size += 1
  }

  func dequeue() -> T? {
    guard let top = top else { return nil }
    let removed = top.data
    top.next?.previous = nil
    self.top = top.next
    size -= 1
    return removed
  }

  func isEmpty() -> Bool {
    return top == nil
  }

  func peek() -> T? {
    return top?.data
  }
}

class Queue<T>: Chainable, CustomStringConvertible {
  typealias Element = T

  private var front: Node<T>?
  private var back: Node<T>?
  private var size = 0

  var description: String {
    var result = "[Front] "
    var start = front
    var iterations = 0
    while start != nil {
      if let data = start?.data {
        let separator = iterations < (size - 1) ? ", " : ""
        result += "\(data)\(separator)"
      }

      iterations += 1
      start = start?.next
    }

    result += " [Back]"
    return result
  }

  func enqueue(element: Element) {
    let toEnqueue = Node(data: element)
    if size == 0 {
      front = toEnqueue
      back = toEnqueue
    } else {
      back?.next = toEnqueue
      toEnqueue.previous = back
      back = toEnqueue
    }

    size += 1
  }

  func dequeue() -> Element? {
    guard let front = front else { return nil }
    let removed = front.data
    front.next?.previous = nil
    self.front = front.next

    size -= 1
    return removed
  }

  func isEmpty() -> Bool {
    return front == nil
  }

  func peek() -> Element? {
    return front?.data
  }
}

let stack = Stack<Int>()
stack.enqueue(element: 5)
stack.enqueue(element: 4)
stack.enqueue(element: 3)
stack.enqueue(element: 2)
stack.enqueue(element: 1)
stack.enqueue(element: 0)
print(stack)
stack.dequeue()
print(stack)

let queue = Queue<String>()
queue.enqueue(element: "Adam")
queue.enqueue(element: "Bruce")
queue.enqueue(element: "Claudia")
queue.enqueue(element: "Doug")
queue.enqueue(element: "Emilie")
queue.enqueue(element: "Frank")
print(queue)
queue.dequeue()
print(queue)

