# T03 Two pointer patterns

Meetings: Daily Standup @January 6, 2026  (../Meetings/Daily%20Standup%20@January%206,%202026%202e0a4e63bf2381e3bc6ef11a2cef8125.md)
Parent item: RES-M1-P1.1-A&S - Arrays & Strings  (RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202e2a4e63bf2380b2abcde7fd67f71a5a.md)
Projects: RES-M1-P1.1-A&S - Arrays & Strings  (../Projects/RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202dba4e63bf238078b705e88338208ff2.md)
Status: Not started
Tasks: T03 Two pointer patterns  (../Tasks/T03%20Two%20pointer%20patterns%202e2a4e63bf23802086d8ca830a5e9a8f.md)
Teams: Research Team (../Teams/Research%20Team%202d5a4e63bf2380fdbf70f6d679ba0d14.md)

## Core Concepts

### When to Use

- ✅ Finding pairs that sum to a target
- ✅ Removing duplicates from sorted arrays
- ✅ Reversing arrays or strings
- ✅ Detecting cycles in linked lists
- ✅ Merging sorted arrays
- ✅ Container with most water problems
- ✅ String palindrome validation

### Why It's Efficient

- Reduces time complexity from O(n²) to O(n)
- Minimizes space complexity
- Single or double pass through data

---

## Pattern Variants

### 1. **Opposite Direction Pattern** (Start & End)

Two pointers start from opposite ends and move toward each other.

```tsx
// Example: Validate Palindrome
function isPalindrome(s: string): boolean {
  let left = 0;
  let right = s.length - 1;

  while (left < right) {
    // Skip non-alphanumeric characters
    while (left < right && !isAlphanumeric(s[left])) {
      left++;
    }
    while (left < right && !isAlphanumeric(s[right])) {
      right--;
    }

    // Compare characters (case-insensitive)
    if (s[left].toLowerCase() !== s[right].toLowerCase()) {
      return false;
    }

    left++;
    right--;
  }

  return true;
}

function isAlphanumeric(char: string): boolean {
  return /[a-zA-Z0-9]/.test(char);
}

// Test
console.log(isPalindrome("A man, a plan, a canal: Panama")); // true
console.log(isPalindrome("race a car")); // false

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 2. **Sorted Array Pattern** (Two Sum)

For sorted arrays, use one pointer at start and one at end.

```tsx
// Example: Two Sum II - Input Array Is Sorted
function twoSum(
  numbers: number[],
  target: number
): [number, number] {
  let left = 0;
  let right = numbers.length - 1;

  while (left < right) {
    const sum = numbers[left] + numbers[right];

    if (sum === target) {
      // Return 1-indexed positions
      return [left + 1, right + 1];
    } else if (sum < target) {
      // Need larger sum, move left pointer right
      left++;
    } else {
      // Need smaller sum, move right pointer left
      right--;
    }
  }

  return [-1, -1]; // No solution found
}

// Test
console.log(twoSum([2, 7, 11, 15], 9)); // [1, 2]
console.log(twoSum([2, 3, 4], 6)); // [1, 3]

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 3. **Same Direction Pattern** (Slow & Fast)

Both pointers move in the same direction but at different speeds (often used with linked lists or sliding window).

