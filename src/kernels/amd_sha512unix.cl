

#define SET_AB(ai1,ii1,bb) { \
	ai1[(ii1)>>3] |= (((ulong)(bb)) << (((7-ii1)&7)<<3)); \
	}


#define SET_AIF(ai1,ai2,ii1,ii2) { \
	ai1[(ii1)>>3] = (ai2); \
	}

#define SET_AIS(ai1,ai2,ii1,ii2) { \
        tmp1=(uint)(((ii1)&7)<<3); \
        elem=(uint)((ii1)>>3); \
        tmp2 = (ulong)ai1[elem]; \
        ai1[elem] = (ulong)(tmp2 |((ai2)>>tmp1)); \
        ai1[elem+1] = select(ai2<<(64-tmp1),(ulong)0,(ulong)(tmp1==0));\
        }

#define gli get_local_id(0)



#define ROTATE(b,x)     (((x) >> (b)) | ((x) << (64U - (b))))
#define R(b,x)          ((x) >> (b))
#define Ch(x,y,z)       ((z)^((x)&((y)^(z))))
#define Maj(x,y,z)      (((x) & (y)) | ((z)&((x)|(y))))

#define Sigma0_512(x)   (ROTATE(28U, (x)) ^ ROTATE(34U, (x)) ^ ROTATE(39U, (x)))
#define Sigma1_512(x)   (ROTATE(14U, (x)) ^ ROTATE(18U, (x)) ^ ROTATE(41U, (x)))
#define sigma0_512(x)   (ROTATE(1U, (x)) ^ ROTATE(8U, (x)) ^ R(7U,   (x)))
#define sigma1_512(x)   (ROTATE(19U, (x)) ^ ROTATE(61U, (x)) ^ R(6U,   (x)))


#define ROUND512_0_TO_15(a,b,c,d,e,f,g,h,AC,x) T1 = (h) + Sigma1_512(e) + Ch((e), (f), (g)) + AC + x; \
                                                (d) += T1; (h) = T1 + Sigma0_512(a) + Maj((a), (b), (c))

#define ROUND512_0_TO_15_NL(a,b,c,d,e,f,g,h,AC) T1 = (h) + Sigma1_512(e) + Ch((e), (f), (g)) + AC; \
                                                (d) += T1; (h) = T1 + Sigma0_512(a) + Maj((a), (b), (c))

#define ROUND512(a,b,c,d,e,f,g,h,AC,x)  T1 = (h) + Sigma1_512(e) + Ch((e), (f), (g)) + AC + x;\
                                        (d) += T1; (h) = T1 + Sigma0_512(a) + Maj((a), (b), (c)); 

#define H0 0x6a09e667f3bcc908L
#define H1 0xbb67ae8584caa73bL
#define H2 0x3c6ef372fe94f82bL
#define H3 0xa54ff53a5f1d36f1L
#define H4 0x510e527fade682d1L
#define H5 0x9b05688c2b3e6c1fL
#define H6 0x1f83d9abfb41bd6bL
#define H7 0x5be0cd19137e2179L

