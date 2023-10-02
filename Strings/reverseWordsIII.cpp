// LeetCode
// 557. Reverse Words in a String III

class Solution
{
public:
    string reverseWords(string s)
    {
        int n = s.size();
        int l, r = 0;

        while (l < n)
        {
            while (r < n && s[r] != ' ')
            {
                r++;
            }
            reverse(s.begin() + l, s.begin() + r);
            l = r + 1;
            r = l;
        }
        return s;
    }
};