```tsx
// Example: Remove Duplicates from Sorted Array
function removeDuplicates(nums: number[]): number {
  if (nums.length === 0) return 0;

  let slow = 0; // Position to write next unique element
  let fast = 1; // Pointer to read elements

  while (fast < nums.length) {
    if (nums[fast] !== nums[slow]) {
      slow++;
      nums[slow] = nums[fast];
    }
    fast++;
  }

  // Return length of array with unique elements
  return slow + 1;
}

// Test
const arr1 = [1, 1, 2];
console.log(removeDuplicates(arr1)); // 2, arr1 becomes [1, 2]

const arr2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
console.log(removeDuplicates(arr2)); // 5, arr2 becomes [0, 1, 2, 3, 4]

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 4. **Container with Most Water**

Find two lines that form a container with maximum area.

```tsx
// Example: Container With Most Water
function maxArea(height: number[]): number {
  let left = 0;
  let right = height.length - 1;
  let maxWater = 0;

  while (left < right) {
    // Calculate current water volume
    const width = right - left;
    const currentHeight = Math.min(height[left], height[right]);
    const currentArea = width * currentHeight;

    maxWater = Math.max(maxWater, currentArea);

    // Move the pointer with smaller height
    // (moving the taller line can't increase area)
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return maxWater;
}

// Test
console.log(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // 49
console.log(maxArea([1, 1])); // 1

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 5. **Linked List Cycle Detection** (Floyd's Cycle)

Detect if a linked list has a cycle using slow and fast pointers.

```tsx
// Linked List Node
interface ListNode {
  val: number;
  next: ListNode | null;
}

function detectCycle(head: ListNode | null): ListNode | null {
  if (!head || !head.next) return null;

  let slow: ListNode | null = head;
  let fast: ListNode | null = head;

  // Phase 1: Detect if cycle exists
  while (fast && fast.next) {
    slow = slow!.next;
    fast = fast.next.next;

    if (slow === fast) {
      // Cycle found, move to phase 2
      break;
    }
  }

  // If no cycle
  if (!fast || !fast.next) return null;

  // Phase 2: Find cycle start
  slow = head;
  while (slow !== fast) {
    slow = slow!.next;
    fast = fast!.next;
  }

  return slow;
}

// Test: Create cycle
const node1: ListNode = { val: 3, next: null };
const node2: ListNode = { val: 2, next: null };
const node3: ListNode = { val: 0, next: null };
const node4: ListNode = { val: -4, next: null };

node1.next = node2;
node2.next = node3;
node3.next = node4;
node4.next = node2; // Cycle

console.log(detectCycle(node1) === node2); // true

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 6. **Merge Sorted Arrays**

Merge two sorted arrays into one using backward pointers.

```tsx
// Example: Merge Sorted Array
function merge(
  nums1: number[],
  m: number,
  nums2: number[],
  n: number
): void {
  // Start from end of both arrays
  let p1 = m - 1; // Pointer for nums1
  let p2 = n - 1; // Pointer for nums2
  let p = m + n - 1; // Pointer for merged position

  // Merge backward to avoid overwriting
  while (p1 >= 0 && p2 >= 0) {
    if (nums1[p1] > nums2[p2]) {
      nums1[p] = nums1[p1];
      p1--;
    } else {
      nums1[p] = nums2[p2];
      p2--;
    }
    p--;
  }

  // If nums2 has remaining elements, copy them
  while (p2 >= 0) {
    nums1[p] = nums2[p2];
    p2--;
    p--;
  }
  // No need to copy remaining nums1 elements (already in place)
}

// Test
const nums1 = [1, 2, 3, 0, 0, 0];
const nums2 = [2, 5, 6];
merge(nums1, 3, nums2, 3);
console.log(nums1); // [1, 2, 2, 3, 5, 6]

```

**Time Complexity:** O(m + n)

**Space Complexity:** O(1)

---

### 7. **Reverse String**

Reverse a string in-place using two pointers.

```tsx
// Example: Reverse String
function reverseString(s: string[]): void {
  let left = 0;
  let right = s.length - 1;

  while (left < right) {
    // Swap characters
    [s[left], s[right]] = [s[right], s[left]];
    left++;
    right--;
  }
}

// Test
const chars = ["h", "e", "l", "l", "o"];
reverseString(chars);
console.log(chars.join("")); // "olleh"

```

**Time Complexity:** O(n)

**Space Complexity:** O(1)

---

### 8. **3Sum Problem**

Find all unique triplets that sum to zero.

```tsx
// Example: 3Sum
function threeSum(nums: number[]): number[][] {
  nums.sort((a, b) => a - b);
  const result: number[][] = [];

  for (let i = 0; i < nums.length - 2; i++) {
    // Skip duplicate values for i
    if (i > 0 && nums[i] === nums[i - 1]) continue;

    // If smallest number is positive, no triplet can sum to 0
    if (nums[i] > 0) break;

    // Two pointer search for the remaining two numbers
    let left = i + 1;
    let right = nums.length - 1;

    while (left < right) {
      const sum = nums[i] + nums[left] + nums[right];

      if (sum === 0) {
        result.push([nums[i], nums[left], nums[right]]);

        // Skip duplicates for left
        while (left < right && nums[left] === nums[left + 1]) {
          left++;
        }
        // Skip duplicates for right
        while (left < right && nums[right] === nums[right - 1]) {
          right--;
        }

        left++;
        right--;
      } else if (sum < 0) {
        left++;
      } else {
        right--;
      }
    }
  }

  return result;
}

// Test
console.log(threeSum([-1, 0, 1, 2, -1, -4]));
// [[-1, -1, 2], [-1, 0, 1]]

```

**Time Complexity:** O(n²)

**Space Complexity:** O(1) or O(n) depending on sorting algorithm

---

## Decision Matrix

| Problem | Pattern | Time | Space |
| --- | --- | --- | --- |
| Palindrome | Opposite Direction | O(n) | O(1) |
| Two Sum (sorted) | Opposite Direction | O(n) | O(1) |
| Remove Duplicates | Same Direction | O(n) | O(1) |
| Container Water | Opposite Direction | O(n) | O(1) |
| Cycle Detection | Same Direction (fast/slow) | O(n) | O(1) |
| Merge Sorted | Backward Pointers | O(m+n) | O(1) |
| 3Sum | Nested Two Pointers | O(n²) | O(1) |

---

## Summary

**Two Pointer Pattern Key Takeaways:**

- ✅ Reduces nested loops from O(n²) to O(n)
- ✅ Works best on sorted or structured data
- ✅ Always clarify pointer movement logic
- ✅ Handle boundary conditions carefully
- ✅ Consider space-optimized solutions when possible

This pattern has been designed with accessibility in mind, supporting keyboard navigation and screen reader compatibility through semantic HTML and ARIA attributes where applicable.