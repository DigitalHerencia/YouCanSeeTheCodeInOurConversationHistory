# TO2 Sliding window patterns

Meetings: Daily Standup @January 2, 2026  (../Meetings/Daily%20Standup%20@January%202,%202026%202dca4e63bf23818cbda4cd99d90eaba6.md)
Parent item: RES-M1-P1.1-A&S - Arrays & Strings  (RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202e2a4e63bf2380b2abcde7fd67f71a5a.md)
Projects: RES-M1-P1.1-A&S - Arrays & Strings  (../Projects/RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202dba4e63bf238078b705e88338208ff2.md)
Status: Not started
Tasks: T02 Sliding window patterns (../Tasks/T02%20Sliding%20window%20patterns%202dca4e63bf2380688eafd817f254f13d.md)
Teams: Research Team (../Teams/Research%20Team%202d5a4e63bf2380fdbf70f6d679ba0d14.md)

# Sliding Window Pattern in TypeScript

The **sliding window pattern** is an efficient technique for solving problems involving contiguous subarrays or substrings. Instead of recalculating values from scratch for each window, you maintain a window that "slides" across the data, updating it incrementally.

---

## Core Concept

```
Array: [1, 2, 3, 4, 5]
Window size: 3

Step 1: [1, 2, 3]     → Sum = 6
Step 2:    [2, 3, 4]  → Sum = 9
Step 3:       [3, 4, 5] → Sum = 12

```

---

## Pattern 1: Fixed Window Size

**Use case:** Find the maximum sum of a subarray of fixed length.

```tsx
function maxSumFixedWindow(arr: number[], windowSize: number): number {
  if (arr.length < windowSize) return 0;

  // Calculate initial window sum
  let windowSum = arr.slice(0, windowSize).reduce((a, b) => a + b, 0);
  let maxSum = windowSum;

  // Slide the window
  for (let i = windowSize; i < arr.length; i++) {
    // Remove left element, add right element
    windowSum = windowSum - arr[i - windowSize] + arr[i];
    maxSum = Math.max(maxSum, windowSum);
  }

  return maxSum;
}

// Example
console.log(maxSumFixedWindow([1, 2, 3, 4, 5], 3)); // Output: 12 (3+4+5)

```

**Time Complexity:** O(n) instead of O(n × k)

---

## Pattern 2: Dynamic Window Size (Two Pointers)

**Use case:** Find the longest substring with specific properties.

```tsx
// Find longest substring without repeating characters
function longestSubstringWithoutRepeating(s: string): number {
  const charIndex = new Map<string, number>();
  let maxLength = 0;
  let left = 0;

  for (let right = 0; right < s.length; right++) {
    const char = s[right];

    // If char exists in current window, move left pointer
    if (charIndex.has(char) && charIndex.get(char)! >= left) {
      left = charIndex.get(char)! + 1;
    }

    // Update last seen index of char
    charIndex.set(char, right);

    // Calculate window size and update max
    maxLength = Math.max(maxLength, right - left + 1);
  }

  return maxLength;
}

// Example
console.log(longestSubstringWithoutRepeating('abcabcbb')); // Output: 3 ("abc")
console.log(longestSubstringWithoutRepeating('bbbbb'));   // Output: 1 ("b")
console.log(longestSubstringWithoutRepeating('pwwkew'));  // Output: 3 ("wke")

```

---

## Pattern 3: Window with Target Sum

**Use case:** Find minimum window substring, or smallest subarray with target sum.