#define AC1  0x428a2f98d728ae22L
#define AC2  0x7137449123ef65cdL
#define AC3  0xb5c0fbcfec4d3b2fL
#define AC4  0xe9b5dba58189dbbcL
#define AC5  0x3956c25bf348b538L
#define AC6  0x59f111f1b605d019L
#define AC7  0x923f82a4af194f9bL
#define AC8  0xab1c5ed5da6d8118L
#define AC9  0xd807aa98a3030242L
#define AC10 0x12835b0145706fbeL
#define AC11 0x243185be4ee4b28cL
#define AC12 0x550c7dc3d5ffb4e2L
#define AC13 0x72be5d74f27b896fL
#define AC14 0x80deb1fe3b1696b1L
#define AC15 0x9bdc06a725c71235L
#define AC16 0xc19bf174cf692694L
#define AC17 0xe49b69c19ef14ad2L
#define AC18 0xefbe4786384f25e3L
#define AC19 0x0fc19dc68b8cd5b5L
#define AC20 0x240ca1cc77ac9c65L
#define AC21 0x2de92c6f592b0275L
#define AC22 0x4a7484aa6ea6e483L
#define AC23 0x5cb0a9dcbd41fbd4L
#define AC24 0x76f988da831153b5L
#define AC25 0x983e5152ee66dfabL
#define AC26 0xa831c66d2db43210L
#define AC27 0xb00327c898fb213fL
#define AC28 0xbf597fc7beef0ee4L
#define AC29 0xc6e00bf33da88fc2L
#define AC30 0xd5a79147930aa725L
#define AC31 0x06ca6351e003826fL
#define AC32 0x142929670a0e6e70L
#define AC33 0x27b70a8546d22ffcL
#define AC34 0x2e1b21385c26c926L
#define AC35 0x4d2c6dfc5ac42aedL
#define AC36 0x53380d139d95b3dfL
#define AC37 0x650a73548baf63deL
#define AC38 0x766a0abb3c77b2a8L
#define AC39 0x81c2c92e47edaee6L
#define AC40 0x92722c851482353bL
#define AC41 0xa2bfe8a14cf10364L
#define AC42 0xa81a664bbc423001L
#define AC43 0xc24b8b70d0f89791L
#define AC44 0xc76c51a30654be30L
#define AC45 0xd192e819d6ef5218L
#define AC46 0xd69906245565a910L
#define AC47 0xf40e35855771202aL
#define AC48 0x106aa07032bbd1b8L
#define AC49 0x19a4c116b8d2d0c8L
#define AC50 0x1e376c085141ab53L
#define AC51 0x2748774cdf8eeb99L
#define AC52 0x34b0bcb5e19b48a8L
#define AC53 0x391c0cb3c5c95a63L
#define AC54 0x4ed8aa4ae3418acbL
#define AC55 0x5b9cca4f7763e373L
#define AC56 0x682e6ff3d6b2b8a3L
#define AC57 0x748f82ee5defb2fcL
#define AC58 0x78a5636f43172f60L
#define AC59 0x84c87814a1f0ab72L
#define AC60 0x8cc702081a6439ecL
#define AC61 0x90befffa23631e28L
#define AC62 0xa4506cebde82bde9L
#define AC63 0xbef9a3f7b2c67915L
#define AC64 0xc67178f2e372532bL
#define AC64 0xc67178f2e372532bL
#define AC65 0xca273eceea26619cL
#define AC66 0xd186b8c721c0c207L
#define AC67 0xeada7dd6cde0eb1eL
#define AC68 0xf57d4f7fee6ed178L
#define AC69 0x06f067aa72176fbaL
#define AC70 0x0a637dc5a2c898a6L
#define AC71 0x113f9804bef90daeL
#define AC72 0x1b710b35131c471bL
#define AC73 0x28db77f523047d84L
#define AC74 0x32caab7b40c72493L
#define AC75 0x3c9ebe0a15c9bebcL
#define AC76 0x431d67c49c100d4cL
#define AC77 0x4cc5d4becb3e42b6L
#define AC78 0x597f299cfc657e2aL
#define AC79 0x5fcb6fab3ad6faecL
#define AC80 0x6c44198c4a475817L


#ifndef GCN
#define Endian_Reverse64(a)  (((a) & 0x00000000000000FFL) << 56 | ((a) & 0x000000000000FF00L) << 40 | \
                              ((a) & 0x0000000000FF0000L) << 24 | ((a) & 0x00000000FF000000L) << 8 | \
                              ((a) & 0x000000FF00000000L) >> 8 | ((a) & 0x0000FF0000000000L) >> 24 | \
                              ((a) & 0x00FF000000000000L) >> 40 | ((a) & 0xFF00000000000000L) >> 56)
#else
#define Endian_Reverse64(n)       (as_ulong(as_uchar8(n).s76543210))
#endif



__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix15( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{

ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];

A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)15;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)7;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)7;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;


ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);

A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}


A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);



if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}




__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix14( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{

ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)14;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)6;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)6;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);


//found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}






__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix13( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{

ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)13;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)5;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)5;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);


//found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}





__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix12( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)12;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)4;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)4;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);


//found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}




__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix11( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{

ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)11;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)3;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)3;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);


//found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}




__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix10( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt)
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)10;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)2;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)2;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii<<3);

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);


//found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}






__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix9( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)9;

w[0]=pbytes[gli][0];
w[1]=pbytes[gli][1];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)1;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)8;
SET_AIS(w,pbytes[gli][1],ii,8);ii+=(uint)1;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);



found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);

}





__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix8( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;


sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)8;

