#include<iostream>
#include<queue>

using namespace std;

int main(){
  queue<int> fifo;

  if(fifo.empty()) cout << "is Empty" << endl;

  fifo.push(1);
  fifo.push(2);
  fifo.push(3);

  // Size
  cout << "Size: " << fifo.size() << endl;

  int t1 = fifo.front();
  cout << "t1: " << t1 << endl;

  fifo.pop();
  int t2 = fifo.front();
  cout << "t2: " << t2 << endl;

  fifo.pop();
  int t3 = fifo.front();
  cout << "t3: " << t3 << endl;

  cout << "Size: " << fifo.size() << endl;
  fifo.pop();

  if(fifo.empty()) cout << "is Empty" << endl;

  return 0;
}
