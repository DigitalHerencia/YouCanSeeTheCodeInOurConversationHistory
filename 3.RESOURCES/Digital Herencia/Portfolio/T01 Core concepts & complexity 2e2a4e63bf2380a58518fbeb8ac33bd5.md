# T01 Core concepts & complexity

Meetings: Daily Standup @January 1, 2026  (../Meetings/Daily%20Standup%20@January%201,%202026%202dba4e63bf2381daa807d8150684f1cb.md)
Parent item: RES-M1-P1.1-A&S - Arrays & Strings  (RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202e2a4e63bf2380b2abcde7fd67f71a5a.md)
Projects: RES-M1-P1.1-A&S - Arrays & Strings  (../Projects/RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202dba4e63bf238078b705e88338208ff2.md)
Status: Not started
Tasks: T01 Core concepts & complexity (../Tasks/T01%20Core%20concepts%20&%20complexity%202dba4e63bf238078bfcbd06cbd73c125.md)
Teams: Research Team (../Teams/Research%20Team%202d5a4e63bf2380fdbf70f6d679ba0d14.md)

# **Overview**

This module covers fundamental data structures—**Arrays** and **Strings**—their operations, time/space complexity, and common patterns used in technical interviews and production systems.

---

## **Arrays**

### **Definition**

An **array** is a contiguous block of memory storing elements of the same type, accessible via zero-based indices.

```
[10, 20, 30, 40, 50]
  0   1   2   3   4

```

### **Properties**

- **Fixed size** (in most languages; dynamic arrays like Python lists auto-resize)
- **O(1) random access** via index
- **Cache-friendly** due to memory locality

### **Core Operations & Complexity**

| **Operation** | **Time Complexity** | **Space Complexity** | **Notes** |
| --- | --- | --- | --- |
| **Access** | O(1) | O(1) | Direct index lookup |
| **Search (unsorted)** | O(n) | O(1) | Linear scan |
| **Search (sorted)** | O(log n) | O(1) | Binary search |
| **Insert (end)** | O(1)* | O(1) | *Amortized for dynamic arrays |
| **Insert (middle)** | O(n) | O(1) | Requires shifting elements |
| **Delete (end)** | O(1) | O(1) | Simple pop |
| **Delete (middle)** | O(n) | O(1) | Requires shifting elements |
| **Traverse** | O(n) | O(1) | Iterate through all elements |

### **Common Patterns**

### **1. Two Pointers**

**Use case:** Pair finding, palindrome checking, partitioning

```python
def two_sum_sorted(arr, target):
    left, right = 0, len(arr) - 1
    while left < right:
        current = arr[left] + arr[right]
        if current == target:
            return [left, right]
        elif current < target:
            left += 1
        else:
            right -= 1
    return None

```

**Complexity:** O(n) time, O(1) space

### **2. Sliding Window**

**Use case:** Subarray problems (max sum, longest substring)

```python
def max_sum_subarray(arr, k):
    window_sum = sum(arr[:k])
    max_sum = window_sum
    for i in range(k, len(arr)):
        window_sum = window_sum - arr[i-k] + arr[i]
        max_sum = max(max_sum, window_sum)
    return max_sum

```

**Complexity:** O(n) time, O(1) space

### **3. Prefix Sum**

**Use case:** Range sum queries

```python
def build_prefix_sum(arr):
    prefix = [0] * (len(arr) + 1)
    for i in range(len(arr)):
        prefix[i+1] = prefix[i] + arr[i]
    return prefix

def range_sum(prefix, left, right):
    return prefix[right+1] - prefix[left]

```

**Complexity:** O(n) build, O(1) query

### **4. Kadane's Algorithm**

**Use case:** Maximum subarray sum

```python
def max_subarray_sum(arr):
    max_current = max_global = arr[0]
    for i in range(1, len(arr)):
        max_current = max(arr[i], max_current + arr[i])
        max_global = max(max_global, max_current)
    return max_global

```

**Complexity:** O(n) time, O(1) space

---

## **Strings**

### **Definition**

A **string** is a sequence of characters. In most languages, strings are **immutable** (Python, Java) or stored as character arrays (C/C++).

```
"hello"
 01234

```

### **Properties**

- **Immutable** in Python/Java (operations create new strings)
- **Character array** representation (mutable in C/C++)
- **UTF-8/Unicode** encoding considerations

### **Core Operations & Complexity**

| **Operation** | **Time Complexity** | **Space Complexity** | **Notes** |
| --- | --- | --- | --- |
| **Access** | O(1) | O(1) | Index-based access |
| **Search (substring)** | O(n*m) | O(1) | Naive; O(n+m) with KMP |
| **Concatenation** | O(n+m) | O(n+m) | Creates new string |
| **Substring** | O(k) | O(k) | k = length of substring |
| **Comparison** | O(n) | O(1) | Lexicographic |
| **Reverse** | O(n) | O(n) | In-place if mutable |
| **Split** | O(n) | O(n) | Creates array of substrings |

### **Common Patterns**

### **1. Palindrome Check**

**Use case:** Two-pointer validation

```python
def is_palindrome(s):
    left, right = 0, len(s) - 1
    while left < right:
        if s[left] != s[right]:
            return False
        left += 1
        right -= 1
    return True

```

**Complexity:** O(n) time, O(1) space

### **2. Anagram Detection**

**Use case:** Character frequency matching

```python
from collections import Counter

def is_anagram(s1, s2):
    return Counter(s1) == Counter(s2)

```

**Complexity:** O(n) time, O(k) space (k = unique chars)

### **3. Pattern Matching (KMP)**

**Use case:** Efficient substring search

