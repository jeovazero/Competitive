#include<iostream>
#include<algorithm>
#include<vector>
#define rep(i, a, b) for(int i = (a); i < (b); i++)
#define endl '\n'

using namespace std;

vector<vector<int> > V;

int main(){
    ios_base::sync_with_stdio(false);

    int n;
    string s, r;
    cin >> n >> s >> r;
    V.resize(4);

    for(int i = 0; i < n; i++){
        if(s[i] == '0' && r[i] == '0') V[0].push_back(i+1);
        else if(s[i] == '0' && r[i] == '1') V[1].push_back(i+1);
        else if(s[i] == '1' && r[i] == '0') V[2].push_back(i+1);
        else if(s[i] == '1' && r[i] == '1') V[3].push_back(i+1);
    }
    int vc, vd, vb;
    int sa = V[0].size(),
        sb = V[1].size(),
        sc = V[2].size(),
        sd = V[3].size();
    int sx = sb + sd;
    for(int ci = 0; ci <= sc; ci++){
        for(int di = 0; di <= sd; di++){
            int bx = sx - ci - (di << 1);
            int ax = (n >> 1) - ci - di - bx;
            // cout << ax << " " << bx << " " << ci << " " << di << endl;
            if(bx >= 0 && ax >= 0 && bx <= sb && ax <= sa){
                rep(i, 0, ax) { if(i) cout << ' '; cout << V[0][i]; }
                bool j = ax > 0;
                rep(i, 0, bx) { if(j || i) cout << ' '; cout << V[1][i]; }
                j = j || bx > 0;
                rep(i, 0, ci) { if(j || i) cout << ' '; cout << V[2][i]; }
                j = j || ci > 0;
                rep(i, 0, di) { if(j || i) cout << ' '; cout << V[3][i]; }
                cout << endl;
                return 0;
            }
        }
    }

    cout << "-1" << endl;
    return 0;
}
