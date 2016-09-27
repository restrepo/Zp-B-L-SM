! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:27 on 27.9.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_ZpBminusLSM 
 
Use Control 
Use Model_Data_ZpBminusLSM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters106(g,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,              & 
& Ye,Yv,Yu,MUP,mu)

Implicit None 
Real(dp), Intent(in) :: g(106) 
Real(dp),Intent(out) :: g1,gBY,g2,g3,gBL,gYB

Complex(dp),Intent(out) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters106' 
 
g1= g(1) 
gBY= g(2) 
g2= g(3) 
g3= g(4) 
gBL= g(5) 
gYB= g(6) 
lam2= Cmplx(g(7),g(8),dp) 
lam3= Cmplx(g(9),g(10),dp) 
lam1= Cmplx(g(11),g(12),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yx(i1,i2) = Cmplx( g(SumI+13), g(SumI+14), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+67), g(SumI+68), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+85), g(SumI+86), dp) 
End Do 
 End Do 
 
MUP= Cmplx(g(103),g(104),dp) 
mu= Cmplx(g(105),g(106),dp) 
Do i1=1,106 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters106

Subroutine ParametersToG106(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,             & 
& Yv,Yu,MUP,mu,g)

Implicit None 
Real(dp), Intent(out) :: g(106) 
Real(dp), Intent(in) :: g1,gBY,g2,g3,gBL,gYB

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG106' 
 
g(1) = g1  
g(2) = gBY  
g(3) = g2  
g(4) = g3  
g(5) = gBL  
g(6) = gYB  
g(7) = Real(lam2,dp)  
g(8) = Aimag(lam2)  
g(9) = Real(lam3,dp)  
g(10) = Aimag(lam3)  
g(11) = Real(lam1,dp)  
g(12) = Aimag(lam1)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+13) = Real(Yx(i1,i2), dp) 
g(SumI+14) = Aimag(Yx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yd(i1,i2), dp) 
g(SumI+32) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Ye(i1,i2), dp) 
g(SumI+50) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+67) = Real(Yv(i1,i2), dp) 
g(SumI+68) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+85) = Real(Yu(i1,i2), dp) 
g(SumI+86) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

g(103) = Real(MUP,dp)  
g(104) = Aimag(MUP)  
g(105) = Real(mu,dp)  
g(106) = Aimag(mu)  
Iname = Iname - 1 
 
End Subroutine ParametersToG106

Subroutine rge106(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,gBY,betagBY1,betagBY2,DgBY,g2,betag21,             & 
& betag22,Dg2,g3,betag31,betag32,Dg3,gBL,betagBL1,betagBL2,DgBL,gYB,betagYB1,            & 
& betagYB2,DgYB
Complex(dp) :: lam2,betalam21,betalam22,Dlam2,lam3,betalam31,betalam32,               & 
& Dlam3,lam1,betalam11,betalam12,Dlam1,Yx(3,3),betaYx1(3,3),betaYx2(3,3),DYx(3,3)        & 
& ,adjYx(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)              & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Yv(3,3),betaYv1(3,3),betaYv2(3,3)       & 
& ,DYv(3,3),adjYv(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)             & 
& ,MUP,betaMUP1,betaMUP2,DMUP,mu,betamu1,betamu2,Dmu
Iname = Iname +1 
NameOfUnit(Iname) = 'rge106' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters106(gy,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,             & 
& Yu,MUP,mu)

Call Adjungate(Yx,adjYx)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yv,adjYv)
Call Adjungate(Yu,adjYu)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! gBY 
!-------------------- 
 
betagBY1  = 0

 
 
If (TwoLoopRGE) Then 
betagBY2 = 0

 
DgBY = oo16pi2*( betagBY1 + oo16pi2 * betagBY2 ) 

 
Else 
DgBY = oo16pi2* betagBY1 
End If 
 
 
If (.not.KineticMixing) DgBY  = 0._dp 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! gYB 
!-------------------- 
 
betagYB1  = 0

 
 
If (TwoLoopRGE) Then 
betagYB2 = 0

 
DgYB = oo16pi2*( betagYB1 + oo16pi2 * betagYB2 ) 

 
Else 
DgYB = oo16pi2* betagYB1 
End If 
 
 
If (.not.KineticMixing) DgYB  = 0._dp 
!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! Yx 
!-------------------- 
 
betaYx1  = 0

 
 
If (TwoLoopRGE) Then 
betaYx2 = 0

 
DYx = oo16pi2*( betaYx1 + oo16pi2 * betaYx2 ) 

 
Else 
DYx = oo16pi2* betaYx1 
End If 
 
 
Call Chop(DYx) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = 0

 
 
If (TwoLoopRGE) Then 
betaYv2 = 0

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! MUP 
!-------------------- 
 
betaMUP1  = 0

 
 
If (TwoLoopRGE) Then 
betaMUP2 = 0

 
DMUP = oo16pi2*( betaMUP1 + oo16pi2 * betaMUP2 ) 

 
Else 
DMUP = oo16pi2* betaMUP1 
End If 
 
 
Call Chop(DMUP) 

!-------------------- 
! mu 
!-------------------- 
 
betamu1  = 0

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
Call Chop(Dmu) 

Call ParametersToG106(Dg1,DgBY,Dg2,Dg3,DgBL,DgYB,Dlam2,Dlam3,Dlam1,DYx,               & 
& DYd,DYe,DYv,DYu,DMUP,Dmu,f)

Iname = Iname - 1 
 
End Subroutine rge106  

Subroutine GToParameters108(g,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,              & 
& Ye,Yv,Yu,MUP,mu,v,vX)

