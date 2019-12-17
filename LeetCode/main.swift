//
//  main.swift
//  LeetCode
//
//  Created by Chris Sonet on 11/7/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
//-----------------------------------
//Walmart
//-----------------------------------
/*
func pathsFor(height: Int, width: Int) -> Int {
    
    //3d array of height by width
    var result = Array(repeating: Array(repeating: 0, count: width + 1), count: height + 1)
    
    for i in 0..<height {
        for j in 0..<width {
           result[i + 1][j + 1] = max(result[i+1][j] + result[i][j + 1], 1)
        }
    }
    
    return result[height][width]
}


//AABAACAADAABAABA
//AABA

func indicesOf(_ str: String, pattern: String) -> [Int] {
    
    
    var ans = [Int]()
    let myString = Array(str)
    
    
    for index in 0..<str.count - (pattern.count - 1) {
        let upper = index + pattern.count
        let sample = String(myString[index..<upper])
        if sample == pattern {
            ans.append(index)
        }
    }
    
    return ans
}


let IN1 = indicesOf("AABAACAADAABAABA", pattern: "AA") //0, 9, 12
print(IN1)*/
//-----------------------------------

/*
                     4
                    / \
                   1   6
                  /\   /\
                 0  2  5 7
                     \    \
                      3    8
 
                     30
                    /   \
                   36    21
                  /\     /\
                36  35  26 15
                     \      \
                     33      8
*/
/*
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var valuesDict: [Int:Int] = [:]
    var total: Int = 0
    var subTotal: Int = 0
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard var node = root else { return nil }
        collect(node)
        updateTree(&node)
        return node
    }
    
    func collect(_ node: TreeNode?) {
        //if we reached the end of a branch turn around
        guard let n = node else { return }
        //go all the way down the left branch
        collect(n.left)
        //record the nodes value and previous value
        valuesDict[n.val] = subTotal
        subTotal += n.val
        //add to the total
        total += n.val
        //go down one in the right branch
        collect(n.right)
    }
    
    func updateTree( _ node: inout TreeNode) {
        if node.left != nil {
            updateTree(&node.left!)
        }
        
        node.val = total - valuesDict[node.val]!
        if node.right != nil {
            updateTree(&node.right!)
        }
    }
}

var theTree = TreeNode(4)
theTree.left = TreeNode(1)
theTree.left?.left = TreeNode(0)
theTree.left?.right = TreeNode(2)
theTree.left?.right?.right = TreeNode(3)

theTree.right = TreeNode(6)
theTree.right?.left = TreeNode(5)
theTree.right?.right = TreeNode(7)
theTree.right?.right?.right = TreeNode(8)

var sol = Solution()
var result = sol.bstToGst(theTree)
*/

/*
 Given a valid (IPv4) IP address, return a defanged version of that IP address.
 
 A defanged IP address replaces every period "." with "[.]".
 
 Example 1:
 
 Input: address = "1.1.1.1"
 Output: "1[.]1[.]1[.]1"
*/
/*
func defangIPaddr(_ address: String) -> String {
    return address.replacingOccurrences(of: ".", with: "[.]")
}*/

/*
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 Example 1:
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
*/
/*func numJewelsInStones(_ J: String, _ S: String) -> Int {
    
    //---------------
    //98%
    //---------------
    var count = 0
    
    for s in S {
        if J.contains(s) {
            count += 1
        }
    }
    
    //---------------
    //75%
    //---------------
    /*var countChar: [Character: Int] = [:]
    var count = 0
    
    if S == "" {
        return 0
    }
    
    for s in S {
        if let val = countChar[s] 	{
            countChar[s] = val + 1
        }
        else {
            countChar[s] = 1
        }
    }
    
    for j in J {
        if let val = countChar[j] {
            count += val
        }
    }*/
    
    //---------------
    //75%
    //---------------
    /*let j = Set(J.map { $0 })
    var count = 0
    for s in S {
        if j.contains(s) {
            count += 1
        }
    }*/
    
    //---------------
    //75%
    //---------------
    /*var count = 0
    for s in S {
        for j in J {
            if s == j {
                count += 1
            }
        }
    }*/
    return count
}

print(numJewelsInStones("aA", "aAAbbbb"))*/

//filter is honestly less lines and probably the fastests bc apple made it

/*func removeLetters(sentence: String, removedChar: String) -> String {
    //resulting string
    var result = ""
    
    //loop through the sentence to find valid characters
    for i in sentence {
        
        //if we found a valid character place it in our new string
        if !removedChar.contains(i) {
            //append the char to our string
            result.append(i)
        }
    }
    //return the new string
    return result
}

let arrayOfStrings = line.components(separatedBy: ",")

let result = removeLetters(sentence: arrayOfStrings[0], removedChar: arrayOfStrings[1].trimmingCharacters(in: .whitespacesAndNewlines))
    
    //i think this will work bc i want to only trim before and after if they put a space mid string thats fine
    
print(result)*/

//whats the func to remove white space instead of having to look for ", " <-- should just be ","


/*
let line = "how are you, abc"
//this line is the problem
//it doesnt like the components func
let arrayOfStrings = line.split(separator: ",")

//should we just block " " from being removed?


//split only allows for char so cant give it a string which means the " " gets removed from the sentence
//
let sentence = arrayOfStrings[0]
let removedChar = arrayOfStrings[1]

//resulting string
var result = ""

//loop through the sentence to find valid characters
for i in sentence {
    
    //if we found a valid character place it in our new string
    if !removedChar.contains(i) && i != " " {
        //append the char to our string
        result.append(i)
    }
}

print(result)

//lemme throuvh it back into a func

//idk what its crashing doe im not even using that whitespace things anymore and it run in here fine
//its a func im using thats crashing it but idk which one maybe componenets?
*/

//gonna need to do this also without any functions bc it doesnt regonize them

/*while let line: String = readLine() {
    let depth = Int(line)
    //find the depth of the triangle based on user input
    var result = [[Int]]()
    //instead of spending time deconstructing the matrix
    var str = ""
    
    //if the depth give was 0 our job is done
    if (depth == 0) {
        print("")
    }
    
    //any depth great than 0 has be looped through
    for i in 0..<depth! {
        
        //each row will be created then appended later
        var currentResults = [Int]()
        
        //
        for j in 0...i {
            //if this isnt the first row
            //  and j isnt the first or last element
            //  we need to do some calculation
            if (i > 1 && j > 0 && j < i) {
                //look at the previous row and its two values that
                //  share the same index and the index prior will be
                //  added together for the new value
                let value = result[i-1][j] + result[i-1][j-1]
                currentResults.append(value)
                str += "\(value) "
            }
                //otherwise its a 1
            else {
                currentResults.append(1)
                str += "1 "
            }
        }
        //put the row into the grid
        result.append(currentResults)
    }
    
    //print out the str with the last " " removed
    str.removeLast()
    print(str)
}*/

func toLowerCase(_ str: String) -> String {
    return str.lowercased()
}