w[0]=pbytes[gli][0];
w[1]=(ulong)0;
w[2]=(ulong)0;
w[3]=(ulong)0;
w[4]=(ulong)0;
w[5]=(ulong)0;
w[6]=(ulong)0;
w[7]=(ulong)0;

}


if (ic % 3 != 0)
{
jj=ii;
SET_AIF(w,sbytes[gli][0],ii,0);ii+=(uint)8;
ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIF(w,pbytes[gli][0],ii,0);ii+=(uint)8;
ii=jj+8;//tsize
}

if ((ic&1)==0)
{
jj=ii;
SET_AIF(w,pbytes[gli][0],ii,0);ii+=(uint)8;
ii=jj+8;//tsize
}
else
{
SET_AIF(w,alt[0],ii,0);ii+=(uint)8;
SET_AIF(w,alt[1],ii,8);ii+=(uint)8;
SET_AIF(w,alt[2],ii,16);ii+=(uint)8;
SET_AIF(w,alt[3],ii,24);ii+=(uint)8;
SET_AIF(w,alt[4],ii,32);ii+=(uint)8;
SET_AIF(w,alt[5],ii,40);ii+=(uint)8;
SET_AIF(w,alt[6],ii,48);ii+=(uint)8;
SET_AIF(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);

}



__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix7( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)7;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)7;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)7;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}




__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix6( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)6;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)6;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)6;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}






__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix5( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)5;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)5;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)5;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}





__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix4( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)4;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)4;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)4;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}




__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix3( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)3;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)3;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)3;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}





__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix2( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)2;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)2;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)2;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}






__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix1( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
ulong A,B,C,D,E,F,G,H,jj,T1,tmp2;
uint ii,tmp1,elem;
__local ulong sbytes[64][1];
__local ulong pbytes[64][2];
uint ic;
__private ulong w[17]; 
ulong alt[8]; 
ulong SIZE;

sbytes[gli][0]=input[(get_global_id(0)*11)];
A=input[(get_global_id(0)*11)+1];
B=input[(get_global_id(0)*11)+2];
C=input[(get_global_id(0)*11)+3];
D=input[(get_global_id(0)*11)+4];
E=input[(get_global_id(0)*11)+5];
F=input[(get_global_id(0)*11)+6];
G=input[(get_global_id(0)*11)+7];
H=input[(get_global_id(0)*11)+8];
pbytes[gli][0]=input[(get_global_id(0)*11)+9];
pbytes[gli][1]=input[(get_global_id(0)*11)+10];
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);
pbytes[gli][0]=Endian_Reverse64(pbytes[gli][0]);
pbytes[gli][1]=Endian_Reverse64(pbytes[gli][1]);
sbytes[gli][0]=Endian_Reverse64(sbytes[gli][0]);


for (ic=0;ic<5000;ic++)
{
w[0]=w[1]=w[2]=w[3]=w[4]=w[5]=w[6]=w[7]=w[8]=w[9]=w[10]=w[11]=w[12]=w[13]=w[14]=w[16]=(ulong)0;

if ((ic&1)==0)
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)0;

w[0]=A;
w[1]=B;
w[2]=C;
w[3]=D;
w[4]=E;
w[5]=F;
w[6]=G;
w[7]=H;
ii=(uint)64;
}

else
{
alt[0]=A;
alt[1]=B;
alt[2]=C;
alt[3]=D;
alt[4]=E;
alt[5]=F;
alt[6]=G;
alt[7]=H;
ii=(uint)1;

w[0]=pbytes[gli][0];
}


if (ic % 3 != 0)
{
jj=ii;
SET_AIS(w,sbytes[gli][0],ii,0);ii+=(uint)8;
//ii=jj+8;
}

if (ic % 7 != 0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)1;
//ii=jj+9;
}

if ((ic&1)==0)
{
jj=ii;
SET_AIS(w,pbytes[gli][0],ii,0);ii+=(uint)1;
//ii=jj+9;
}
else
{
SET_AIS(w,alt[0],ii,0);ii+=(uint)8;
SET_AIS(w,alt[1],ii,8);ii+=(uint)8;
SET_AIS(w,alt[2],ii,16);ii+=(uint)8;
SET_AIS(w,alt[3],ii,24);ii+=(uint)8;
SET_AIS(w,alt[4],ii,32);ii+=(uint)8;
SET_AIS(w,alt[5],ii,40);ii+=(uint)8;
SET_AIS(w,alt[6],ii,48);ii+=(uint)8;
SET_AIS(w,alt[7],ii,56);ii+=(uint)8;
}