Implicit None 
Real(dp), Intent(in) :: g(108) 
Real(dp),Intent(out) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp),Intent(out) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters108' 
 
g1= g(1) 
gBY= g(2) 
g2= g(3) 
g3= g(4) 
gBL= g(5) 
gYB= g(6) 
lam2= Cmplx(g(7),g(8),dp) 
lam3= Cmplx(g(9),g(10),dp) 
lam1= Cmplx(g(11),g(12),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yx(i1,i2) = Cmplx( g(SumI+13), g(SumI+14), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+67), g(SumI+68), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+85), g(SumI+86), dp) 
End Do 
 End Do 
 
MUP= Cmplx(g(103),g(104),dp) 
mu= Cmplx(g(105),g(106),dp) 
v= g(107) 
vX= g(108) 
Do i1=1,108 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters108

Subroutine ParametersToG108(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,             & 
& Yv,Yu,MUP,mu,v,vX,g)

Implicit None 
Real(dp), Intent(out) :: g(108) 
Real(dp), Intent(in) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG108' 
 
g(1) = g1  
g(2) = gBY  
g(3) = g2  
g(4) = g3  
g(5) = gBL  
g(6) = gYB  
g(7) = Real(lam2,dp)  
g(8) = Aimag(lam2)  
g(9) = Real(lam3,dp)  
g(10) = Aimag(lam3)  
g(11) = Real(lam1,dp)  
g(12) = Aimag(lam1)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+13) = Real(Yx(i1,i2), dp) 
g(SumI+14) = Aimag(Yx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yd(i1,i2), dp) 
g(SumI+32) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Ye(i1,i2), dp) 
g(SumI+50) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+67) = Real(Yv(i1,i2), dp) 
g(SumI+68) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+85) = Real(Yu(i1,i2), dp) 
g(SumI+86) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

g(103) = Real(MUP,dp)  
g(104) = Aimag(MUP)  
g(105) = Real(mu,dp)  
g(106) = Aimag(mu)  
g(107) = v  
g(108) = vX  
Iname = Iname - 1 
 
End Subroutine ParametersToG108

Subroutine rge108(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,gBY,betagBY1,betagBY2,DgBY,g2,betag21,             & 
& betag22,Dg2,g3,betag31,betag32,Dg3,gBL,betagBL1,betagBL2,DgBL,gYB,betagYB1,            & 
& betagYB2,DgYB,v,betav1,betav2,Dv,vX,betavX1,betavX2,DvX
Complex(dp) :: lam2,betalam21,betalam22,Dlam2,lam3,betalam31,betalam32,               & 
& Dlam3,lam1,betalam11,betalam12,Dlam1,Yx(3,3),betaYx1(3,3),betaYx2(3,3),DYx(3,3)        & 
& ,adjYx(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)              & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Yv(3,3),betaYv1(3,3),betaYv2(3,3)       & 
& ,DYv(3,3),adjYv(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)             & 
& ,MUP,betaMUP1,betaMUP2,DMUP,mu,betamu1,betamu2,Dmu
Iname = Iname +1 
NameOfUnit(Iname) = 'rge108' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters108(gy,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,             & 
& Yu,MUP,mu,v,vX)

Call Adjungate(Yx,adjYx)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yv,adjYv)
Call Adjungate(Yu,adjYu)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! gBY 
!-------------------- 
 
betagBY1  = 0

 
 
If (TwoLoopRGE) Then 
betagBY2 = 0

 
DgBY = oo16pi2*( betagBY1 + oo16pi2 * betagBY2 ) 

 
Else 
DgBY = oo16pi2* betagBY1 
End If 
 
 
If (.not.KineticMixing) DgBY  = 0._dp 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! gYB 
!-------------------- 
 
betagYB1  = 0

 
 
If (TwoLoopRGE) Then 
betagYB2 = 0

 
DgYB = oo16pi2*( betagYB1 + oo16pi2 * betagYB2 ) 

 
Else 
DgYB = oo16pi2* betagYB1 
End If 
 
 
If (.not.KineticMixing) DgYB  = 0._dp 
!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! Yx 
!-------------------- 
 
betaYx1  = 0

 
 
If (TwoLoopRGE) Then 
betaYx2 = 0

 
DYx = oo16pi2*( betaYx1 + oo16pi2 * betaYx2 ) 

 
Else 
DYx = oo16pi2* betaYx1 
End If 
 
 
Call Chop(DYx) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = 0

 
 
If (TwoLoopRGE) Then 
betaYv2 = 0

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! MUP 
!-------------------- 
 
betaMUP1  = 0

 
 
If (TwoLoopRGE) Then 
betaMUP2 = 0

 
DMUP = oo16pi2*( betaMUP1 + oo16pi2 * betaMUP2 ) 

 
Else 
DMUP = oo16pi2* betaMUP1 
End If 
 
 
Call Chop(DMUP) 

!-------------------- 
! mu 
!-------------------- 
 
betamu1  = 0

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
Call Chop(Dmu) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = 0

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
!-------------------- 
! vX 
!-------------------- 
 
betavX1  = 0

 
 
If (TwoLoopRGE) Then 
betavX2 = 0

 
DvX = oo16pi2*( betavX1 + oo16pi2 * betavX2 ) 

 
Else 
DvX = oo16pi2* betavX1 
End If 
 
 
Call ParametersToG108(Dg1,DgBY,Dg2,Dg3,DgBL,DgYB,Dlam2,Dlam3,Dlam1,DYx,               & 
& DYd,DYe,DYv,DYu,DMUP,Dmu,Dv,DvX,f)

Iname = Iname - 1 
 
End Subroutine rge108  

End Module RGEs_ZpBminusLSM 
 
