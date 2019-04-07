#include<iostream>
#include<algorithm>
#define endl '\n'

using namespace std;
string S, A, B;
int dm;
int ls;

pair<string, string> solve(){
    cin >> S;
    A = S;
    B = S;
    ls = S.length();
    for(int i = 0; i < ls; i++){
        if(A[i] == '4') {
            A[i] = B[i] = '2';
        }else{
            B[i] = '0';
        }
    }
    int stop = 0;
    for(int i = 0; i < ls; i++){
        if(B[i] == '0'){
            stop = i + 1;
        }else {
            break;
        }
    }
    string B1 = B.substr(stop, ls);
    return (pair<string, string>){A, B1};
}

int main(){
    ios_base::sync_with_stdio(false);

    int t;
    pair<string, string> ans;
    cin >> t;

    for(int i = 1; i <= t; i++){
        ans = solve();
        cout << "Case #" << i << ": ";
        cout << ans.first << " " << ans.second;
        cout << endl;
    }
    return 0;
}