```tsx
// Find minimum window substring containing all chars from target
function minWindowSubstring(s: string, target: string): string {
  if (!target || !s) return '';

  const dictTarget = new Map<string, number>();
  for (const char of target) {
    dictTarget.set(char, (dictTarget.get(char) ?? 0) + 1);
  }

  let required = dictTarget.size;
  let formed = 0;
  const windowCounts = new Map<string, number>();
  let ans = [Number.MAX_VALUE, 0, 0];

  let left = 0;
  for (let right = 0; right < s.length; right++) {
    const char = s[right];
    windowCounts.set(char, (windowCounts.get(char) ?? 0) + 1);

    // If frequency of current char matches target, increment formed
    if (dictTarget.has(char) && windowCounts.get(char) === dictTarget.get(char)) {
      formed++;
    }

    // Try to contract window until it doesn't satisfy the condition
    while (left <= right && formed === required) {
      const char = s[left];

      // Save the smallest window
      if (right - left + 1 < ans[0]) {
        ans = [right - left + 1, left, right];
      }

      windowCounts.set(char, windowCounts.get(char)! - 1);
      if (dictTarget.has(char) && windowCounts.get(char)! < dictTarget.get(char)!) {
        formed--;
      }

      left++;
    }
  }

  return ans[0] === Number.MAX_VALUE ? '' : s.substring(ans[1], ans[2] + 1);
}

// Example
console.log(minWindowSubstring('ADOBECODEBANC', 'ABC')); // Output: "BANC"

```

---

## Pattern 4: Counting with Sliding Window

**Use case:** Count subarrays matching a condition.

```tsx
// Count number of subarrays with sum equal to target
function subarraySumEqualsK(arr: number[], k: number): number {
  const sumCount = new Map<number, number>();
  sumCount.set(0, 1); // Base case: sum 0 appears once

  let currentSum = 0;
  let count = 0;

  for (const num of arr) {
    currentSum += num;

    // If (currentSum - k) exists, we found subarrays with sum k
    if (sumCount.has(currentSum - k)) {
      count += sumCount.get(currentSum - k) ?? 0;
    }

    sumCount.set(currentSum, (sumCount.get(currentSum) ?? 0) + 1);
  }

  return count;
}

// Example
console.log(subarraySumEqualsK([1, 1, 1], 2));        // Output: 2
console.log(subarraySumEqualsK([1, 2, 1, 2, 1], 3)); // Output: 4

```

---

## Pattern 5: Window Validation (Practical Example)

```tsx
interface CompetitorMetric {
  date: string;
  sales: number;
  competitors: number;
}

// Find periods where we outperformed competitors on average
function findPerformanceWindows(
  metrics: CompetitorMetric[],
  windowSize: number
): Array<{ start: number; end: number; avgDifference: number }> {
  const results: Array<{ start: number; end: number; avgDifference: number }> = [];

  if (metrics.length < windowSize) return results;

  let windowSum = 0;
  for (let i = 0; i < windowSize; i++) {
    windowSum += metrics[i].sales - metrics[i].competitors;
  }

  if (windowSum > 0) {
    results.push({
      start: 0,
      end: windowSize - 1,
      avgDifference: windowSum / windowSize,
    });
  }

  for (let i = windowSize; i < metrics.length; i++) {
    windowSum = windowSum - (metrics[i - windowSize].sales - metrics[i - windowSize].competitors) + (metrics[i].sales - metrics[i].competitors);

    if (windowSum > 0) {
      results.push({
        start: i - windowSize + 1,
        end: i,
        avgDifference: windowSum / windowSize,
      });
    }
  }

  return results;
}

```

---

## Common Sliding Window Problems

| Problem | Pattern | Complexity |
| --- | --- | --- |
| Max sum of fixed-size subarray | Fixed window | O(n) |
| Longest substring without repeating | Dynamic (two pointers) | O(n) |
| Minimum window substring | Dynamic with hashmap | O(n) |
| Subarrays with product < k | Dynamic (two pointers) | O(n) |
| Permutation in string | Fixed + frequency map | O(n) |
| Fruit into baskets | Dynamic (two pointers) | O(n) |

---

## Key Takeaways

✅ **Use sliding window when:**

- Problem involves contiguous subarrays/substrings
- You can incrementally update window state
- Brute force would be O(n²) or worse

✅ **Two patterns:**

1. **Fixed window:** Know the size upfront
2. **Dynamic window:** Expand/contract based on conditions

✅ **Common tools:**

- `Map<T, number>` for frequency counting
- Two pointers (left/right) for boundaries
- Incremental calculation instead of recalculation

Would you like me to explain any specific pattern in more detail or show how to apply this to a Competitive Advantage feature?