#include<iostream>
#include<algorithm>
#define endl '\n'

using namespace std;
string S;
int dm;
int ls;

int currentDamage(){
    int cur = 1, cd = 0;
    for(int i = 0; i < ls; i++){
        if(S[i] == 'C') cur <<= 1;
        else cd += cur;
    }
    return cd;
}

bool makeSwap(){
    for(int i = ls - 1; i >= 1; i--){
        if(S[i] > S[i - 1]){
            swap(S[i], S[i-1]);
            return true;
        }
    }
    return false;
}

int solve(){
    cin >> dm >> S;
    ls = S.length();

    int ans = 0, cd;
    do{
        cd = currentDamage();
        if(cd <= dm) return ans;
        ans++;
    }while(makeSwap());
    return -1;
}

int main(){
    ios_base::sync_with_stdio(false);

    int t, ans;
    cin >> t;

    for(int i = 1; i <= t; i++){
        ans = solve();
        cout << "Case #" << i << ": ";
        if(ans == -1){
            cout << "IMPOSSIBLE";
        }else{
            cout << ans;
        }
        cout << endl;
    }
    return 0;
}