```python
def kmp_search(text, pattern):
    def build_lps(pattern):
        lps = [0] * len(pattern)
        length = 0
        i = 1
        while i < len(pattern):
            if pattern[i] == pattern[length]:
                length += 1
                lps[i] = length
                i += 1
            elif length != 0:
                length = lps[length - 1]
            else:
                lps[i] = 0
                i += 1
        return lps

    lps = build_lps(pattern)
    i = j = 0
    while i < len(text):
        if text[i] == pattern[j]:
            i += 1
            j += 1
        if j == len(pattern):
            return i - j  # Match found
        elif i < len(text) and text[i] != pattern[j]:
            if j != 0:
                j = lps[j - 1]
            else:
                i += 1
    return -1  # No match

```

**Complexity:** O(n+m) time, O(m) space

### **4. Longest Common Prefix**

**Use case:** String grouping/trie optimization

```python
def longest_common_prefix(strs):
    if not strs:
        return ""
    prefix = strs[0]
    for s in strs[1:]:
        while not s.startswith(prefix):
            prefix = prefix[:-1]
            if not prefix:
                return ""
    return prefix

```

**Complexity:** O(n*m) time, O(1) space

---

## **Space Complexity Deep Dive**

### **Auxiliary Space vs. Total Space**

- **Auxiliary Space:** Extra space used by algorithm (excluding input)
- **Total Space:** Input + Auxiliary

Example:

```python
def reverse_array_in_place(arr):
    left, right = 0, len(arr) - 1
    while left < right:
        arr[left], arr[right] = arr[right], arr[left]
        left += 1
        right -= 1
    return arr

```

- **Auxiliary Space:** O(1) (only two pointers)
- **Total Space:** O(n) (input array)

### **Immutable String Overhead**

```python
# Python strings are immutable
s = "hello"
s += " world"  # Creates new string: O(n) space

```

**Solution:** Use `StringBuilder` (Java) or `list.join()` (Python)

```python
parts = []
for i in range(n):
    parts.append(str(i))
result = ''.join(parts)  # O(n) final concatenation

```

---

## **Optimization Techniques**

### **1. In-Place Modifications**

When possible, modify arrays in-place to achieve O(1) space:

```python
def remove_duplicates_sorted(arr):
    if not arr:
        return 0
    write = 1
    for read in range(1, len(arr)):
        if arr[read] != arr[read-1]:
            arr[write] = arr[read]
            write += 1
    return write

```

### **2. Hash Table Trade-offs**

Use O(n) space to achieve O(1) lookups:

```python
def two_sum(arr, target):
    seen = {}
    for i, num in enumerate(arr):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return None

```

### **3. Sorting Optimization**

Sort arrays to enable efficient two-pointer/binary search:

```python
def three_sum(arr):
    arr.sort()  # O(n log n)
    result = []
    for i in range(len(arr) - 2):
        if i > 0 and arr[i] == arr[i-1]:
            continue
        left, right = i + 1, len(arr) - 1
        while left < right:
            total = arr[i] + arr[left] + arr[right]
            if total == 0:
                result.append([arr[i], arr[left], arr[right]])
                left += 1
                right -= 1
                while left < right and arr[left] == arr[left-1]:
                    left += 1
            elif total < 0:
                left += 1
            else:
                right -= 1
    return result

```

**Complexity:** O(n²) time after O(n log n) sort

---

## **Common Pitfalls**

### **1. Off-by-One Errors**

```python
# Wrong: Misses last element
for i in range(len(arr) - 1):
    print(arr[i])

# Correct
for i in range(len(arr)):
    print(arr[i])

```

### **2. Unintended Mutations**

```python
# Wrong: Modifies original
def process(arr):
    arr.sort()
    return arr

# Correct: Work on copy
def process(arr):
    return sorted(arr)

```

### **3. String Concatenation in Loops**

```python
# Wrong: O(n²) due to immutability
result = ""
for i in range(n):
    result += str(i)

# Correct: O(n)
result = ''.join(str(i) for i in range(n))

```

---

## **Complexity Cheat Sheet**

| **Problem Type** | **Time** | **Space** | **Technique** |
| --- | --- | --- | --- |
| Pair sum (sorted) | O(n) | O(1) | Two pointers |
| Subarray sum | O(n) | O(1) | Sliding window |
| Longest substring | O(n) | O(k) | Sliding window + hash |
| Anagram check | O(n) | O(k) | Hash map |
| Palindrome | O(n) | O(1) | Two pointers |
| Substring search | O(n+m) | O(m) | KMP |
| Merge sorted arrays | O(n+m) | O(n+m) | Two pointers |

---

## **Practice Problems**

### **Arrays**

1. Two Sum (LeetCode #1)
2. Best Time to Buy/Sell Stock (LeetCode #121)
3. Maximum Subarray (LeetCode #53)
4. Product of Array Except Self (LeetCode #238)
5. Container With Most Water (LeetCode #11)

### **Strings**

1. Valid Anagram (LeetCode #242)
2. Longest Substring Without Repeating Characters (LeetCode #3)
3. Valid Palindrome (LeetCode #125)
4. Group Anagrams (LeetCode #49)
5. Longest Palindromic Substring (LeetCode #5)

---

## **Key Takeaways**

✅ **Arrays:** Fixed-size, O(1) access, efficient iteration

✅ **Strings:** Immutable in most languages, character array semantics

✅ **Two Pointers:** O(n) time, O(1) space for many problems

✅ **Sliding Window:** Optimal for subarray/substring problems

✅ **Hash Maps:** Trade space for time (O(n) space → O(1) lookup)

✅ **In-Place:** Modify arrays directly when possible

✅ **Sorting:** Enable binary search and two-pointer techniques

---

**Related Topics:** Hash Tables, Binary Search, Dynamic Programming

**Difficulty:** Fundamental → Intermediate

**Estimated Study Time:** 4-6 hours