//LeetCode
//1046. Last Stone Weight

class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        multiset<int> sortedS;
        for(int i = 0; i<stones.size();i++){
            sortedS.insert(stones[i]);
        }
        while(sortedS.size()>1){
            auto it = sortedS.end();
            int a=*--it;
            sortedS.erase(it);
            int b=*--it;
            sortedS.erase(it);
            int c = abs(a-b);
            if(c!=0)
                sortedS.insert(c);
        }
        if(sortedS.size()==0) return 0;
        return *--sortedS.end();
    }
};