//stampare val2 sui primi 4 led (MSB) e val1 sugli ultimi 4 led (LSB)
val2 = val2 << 4;
ledV = val2 | val1;