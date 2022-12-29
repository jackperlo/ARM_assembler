/* Estrarre in val (unsigned char [8 bit]) il valore dal 16 al 23 esimo bit in TC */
val = (LPC_TIM1->TC & (255 << 16)) >> 16;
