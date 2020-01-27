import UIKit

var str = "Hello, playground"

final class Node<E> {
  let value: E
  var next: Node<E>?

  init(value: E) {
    self.value = value
  }
}

protocol Nameable {
  var firstName: String { get }
  var lastName: String { get }
}

extension Nameable {
  var fullName : String {
    return "\(firstName) \(lastName)"
  }
}

struct Person: Equatable, Nameable {
  let firstName: String
  let lastName: String
}

struct Student: Equatable, Nameable {
  let firstName: String
  let lastName: String
  let grade: String
}

let head = Node<Person>(value: Person(firstName: "Leroy", lastName: "Jenkins"))
let other = Node<Student>(value: Student(firstName: "Leroy", lastName: "Jenkins", grade: "12"))
