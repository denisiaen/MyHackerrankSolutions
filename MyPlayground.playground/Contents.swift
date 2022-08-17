import UIKit

var greeting = "Hello! Here are my solutions for Hackerank problems."

extension Array {
    func prettyPrint() {
        let arrToPrint = reduce("") { partialResult, item in
            partialResult + "\(item) "
        }
        
        print(arrToPrint)
    }
}

func countSort(arr: [[String]]) -> Void {
    // Write your code here
    let sorted = arr.sorted { $0[0] < $1[0] }
    let half = arr.count / 2
    let rightSplit = Array(sorted[half..<sorted.count])
    let leftSplit = Array(sorted[0..<half]).map { el -> [String] in
        var newAr = el
        newAr[1] = "-"
        return newAr
    }
    
    let final = leftSplit + rightSplit
    for array in final {
        print(array)
    }
}

countSort(arr: [["0", "ab"], ["6", "cd"], ["1", "ef"], ["6", "gh"], ["4", "ij"], ["0", "ab"], ["6", "cd"]])

func insertionSort2(n: Int, arr: [Int]) -> Void {
    // Write your code here
    var sortArray = arr

    for x in (0..<n) {
        var tmpPosition = x
        let current = sortArray[x]
        if x == 0 { continue }
        for y in (0..<x).reversed() {
            let prevItem = sortArray[y]
            if current <= prevItem {
                sortArray.remove(at: tmpPosition)
                sortArray.insert(current, at: y)
                tmpPosition = y
            }
        }
        sortArray.prettyPrint()
    }
}

insertionSort2(n: 7, arr: [3,4,7,5,6,2,1])

func insertionSort1(n: Int, arr: [Int]) -> Void {
    // Write your code here

    let aux = arr[n-1]
    var auxIndex = n - 1
    var sortArray = arr
    
    for x in (0..<n-1).reversed() {
        let current = sortArray[x]
        if aux < current {
            sortArray[auxIndex] = current
            sortArray.prettyPrint()
            auxIndex -= 1
            
            if x == 0 {
                sortArray[auxIndex] = aux
                sortArray.prettyPrint()
            }
        } else {
            sortArray[auxIndex] = aux
            sortArray.prettyPrint()
            break
        }
    }
}

insertionSort1(n: 10, arr: [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])

func introTutorial(V: Int, arr: [Int]) -> Int {
    // Write your code here
    let index = arr.firstIndex(of: V) ?? 0
    print(index)
    return index
}

introTutorial(V: 3, arr: [1,2,3])

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    let sort = arr.sorted(by: { $0 > $1 })
    let maxSum = Array(sort.prefix(4)).reduce(0, +)
    let minSum = Array(sort.suffix(4)).reduce(0, +)
    print("\(minSum) \(maxSum)")
}

miniMaxSum(arr: [1,2,3,4,5])

func staircase(n: Int) -> Void {
    // Write your code here
    var arr = [[String]]()
    
    for x in 0..<n {
        var line = [String]()
        for y in 0..<n {
            if (n-x) > y {
                line.append("#")
            } else {
                line.append(" ")
            }
        }
        arr.append(line)
    }
    
    
    for line in arr.reversed() {
        var s = ""
        for el in line.reversed() {
            s += el
        }
       
        print(s)
    }
}

staircase(n: 6)

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    var zeros = 0
    var pozitives = 0
    var negatives = 0
    
    for el in arr {
        if el == 0 {
            zeros += 1
        } else if el < 0 {
            negatives += 1
        } else {
            pozitives += 1
        }
    }
    
    let p = Double(pozitives) / Double(arr.count)
    let n = Double(negatives) / Double(arr.count)
    let z = Double(zeros) / Double(arr.count)
    
    print(p.rounded(precision: 6))
    print(n.rounded(precision: 6))
    print(z.rounded(precision: 6))
}

extension Double {
    func rounded(precision: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = precision
        formatter.minimumFractionDigits = precision
        
        return formatter.string(from: self as NSNumber) ?? ""
    }
}

plusMinus(arr: [1, -1, 0, 2, -1])

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    let count = arr.count
    let flatten = arr.flatMap{$0}.compactMap{$0}
    let leftSum = flatten.enumerated().reduce(0) { partialResult, item in
        let (offset, element) = item
        if offset % (count + 1) == 0 {
            return partialResult + element
        } else {
            return partialResult
        }
    }
    
    let rightSum = flatten.enumerated().dropFirst().dropLast().reduce(0) { partialResult, item in
        let (offset, element) = item
        if offset % (count - 1) == 0  {
            print(element)
            return partialResult + element
        } else {
            return partialResult
        }
    }
    
    return abs(leftSum - rightSum)
}

diagonalDifference(arr: [[1,2,3], [4,5,6], [7,8,9]])
