# 338. counting bits

difficulty: easy
Topics: bit manipulation

# instructions:

Given an integer `n`, return *an array* `ans` *of length* `n + 1` *such that for each* `i` **(`0 <= i <= n`)*,* `ans[i]` *is the **number of*** `1`***'s** in the binary representation of* `i`.

**Example 1:**

```
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

```

**Example 2:**

```
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101

```

**Constraints:**

- `0 <= n <= 105`

## code:

```python
class Solution:
```

## analysis

1. 

## notes

- 

---

- other solutions
    
    ```python
    class Solution:
        def countBits(self, n: int) -> List[int]:
            ret = [0]*(n + 1)
            for i in range(1, n + 1):
                ret[i] = ret[i >> 1] + (i &1)
            return ret
    ```