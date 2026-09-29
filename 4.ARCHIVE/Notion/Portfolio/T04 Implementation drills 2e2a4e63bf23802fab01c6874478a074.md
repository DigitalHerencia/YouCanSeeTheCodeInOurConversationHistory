# T04 Implementation drills

Meetings: Daily Standup @January 7, 2026  (../Meetings/Daily%20Standup%20@January%207,%202026%202e1a4e63bf238150ac8ed72fa61c8b80.md)
Parent item: RES-M1-P1.1-A&S - Arrays & Strings  (RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202e2a4e63bf2380b2abcde7fd67f71a5a.md)
Projects: RES-M1-P1.1-A&S - Arrays & Strings  (../Projects/RES-M1-P1%201-A&S%20-%20Arrays%20&%20Strings%202dba4e63bf238078b705e88338208ff2.md)
Status: Not started
Tasks: T04 Implementation drills  (../Tasks/T04%20Implementation%20drills%202e2a4e63bf2380778601de9cb859f907.md)
Teams: Research Team (../Teams/Research%20Team%202d5a4e63bf2380fdbf70f6d679ba0d14.md)

```tsx
// T04: Arrays & Strings — Sliding Window + Two Pointers (TypeScript)
// Implement the functions below. Aim for O(n) time and O(1)/O(k) space.

export function lengthOfLongestSubstring(s: string): number {
// TODO: sliding window with last-seen index map
return 0;
}

export function findAnagrams(s: string, p: string): number[] {
// TODO: fixed-size window with freq array/map
return [];
}

export function characterReplacement(s: string, k: number): number {
// TODO: window keep max char count; shrink if (windowLen - maxCount) > k
return 0;
}

export function minWindow(s: string, t: string): string {
// TODO: need/have counts; expand then shrink; track best
return "";
}

export function maxSubarraySumOfSizeK(nums: number[], k: number): number {
// TODO: fixed-size window; track running sum and max
return Number.NEGATIVE_INFINITY;
}

export function minSubArrayLen(target: number, nums: number[]): number {
// TODO: two pointers; shrink while sum >= target
return 0;
}

export function longestOnes(nums: number[], k: number): number {
// LeetCode 1004: max consecutive ones with ≤k zero flips
// TODO: window count zeros; shrink when zeros > k
return 0;
}

export function numSubarrayProductLessThanK(nums: number[], k: number): number {
// LeetCode 713: product window; expand/shrink; count += windowLen each step
return 0;
}

// Quick local harness (replace with Jest if preferred)
function assertEq<T>(actual: T, expected: T, name: string) {
const a = JSON.stringify(actual);
const e = JSON.stringify(expected);
if (a !== e) console.error(`✗ ${name}: expected ${e}, got ${a}`);
else console.log(`✓ ${name}`);
}

function run() {
assertEq(lengthOfLongestSubstring("abcabcbb"), 3, "Longest substring (abc)");
assertEq(lengthOfLongestSubstring("bbbbb"), 1, "Longest substring (b)");

assertEq(findAnagrams("cbaebabacd", "abc"), [0, 6], "Find anagrams");
assertEq(characterReplacement("AABABBA", 1), 4, "Character replacement");

assertEq(minWindow("ADOBECODEBANC", "ABC"), "BANC", "Minimum window substring");

assertEq(maxSubarraySumOfSizeK([1, 12, -5, -6, 50, 3], 4), 51, "Max sum size k");
assertEq(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]), 2, "Min subarray len");

assertEq(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2), 6, "Longest ones with k flips");
assertEq(numSubarrayProductLessThanK([10,5,2,6], 100), 8, "Subarrays product < k");
}
if (require.main === module) run();
```