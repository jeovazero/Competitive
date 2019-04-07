#include<iostream>
#include<algorithm>
#define endl '\n'

using namespace std;
char S[50010];
int N, ls;

void solve(){
    cin >> N;
    cin >> S;
    ls = (N << 1) - 2;
    for(int i = 0; i < ls; i++){
        S[i] = S[i] == 'E' ? 'S' : 'E';
    }
}

int main(){
    ios_base::sync_with_stdio(false);

    int t;
    cin >> t;

    for(int i = 1; i <= t; i++){
        solve();
        cout << "Case #" << i << ": ";
        cout << S << endl;
    }
    return 0;
}
