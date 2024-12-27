class Solution {
public:
    int maxScoreSightseeingPair(vector<int>& values) {
        int max_left = values[0]; // Initial max value of values[i] + i // 8
        int max_score = INT_MIN;  
        
        for (int j = 1; j < values.size(); ++j) {   
            // Update max_score using the current j 
            max_score = max(max_score, max_left + values[j] - j); 
            // Update max_left for the next iteration
            max_left = max(max_left, values[j] + j); 
        }

        return max_score;
    }
};
