# compile c++ code for competitive programming
cc() {
  g++ -std=c++11 -O2 -Wall $1 -o $1.out
}
