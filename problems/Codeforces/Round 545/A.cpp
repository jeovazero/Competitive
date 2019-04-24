#include<iostream>
#include<algorithm>
#define endl '\n'

using namespace std;

int v[100010];
int p[100010];

int main(){
    ios_base::sync_with_stdio(false);

    int t, ans = 0;
    cin >> t;
    for(int i = 0; i < t; i++){
        cin >> v[i];
    }

    int cur = v[0], c = 1, pi = 0;
    for(int i = 1; i < t; i++){
        if(cur == v[i]){
            c++;
        }else{
            p[pi++] = c;
            c = 1;
            cur = v[i];
        }
    }
    p[pi] = c;
    for(int i = pi; i > 0; i--){
        ans = max(min(p[i], p[i-1]), ans);
    }
    cout << (ans << 1) << endl;
    return 0;
}
