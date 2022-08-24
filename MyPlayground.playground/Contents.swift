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

func countSortFull(arr: [[String]]) -> Void {
    // Write your code here
    let half = arr.count / 2
    var arrayOutput : [[String]] = .init(repeating: [], count: 100)
    
    for (index, subArray) in arr.enumerated() {
        let key = Int(subArray[0]) ?? 0
        if index < half {
            arrayOutput[key].append("- ")
        } else {
            arrayOutput[key].append(contentsOf: [subArray[1], " "])
        }
    }
        
    var output = ""
    for array in arrayOutput {
        output += array.joined()
    }
    print(output)
}

countSortFull(arr: [["0", "ab"], ["6", "cd"], ["0", "ef"], ["6", "gh"], ["4", "ij"], ["0", "ab"], ["6", "cd"], ["0", "ef"], ["6", "gh"], ["0", "ij"], ["4", "that"], ["3", "be"], ["0", "to"], ["1", "be"], ["5", "question"], ["1", "or"], ["2", "not"], ["4", "is"], ["2", "to"], ["4", "the"]])

countSortFull(arr: [["0", "ab"], ["6", "cd"], ["1", "ef"], ["6", "gh"], ["4", "ij"], ["0", "ab"], ["6", "cd"]])


func countingSort2(arr: [Int]) -> [Int] {
    // Write your code here
    var result = [Int](repeating: 0, count: 100)
    var sorted = [Int]()
    
    for item in arr {
        result[item] += 1
    }
        
    for (index, item) in result.enumerated() {
        if item != 0 {
            for _ in 0..<item {
                sorted.append(index)
            }
        }
    }
   
    return sorted
}

countingSort2(arr: [63, 25, 73 ,1 ,98 ,73 ,56 ,84, 86, 57 ,16 ,83 ,8 ,25, 81 ,56, 9, 53, 98, 67, 99, 12 ,83 ,89, 80 ,91, 39, 86, 76, 85 ,74, 39, 25, 90, 59, 10 ,94, 32, 44 ,3 ,89 ,30 ,27 ,79 ,46 ,96, 27 ,32, 18 ,21 ,92 ,69, 81 ,40 ,40 ,34 ,68 ,78 ,24, 87 ,42, 69 ,23 ,41, 78, 22, 6 ,90 ,99, 89 ,50 ,30, 20 ,1 ,43, 3, 70, 95, 33 ,46 ,44, 9 ,69 ,48 ,33, 60, 65 ,16, 82, 67, 61 ,32, 21, 79, 75 ,75 ,13 ,87, 70, 33])

countingSort2(arr: [63, 54, 17, 78, 43, 70, 32, 97, 16, 94, 74, 18, 60, 61, 35, 83, 13, 56, 75, 52, 70, 12, 24 ,37 ,17, 0 ,16, 64, 34 ,81 ,82 ,24, 69 ,2, 30, 61 ,83 ,37, 97, 16 ,70 ,53 ,0 ,61, 12 ,17 ,97, 67, 33, 30, 49 ,70 ,11, 40 ,67 ,94 ,84 ,60 ,35 ,58 ,19 ,81, 16 ,14 ,68, 46 ,42, 81, 75 ,87, 13, 84, 33 ,34 ,14, 96, 7 ,59 ,17 ,98 ,79, 47 ,71 ,75, 8, 27 ,73, 66, 64 ,12 ,29, 35 ,80, 78, 80 ,6 ,5 ,24 ,49, 82])

func countingSort(arr: [Int]) -> [Int] {
    // Write your code here
    var output = [Int](repeating: 0, count: 100)
    
    for item in arr {
        output[item] += 1
    }
    
    return output
}

countingSort(arr: [1, 1, 3, 2, 1])
countingSort(arr: [0, 1])
countingSort(arr: [63, 54, 17, 78, 43, 70, 32, 97, 16, 94, 74, 18, 60, 61, 35, 83, 13, 56, 75, 52, 70, 12, 24 ,37 ,17, 0 ,16, 64, 34 ,81 ,82 ,24, 69 ,2, 30, 61 ,83 ,37, 97, 16 ,70 ,53 ,0 ,61, 12 ,17 ,97, 67, 33, 30, 49 ,70 ,11, 40 ,67 ,94 ,84 ,60 ,35 ,58 ,19 ,81, 16 ,14 ,68, 46 ,42, 81, 75 ,87, 13, 84, 33 ,34 ,14, 96, 7 ,59 ,17 ,98 ,79, 47 ,71 ,75, 8, 27 ,73, 66, 64 ,12 ,29, 35 ,80, 78, 80 ,6 ,5 ,24 ,49, 82])

func quickSort(arr: [Int]) -> [Int] {
    // Write your code here
    let pivot = arr[0]
    var left = [Int]()
    var equal = [Int]()
    var right = [Int]()
    
    for input in arr {
        if input < pivot {
            left.append(input)
        } else if input > pivot {
            right.append(input)
        } else {
            equal.append(input)
        }
    }
    
    return (left + equal + right)
}

quickSort(arr: [4, 5, 3, 7, 2])

func runningTime(arr: [Int]) -> Int {
    // Write your code here
    var array = arr
    var runningTime = 0
    var j = 0
    var value = 0
    
    for i in (1..<array.count) {
        value = array[i]
        j = i - 1
        while j>=0 && value < array[j] {
            array[j+1] = array[j]
            j = j - 1
            runningTime += 1
        }
        array[j+1] = value
        array.prettyPrint()
    }
    
    return runningTime
}

runningTime(arr: [2, 1, 3, 1, 2])

func countSortMid(arr: [[String]]) -> Void {
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

countSortMid(arr: [["0", "ab"], ["6", "cd"], ["1", "ef"], ["6", "gh"], ["4", "ij"], ["0", "ab"], ["6", "cd"]])

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
