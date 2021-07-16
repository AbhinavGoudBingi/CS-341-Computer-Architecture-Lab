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

string convert_to_hex(int num){
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
	if (!num) { 
		res = "0"; 
	} 

	if (num > 0) { 
		while (num) { 
			res = m[num % 16] + res; 
			num /= 16; 
		} 
	} 

	else { 
		u_int n = num; 
 
		while (n) { 
			res = m[n % 16] + res; 
			n /= 16; 
		} 
	} 

    return res;
}

int main() 
{ 
cout<<"Enter I or LI or SI or Q\n";
while(1){
string input;
cin>>input;
if(input=="Q"){
	return 0;
}
else if(input=="LI"){
	cout<<convert_to_hex(INT_MAX)<<endl;
}
else if(input=="SI"){
	cout<<convert_to_hex(INT_MIN)<<endl;
}
else{
	int data;
	cin>>data;
    const size_t BITS = 8*sizeof(data);
vector<int> bin_str(BITS);

for(unsigned int i=0; i<BITS; i++)
{
  unsigned int mask = 1u << (BITS - 1 - i);
  bin_str[i] = (data & mask) ? 1 : 0;
}
cout<<convert_to_hex(bin_str)<<endl;
}

}
	

	return 0; 
} 
