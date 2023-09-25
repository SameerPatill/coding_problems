//LeetCode
//1903. Largest Odd Number in String
//at11:45

class Solution {
public:
    string largestOddNumber(string num) {
        int n = num.size();
        string ans = "";
        int index = -1;

        for(int i = n-1; i >= 0; i--)
        {
            if(num[i] % 2 != 0)
            {
                index = i;
                break;
            }
        }

        if(index != -1)
        {
            for(int i = 0; i <= index; i++)
            {
                ans += num[i];
            }
        }
        return ans;
    }
   
};