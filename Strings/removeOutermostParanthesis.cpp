// LeetCode
// 1021. Remove Outermost Parentheses

class Solution
{
public:
    string removeOuterParentheses(string s)
    {
        int n = s.size();
        int count = 0;
        string ans = "";
        bool flag = true;

        for (int i = 0; i < n; i++)
        {
            if (s[i] == '(')
                count++;

            if (s[i] == ')')
                count--;

            if (count == 1 && flag == true)
            {
                flag = false;
                continue;
            }

            if (count == 0 && flag == false)
            {
                flag = true;
                continue;
            }

            ans += s[i];
        }

        return ans;
    }
};