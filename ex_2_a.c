#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main(){

 char key[10],msg[20],temp[10],temp1[10];
 int i,j,msg_len,key_len,x;
 printf("\nenter msg\n");
 scanf("%s",msg);
 printf("enter key\n");
 scanf("%s",key);
 msg_len = strlen(msg);
 key_len = strlen(key);

 for(i=0;i<key_len-1;i++){
    msg[msg_len+i]='0';
 }
 msg[msg_len+key_len -1]='\0';

 for(i=0;i<key_len;i++){
   temp[i]=msg[i];
 }
 temp[key_len]='\0';

 x=key_len;

 while(x<strlen(msg)){
    if(temp[0]=='0'){
       for(i=0;i<key_len-1;i++){
         temp1[i]=temp[i+1];
       }
       temp1[i]=msg[x];
       temp1[key_len]='\0';

       for(i=0;i<key_len;i++){
        temp[i]=temp1[i];
       }
       x++;
    }
    else{
      for(i=key_len;i>0;i++){
        if(temp[i]== key[i]){
	  temp[i]='0';
	}
	else{
	 temp[i]='1';
	}
      }

      for(i=0;i<key_len-1;i++){
        temp1[i]=temp[i+1];
      }
      temp1[i]=msg[x];
      temp1[key_len]='\0';

      for(i=0;key_len;i++){
        temp[i]=temp1[i];
      }
      x++;

    }
 
 }

 printf("Finall result : %s",temp);
 

}
