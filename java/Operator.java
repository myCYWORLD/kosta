public class Operator{
    public static void main(String[] args){
        int a,b,c;
        a = 10;
        b = 3;
        c = a + b;
        System.out.println(c);
        c = a%b;
        System.out.println(c);
        
        short s1, s2, s3;
        s1 = 10;
        s2 = 3;
        
        // short가 담을수 있는 공간을 넘어서서 오류가 나옴
        // short 는 연산을 하려고 하면 int로 자동형변환이 된다.
        // int로 형변환된 s1, s2를 다시 short타입으로 강제 형변환 해주어 연산을 함
        s3 = (short)(s1+s2);
        
        float f;
        a = 10;
        b = 3;
        f = a+b;
        System.out.println(f);
        
        f = a/b;
        System.out.println(f);
        
        a += 10;
        System.out.println(a);
        
        a = 10;
        System.out.println(a%2 == 0);
        
    }
}