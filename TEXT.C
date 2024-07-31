#include<stdio.h>
#include<string.h>
void main(){
  char string[20],stuffed[20],temp[20],destuffed[20];
  int i;
  //stuffed
  printf("\nEnter String : \n");
  scanf("%s",string);
  temp[0]='\0';
  for(i=0;string[i]!='\0';i++){
	  if(string[i] == '~'){
	    strcat(temp,"#");

	  }
	  strncat(temp,&string[i],1);
  }
  stuffed[0] = '\0';
  strcat(stuffed,"~");
  strcat(stuffed,temp);
  strcat(stuffed,"~");

  printf("\n stuffed data %s",stuffed);

  //destuffed
  destuffed[0]='\0';
  for(i=1;i<(strlen(stuffed) - 1);i++){
       strncat(destuffed,&stuffed[i],1);
  }

  printf("\n Destuffed : %s\n",destuffed);
}