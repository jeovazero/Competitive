#include<iostream>
#include<stack>
using namespace std;

int main(){
  stack<int> st;

  if(st.empty()) cout << "is empty" << endl;

  // Adding
  st.push(1);
  st.push(2);
  st.push(3);

  // Should be 3
  cout << "Size: " << st.size() << endl;

  int t1 = st.top();
  cout << "t1 = " << t1 << endl;

  // Popping
  st.pop();
  int t2 = st.top();
  cout << "t2 = " << t2 << endl;

  st.pop();
  int t3 = st.top();
  cout << "t3 = " << t3 << endl;

  st.pop();
  if(st.empty()) cout << "is empty" << endl;

  return 0;
}
