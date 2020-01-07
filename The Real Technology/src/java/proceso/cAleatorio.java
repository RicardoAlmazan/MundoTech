package proceso;

import java.util.Random;

public class cAleatorio {

    public cAleatorio() {
    }
    public int[] aleatoriozero(int i){
        int[] num = new int[i];
        Random  rnd = new Random();
        for(int x = 0; x<i; x++){
            num[x] = x;
            int temp = num[x];
            int y = (int)(rnd.nextDouble() * (x + 1));
            num[x] = num[y];
            num[y] = temp;
        }
        return num;
    }
    public int[] aleatorio(int i){
        int[] num = new int[i];
        Random  rnd = new Random();
        for(int x = 0; x<i; x++){
            num[x] = x+1;
            int temp = num[x];
            int y = (int)(rnd.nextDouble() * (x + 1));
            num[x] = num[y];
            num[y] = temp;
        }
        return num;
    }
}
