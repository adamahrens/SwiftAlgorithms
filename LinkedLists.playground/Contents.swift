import UIKit

protocol LinkedList {
  associatedtype Item
  func add(_ item: Item) -> Bool
  func add(_ item: Item, at: Int) -> Bool
  func clear()
  func contains(item: Item) -> Bool
  func toArray() -> [Item]
  func remove(item: Item)
  func remove(at: Int)
  func size() -> Int
}

final class SingleNode<E>: CustomStringConvertible {
  let value: E
  var next: SingleNode<E>?
  init(value: E) {
    self.value = value
  }

  var description: String {
    if let _ = next {
      return "\(value) -> "
    }

    return "\(value)"
  }
}

final class SingleLinkedList<E: Comparable>: LinkedList, CustomStringConvertible {
  private var head: SingleNode<E>?
  private var tail: SingleNode<E>?
  private var count = 0

  var description: String {
    let items = nodes()
    return items.reduce("") {
      return $0 + "\($1)"
    }
  }

  func add(_ item: E) -> Bool {
    let node = SingleNode(value: item)

    if head == nil && tail == nil {
      // Empty list new item
      head = node
      tail = node
    } else if let tail = tail {
      // Add to the end of the list
      tail.next = node
      self.tail = node
    }

    count += 1
    return true
  }

  func add(_ item: E, at: Int) -> Bool {
    guard at < size() else { return false }
    let node = SingleNode(value: item)
    if at == 0 {
      // Adding to head
      node.next = head
      head = node
    } else if at == size() {
      // Adding to tail
      tail?.next = node
      node.next = tail
    } else {
      // Iterate to the position
      var start = head
      var runner = head?.next
      var index = 0
      while index < (at - 1) {
        index += 1
        start = start?.next
        runner = runner?.next
      }

      start?.next = node
      node.next = runner
    }

    return true
  }

  func clear() {
    head = nil
    tail = nil
    count = 0
  }

  func contains(item: E) -> Bool {
    let items = toArray()
    return items.contains { $0 == item }
  }

  func toArray() -> [E] {
    let items = nodes()
    return items.map { $0.value }
  }

  func remove(item: E) {

  }

  func remove(at: Int) {

  }

  func size() -> Int {
    return count
  }

  private func nodes() -> [SingleNode<E>] {
    var nodes = [SingleNode<E>]()
    var start = head
    while start != nil {
      nodes.append(start!)
      start = start?.next
    }

    return nodes
  }
}

let linkedList = SingleLinkedList<Int>()
print(linkedList)

linkedList.add(1)
print(linkedList)
assert(linkedList.size() == 1)

linkedList.add(2)
print(linkedList)
assert(linkedList.size() == 2)

linkedList.add(3)
print(linkedList)
assert(linkedList.size() == 3)

print(linkedList.toArray())

linkedList.add(-2, at: 1)
print(linkedList)

linkedList.add(-2, at: 3)
print(linkedList)

linkedList.clear()
print(linkedList)
assert(linkedList.size() == 0)