SET_AB(w,ii,0x80);

SIZE=(ulong)(ii)<<3;

A=(ulong)H0;
B=(ulong)H1;
C=(ulong)H2;
D=(ulong)H3;
E=(ulong)H4;
F=(ulong)H5;
G=(ulong)H6;
H=(ulong)H7;

ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC1,w[0]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC2,w[1]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC3,w[2]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC4,w[3]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC5,w[4]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC6,w[5]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC7,w[6]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,AC8,w[7]);
ROUND512_0_TO_15(A,B,C,D,E,F,G,H,AC9,w[8]);
ROUND512_0_TO_15(H,A,B,C,D,E,F,G,AC10,w[9]);
ROUND512_0_TO_15(G,H,A,B,C,D,E,F,AC11,w[10]);
ROUND512_0_TO_15(F,G,H,A,B,C,D,E,AC12,w[11]);
ROUND512_0_TO_15(E,F,G,H,A,B,C,D,AC13,w[12]);
ROUND512_0_TO_15(D,E,F,G,H,A,B,C,AC14,w[13]);
ROUND512_0_TO_15(C,D,E,F,G,H,A,B,AC15,w[14]);
ROUND512_0_TO_15(B,C,D,E,F,G,H,A,SIZE,AC16);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(A,B,C,D,E,F,G,H,w[16],AC17);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(H,A,B,C,D,E,F,G,w[0],AC18);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(G,H,A,B,C,D,E,F,w[1],AC19);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(F,G,H,A,B,C,D,E,w[2],AC20);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(E,F,G,H,A,B,C,D,w[3],AC21);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(D,E,F,G,H,A,B,C,w[4],AC22);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(C,D,E,F,G,H,A,B,w[5],AC23);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(B,C,D,E,F,G,H,A,w[6],AC24);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(A,B,C,D,E,F,G,H,w[7],AC25);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(H,A,B,C,D,E,F,G,w[8],AC26);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(G,H,A,B,C,D,E,F,w[9],AC27);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(F,G,H,A,B,C,D,E,w[10],AC28);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(E,F,G,H,A,B,C,D,w[11],AC29);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(D,E,F,G,H,A,B,C,w[12],AC30);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(C,D,E,F,G,H,A,B,w[13],AC31);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(B,C,D,E,F,G,H,A,w[14],AC32);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(A,B,C,D,E,F,G,H,SIZE,AC33);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(H,A,B,C,D,E,F,G,w[16],AC34);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(G,H,A,B,C,D,E,F,w[0],AC35);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(F,G,H,A,B,C,D,E,w[1],AC36);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(E,F,G,H,A,B,C,D,w[2],AC37);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(D,E,F,G,H,A,B,C,w[3],AC38);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(C,D,E,F,G,H,A,B,w[4],AC39);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(B,C,D,E,F,G,H,A,w[5],AC40);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(A,B,C,D,E,F,G,H,w[6],AC41);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(H,A,B,C,D,E,F,G,w[7],AC42);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(G,H,A,B,C,D,E,F,w[8],AC43);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(F,G,H,A,B,C,D,E,w[9],AC44);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(E,F,G,H,A,B,C,D,w[10],AC45);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(D,E,F,G,H,A,B,C,w[11],AC46);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(C,D,E,F,G,H,A,B,w[12],AC47);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(B,C,D,E,F,G,H,A,w[13],AC48);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(A,B,C,D,E,F,G,H,w[14],AC49);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(H,A,B,C,D,E,F,G,SIZE,AC50);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(G,H,A,B,C,D,E,F,w[16],AC51);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(F,G,H,A,B,C,D,E,w[0],AC52);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(E,F,G,H,A,B,C,D,w[1],AC53);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(D,E,F,G,H,A,B,C,w[2],AC54);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(C,D,E,F,G,H,A,B,w[3],AC55);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(B,C,D,E,F,G,H,A,w[4],AC56);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(A,B,C,D,E,F,G,H,w[5],AC57);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(H,A,B,C,D,E,F,G,w[6],AC58);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(G,H,A,B,C,D,E,F,w[7],AC59);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(F,G,H,A,B,C,D,E,w[8],AC60);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(E,F,G,H,A,B,C,D,w[9],AC61);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(D,E,F,G,H,A,B,C,w[10],AC62);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(C,D,E,F,G,H,A,B,w[11],AC63);
w[12] = sigma1_512(w[10])+w[5]+sigma0_512(w[14])+w[13]; ROUND512(B,C,D,E,F,G,H,A,w[12],AC64);
w[13] = sigma1_512(w[11])+w[6]+sigma0_512(SIZE)+w[14]; ROUND512(A,B,C,D,E,F,G,H,w[13],AC65);
w[14] = sigma1_512(w[12])+w[7]+sigma0_512(w[16])+SIZE; ROUND512(H,A,B,C,D,E,F,G,w[14],AC66);
SIZE = sigma1_512(w[13])+w[8]+sigma0_512(w[0])+w[16]; ROUND512(G,H,A,B,C,D,E,F,SIZE,AC67);
w[16] = sigma1_512(w[14])+w[9]+sigma0_512(w[1])+w[0]; ROUND512(F,G,H,A,B,C,D,E,w[16],AC68);
w[0] = sigma1_512(SIZE)+w[10]+sigma0_512(w[2])+w[1]; ROUND512(E,F,G,H,A,B,C,D,w[0],AC69);
w[1] = sigma1_512(w[16])+w[11]+sigma0_512(w[3])+w[2]; ROUND512(D,E,F,G,H,A,B,C,w[1],AC70);
w[2] = sigma1_512(w[0])+w[12]+sigma0_512(w[4])+w[3]; ROUND512(C,D,E,F,G,H,A,B,w[2],AC71);
w[3] = sigma1_512(w[1])+w[13]+sigma0_512(w[5])+w[4]; ROUND512(B,C,D,E,F,G,H,A,w[3],AC72);
w[4] = sigma1_512(w[2])+w[14]+sigma0_512(w[6])+w[5]; ROUND512(A,B,C,D,E,F,G,H,w[4],AC73);
w[5] = sigma1_512(w[3])+SIZE+sigma0_512(w[7])+w[6]; ROUND512(H,A,B,C,D,E,F,G,w[5],AC74);
w[6] = sigma1_512(w[4])+w[16]+sigma0_512(w[8])+w[7]; ROUND512(G,H,A,B,C,D,E,F,w[6],AC75);
w[7] = sigma1_512(w[5])+w[0]+sigma0_512(w[9])+w[8]; ROUND512(F,G,H,A,B,C,D,E,w[7],AC76);
w[8] = sigma1_512(w[6])+w[1]+sigma0_512(w[10])+w[9]; ROUND512(E,F,G,H,A,B,C,D,w[8],AC77);
w[9] = sigma1_512(w[7])+w[2]+sigma0_512(w[11])+w[10]; ROUND512(D,E,F,G,H,A,B,C,w[9],AC78);
w[10] = sigma1_512(w[8])+w[3]+sigma0_512(w[12])+w[11]; ROUND512(C,D,E,F,G,H,A,B,w[10],AC79);
w[11] = sigma1_512(w[9])+w[4]+sigma0_512(w[13])+w[12]; ROUND512(B,C,D,E,F,G,H,A,w[11],AC80);
A+=(ulong)H0;
B+=(ulong)H1;
C+=(ulong)H2;
D+=(ulong)H3;
E+=(ulong)H4;
F+=(ulong)H5;
G+=(ulong)H6;
H+=(ulong)H7;
}
A=Endian_Reverse64(A);
B=Endian_Reverse64(B);
C=Endian_Reverse64(C);
D=Endian_Reverse64(D);
E=Endian_Reverse64(E);
F=Endian_Reverse64(F);
G=Endian_Reverse64(G);
H=Endian_Reverse64(H);

found_ind[get_global_id(0)] = 0;

if ((ulong)singlehash.s0!=A) return;
if ((ulong)singlehash.s1!=B) return;

found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0))] = (ulong8)(A,B,C,D,E,F,G,H);
}






__kernel void __attribute__((reqd_work_group_size(64, 1, 1))) 
sha512unix0( __global ulong8 *dst,  __global ulong *input,   __global uint *found_ind, __global uint *found,  ulong8 singlehash, uint16 salt) 
{
found[0] = 0;
}


