#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<string> dictionary;

    string word;
    while (cin >> word) {
        dictionary.emplace_back(word);
    }

    sort(dictionary.begin(), dictionary.end());

    for(auto values: dictionary) {
        cout << values << '\n';
    }

    return 0;
}