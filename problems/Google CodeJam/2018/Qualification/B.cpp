#include<iostream>
#include<algorithm>
#define endl '\n'
#define MAXSIZE 100010

using namespace std;

int u[MAXSIZE];
int v[MAXSIZE];
bool toggle;
int vi, ui, q, ti;

void tsort(){
    sort(u, u+ui);
    sort(v, v+vi);
}

int solve(){
    cin >> q;
    vi = 0;
    ui = 0;
    toggle = true;
    ti = q;
    while(q--){
        if(toggle)
            cin >> v[vi++];
        else cin >> u[ui++];
        toggle = !toggle;
    }
    tsort();
    vi = 0;
    ui = 0;
    for(int i = 1; i < ti; i++){
        if(i & 1){
            if(v[vi++] > u[ui]) return (i-1);
        }else{
            if(u[ui++] > v[vi]) return (i-1);
        }
    }
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
            cout << "OK";
        }else{
            cout << ans;
        }
        cout << endl;
    }
    return 0;
}
