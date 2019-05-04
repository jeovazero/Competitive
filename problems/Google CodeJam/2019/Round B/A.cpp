#include<iostream>
#include<algorithm>
#include<cstring>
#define endl '\n'

using namespace std;

int vx[100010];
int vy[100010];

pair<int, int> solve(){
    memset(vx, 0, sizeof(vx));
    memset(vy, 0, sizeof(vy));

    int p, q, a, b;
    char c;
    cin >> p >> q;
    int sx = 0, sy = 0, x = 0, y = 0;
    // vector<pair<pair<int, int>, pair<int, int> > > V;
    for(int i = 0; i < p; i++){
        cin >> a >> b >> c;
        if(c == 'N' || c == 'S'){
            for(int n = 0; n <= q; n++){
                vx[n]++;
            }
            int u = b + 1, v = q;
            if(c == 'S'){
                u = 0, v = b - 1;
            }
            for(int n = u; n <= v; n++){
                vy[n]++;
            }
        }else{
            for(int n = 0; n <= q; n++){
                vy[n]++;
            }
            int u = a + 1, v = q;
            if(c == 'W'){
                u = 0, v = a - 1;
            }
            for(int n = u; n <= v; n++){
                vx[n]++;
            }
        }
        for(int n = 0; n <= q; n++){
            vx[n]++;
            if(sx < vx[n]){
                sx = vx[n];
                x = n;
            }
            vy[n]++;
            if(sy < vy[n]){
                sy = vy[n];
                y = n;
            }

        }
    }

    return (pair<int, int>) { x, y};
}

int main(){
    ios_base::sync_with_stdio(false);

    int t;
    pair<int, int> ans;
    cin >> t;

    for(int i = 1; i <= t; i++){
        ans = solve();
        cout << "Case #" << i << ": ";
        cout << ans.first << " " << ans.second;
        cout << endl;
    }
    return 0;
}
