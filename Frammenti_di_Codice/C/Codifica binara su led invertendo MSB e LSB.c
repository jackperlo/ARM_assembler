void printOnLed(int pos) {
	int binary[8];
	int i, count = 7;
	
	for(i = 0; pos > 0; i++){    
		binary[i] = pos % 2;    
		pos = pos / 2;    
	}
	
	
	for(i = 0; i < 8; i++) {
		if(binary[i] == 0)
			LED_Off(count);
		else
			LED_On(count);
		
		count --;
	}
}