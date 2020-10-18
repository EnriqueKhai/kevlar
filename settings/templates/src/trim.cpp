#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    while (getline(cin,line)) {
        for (int i = line.length() - 1; i >= 0; i -= 1) {
            if (line[i] == ' ') {
                line.erase(i,1);
            } else {
                break;
            }
        }
        
        if (line.length() > 0) {
            cout << line << "\n";
        }
    }
    return 0;
}