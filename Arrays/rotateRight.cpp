//LeetCode
//189. Rotate Array

//1st Approach
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int n = nums.size();
        k = k % n;

        reverse(nums.begin(), nums.begin() + (n - k));
        reverse(nums.begin() + (n - k), nums.end());
        reverse(nums.begin(), nums.end());
    }
};

//2nd Approach
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        k = k % nums.size();
        if(k!=0)
        {
            reverse(nums.end() - k, nums.end());
            reverse(nums.begin(), nums.end() - k);
            reverse(nums.begin(), nums.end());
        }
    }
};
