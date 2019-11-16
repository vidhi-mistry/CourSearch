#include<stdio.h>
#include<conio.h>
#include<graphics.h>
#include<stdlib.h>
#include<math.h>

int roundoff(float number){
		if(number>=0){
			if((number - (int)number) > 0.5){
				return number + 1;
			}else{
				return number;
			}
		}else{
			if(((int)number - number) >= 0.5){
				return number - 1;
			}else{
				return number;
			}
		}
}

int main(){
	int x1,x2,y1,y2;
	int length;
	int i=1;
	int signx,signy;
	float dx,dy,x,y;
	int gd = DETECT,gm;
	initgraph(&gd,&gm,"C://TURBOC3/BGI");
	printf("Enter the coordinates x1,y1,x2,y2: ");
	scanf("%d %d %d %d",&x1,&y1,&x2,&y2);
	if(abs(x2-x1) >= abs(y2 -y1)){
		length = abs(x2 - x1);
	}else{
		length = abs(y2 - y1);
	}
	dx = (float)(x2 - x1)/(float)length;
	dy = (float)(y2 -y1)/(float)length;

	if(dx<0){
	   signx = -1;
	}else if(dx>0){
	   signx = 1;
	}else{
	   signx = 0;
	}

	if(dy<0){
	   signy = -1;
	}else if(dy>0){
	   signy = 1;
	}else{
	   signy = 0;
	}
	x = (float)x1 + (float)(0.5 * signx);
	y = (float)y1 + (float)(0.5 * signy);

	line(320,0,320,479);
	line(0,240,639,240);

	while(i<=length){
	   //	printf("%.2f %.2f\n",x,y);
	   //	printf("%d %d\n",roundoff(x),roundoff(y));
		putpixel(320 + roundoff(x),240 - roundoff(y),WHITE);
		x = x + dx;
		y = y + dy;
		i = i + 1;
	}

	getch();
	return 0;
}