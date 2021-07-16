// C program to convert a real value 
// to IEEE 754 floating point representaion 

#include <bits/stdc++.h>
using namespace std;

string convert_to_hex(vector<int> binary_rep){
    map<int, char> m; 

    char digit = '0'; 
    char c = 'A'; 

    for (int i = 0; i <= 15; i++) { 
        if (i < 10) { 
            m[i] = digit++; 
        } 
        else { 
            m[i] = c++; 
        } 
    } 

    string res = ""; 
    for(int i=0;i<32;i+=4){
       int number = binary_rep[i+3]*1+binary_rep[i+2]*2+binary_rep[i+1]*4+binary_rep[i]*8;
       res+=m[number];
      } 

    return res;
}

void printBinary(int n, int i, vector<int> &binary_rep) 
{ 

    // Prints the binary representation 
    // of a number n up to i-bits. 
    int k; 
    for (k = i - 1; k >= 0; k--) { 

        if ((n >> k) & 1) 
            binary_rep.push_back(1); 
        else
            binary_rep.push_back(0); 
    } 
} 

typedef union { 

    float f; 
    struct
    { 

        // Order is important. 
        // Here the members of the union data structure 
        // use the same memory (32 bits). 
        // The ordering is taken 
        // from the LSB to the MSB. 
        unsigned int mantissa : 23; 
        unsigned int exponent : 8; 
        unsigned int sign : 1; 

    } raw; 
} myfloat; 

// Function to convert real value 
// to IEEE foating point representation 
string printIEEE(myfloat var) 
{ 

    // Prints the IEEE 754 representation 
    // of a float value (32 bits) 
    vector<int> binary_rep;
    binary_rep.push_back(var.raw.sign);
    printBinary(var.raw.exponent, 8, binary_rep); 
    printBinary(var.raw.mantissa, 23, binary_rep); 
    return convert_to_hex(binary_rep);
} 

// Driver Code 
int main() 
{ 
cout<<"Enter F or LI or SP or SI or Q\n";
while(1)
    {   
        string input;
        cin>>input;
        if(input=="F"){
         myfloat var; 

    float fl;
    cin>>fl;
    var.f = fl; 
    cout<<printIEEE(var)<<endl;
        }
      else if(input=="Q"){
        return 0;
      }
      else if(input=="LI"){
        myfloat var; 
    float fl=FLT_MAX;
    var.f = fl;
    cout<<printIEEE(var)<<endl;
      }
      else if(input=="SP"){
     vector<int> binary_rep = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1};
    cout<<convert_to_hex(binary_rep)<<endl;
      }
      else if(input=="SI"){
        myfloat var; 
    float fl=2;
    var.f = fl;
    while(1){
        myfloat var1; 
    float fl1=var.f+1;
    var1.f = fl1;
    if(printIEEE(var)==printIEEE(var1)){
        cout<<printIEEE(var)<<endl;
        break;
      }
     else{
var.f = 2*(var.f);
     }
    }
    }
    } 

    return 0; 
} 
