//: [Previous](@previous)

import Foundation

public class Edge<T: Comparable> {

  let weight: Int
  let neighbor: Vertex<T>

  init(neighbor: Vertex<T>, weight: Int) {
    self.weight = weight
    self.neighbor = neighbor
  }
}

public class Vertex<T: Comparable> {
  private let key: T
  private var neighbors = [Edge<T>]()

  init(data: T) {
    key = data
  }

  func addNeighbor(edge: Edge<T>) {
    neighbors.append(edge)
  }

  func myNeighbors() -> [Edge<T>] {
    return neighbors
  }
}

public class Path <T: Comparable> {
  var total = 0
  var previous: Path?
  let destination: Vertex<T>

  init(destination: Vertex<T>) {
    self.destination = destination
  }
}

public class DirectedGraph<T: Comparable> {

  private var vertices = [Vertex<T>]()

  func addVertex(element: T) -> Vertex<T> {
    let vertex = Vertex(data: element)
    vertices.append(vertex)
    return vertex
  }

  func addEdge(source: Vertex<T>, destination: Vertex<T>, weight: Int) {
    let edge = Edge(neighbor: destination, weight: weight)
    source.addNeighbor(edge: edge)
  }

  func shortestPath(source: Vertex<T>, destination: Vertex<T>) -> Path<T>? {
    var toVisit = [Path<T>]()
    var finalPaths = [Path<T>]()

    for neighbor in source.myNeighbors() {
      let path = Path(destination: neighbor.neighbor)
      path.total = neighbor.weight
      toVisit.append(path)
    }

    while toVisit.count > 0 {
      var pathIndex = 0
      var bestPath: Path<T>?

      for index in 0..<toVisit.count {
        let path = toVisit[index]

        if bestPath == nil {
          bestPath = path
          pathIndex = index
        } else if (path.total < bestPath!.total) {
          bestPath = path
          pathIndex = index
        }
      }

      if let best = bestPath {
        for neighbor in best.destination.myNeighbors() {
          let newPath = Path(destination: neighbor.neighbor)
          newPath.previous = best
          newPath.total = best.total + neighbor.weight
          toVisit.append(newPath)
        }

        finalPaths.append(best)
      }

      toVisit.remove(at: pathIndex)
    }

    print(finalPaths)
    return finalPaths.last
  }
}

let graph = DirectedGraph<String>()

let a = graph.addVertex(element: "A")
let b = graph.addVertex(element: "B")
let c = graph.addVertex(element: "C")
let d = graph.addVertex(element: "D")
let e = graph.addVertex(element: "E")

//    D -- 8 --> E
//  /   \
//  |    \
//  4     \
//  |       5
//  |         \
//  A  -- 1 --> B -- 2 --> C
graph.addEdge(source: a, destination: b, weight: 1)
graph.addEdge(source: a, destination: d, weight: 4)
graph.addEdge(source: b, destination: c, weight: 2)
graph.addEdge(source: b, destination: d, weight: 5)
graph.addEdge(source: d, destination: e, weight: 8)

// Shorted Path is directly to D instead of going through B
let aToD = graph.shortestPath(source: a, destination: d)

// A -> D -> E (12) vs A -> B -> D -> E (14)
let aToE = graph.shortestPath(source: a, destination: e)
print(aToE?.total ?? "Blah Blah")
//: [Next](@next)
