! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:01 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module hh3Decays_ZpBminusLSM 
 
Use Control 
Use CouplingsForDecays_ZpBminusLSM 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine hhThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,               & 
& Yv,Yu,MUP,mu,v,vX,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,ghhAhFvFv,ghhhhFdcFd,               & 
& ghhcHmFdcFu,ghhcHmFeFv,ghhhhFecFe,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,CheckRealStates,    & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Complex(dp) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),& 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),              & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),              & 
& cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),cplcFuFdcVWmL(3,3),& 
& cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFecHmL(6,3),cplFvFecHmR(6,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),& 
& cplFvFvAhL(6,6,2),cplFvFvAhR(6,6,2),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),               & 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplhhcHmVWm(2),      & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2)

Real(dp),Intent(in) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp),Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Real(dp),Intent(inout) :: ghhAhFdcFd(2,2,3,3),ghhAhFecFe(2,2,3,3),ghhAhFucFu(2,2,3,3),ghhAhFvFv(2,2,6,6),       & 
& ghhhhFdcFd(2,2,3,3),ghhcHmFdcFu(2,1,3,3),ghhcHmFeFv(2,1,3,6),ghhhhFecFe(2,2,3,3),      & 
& ghhhhFucFu(2,2,3,3),ghhhhFvFv(2,2,6,6)

Real(dp) :: ghhAhFdcFdi(2,3,3),ghhAhFecFei(2,3,3),ghhAhFucFui(2,3,3),ghhAhFvFvi(2,6,6),           & 
& ghhhhFdcFdi(2,3,3),ghhcHmFdcFui(1,3,3),ghhcHmFeFvi(1,3,6),ghhhhFecFei(2,3,3),          & 
& ghhhhFucFui(2,3,3),ghhhhFvFvi(2,6,6)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'hhThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 2 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 2) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,2) = ',n_in,2 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_hh_decays_3B(Mhh(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,             & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,            & 
& Yx,Yd,Ye,Yv,Yu,MUP,mu,v,vX,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,        & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFecHmL,cplFvFecHmR,cplFvFecVWmL,cplFvFecVWmR,            & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplFvFvVZR,cplhhcHmVWm,cplhhhhhh,cplhhHmcHm,deltaM)


 
ghhAhFdcFdi = 0._dp 
Call hhToAhFdcFd(i_run,MAh,MFd,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,deltaM,epsI,check,ghhAhFdcFdi)

ghhAhFdcFd(i_run,:,:,:) = ghhAhFdcFdi 
gT(i_run) = gT(i_run) + Sum(ghhAhFdcFdi) 
 
ghhAhFecFei = 0._dp 
Call hhToAhFecFe(i_run,MAh,MFe,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,ghhAhFecFei)

ghhAhFecFe(i_run,:,:,:) = ghhAhFecFei 
gT(i_run) = gT(i_run) + Sum(ghhAhFecFei) 
 
ghhAhFucFui = 0._dp 
Call hhToAhFucFu(i_run,MAh,MFu,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,deltaM,epsI,check,ghhAhFucFui)

ghhAhFucFu(i_run,:,:,:) = ghhAhFucFui 
gT(i_run) = gT(i_run) + Sum(ghhAhFucFui) 
 
ghhAhFvFvi = 0._dp 
Call hhToAhFvFv(i_run,MAh,MFv,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,            & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,deltaM,epsI,check,ghhAhFvFvi)

ghhAhFvFv(i_run,:,:,:) = ghhAhFvFvi 
gT(i_run) = gT(i_run) + Sum(ghhAhFvFvi) 
 
ghhhhFdcFdi = 0._dp 
Call hhTohhFdcFd(i_run,Mhh,MFd,cplhhhhhh,cplcFdFdhhL,cplcFdFdhhR,deltaM,              & 
& epsI,check,ghhhhFdcFdi)

ghhhhFdcFd(i_run,:,:,:) = ghhhhFdcFdi 
gT(i_run) = gT(i_run) + Sum(ghhhhFdcFdi) 
 
ghhcHmFdcFui = 0._dp 
Call hhTocHmFdcFu(i_run,MHm,MFd,MFu,MVWm,Mhh,cplhhcHmVWm,cplhhHmcHm,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,deltaM,epsI,check,ghhcHmFdcFui)

ghhcHmFdcFu(i_run,:,:,:) = ghhcHmFdcFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(ghhcHmFdcFui) 
 
ghhcHmFeFvi = 0._dp 
Call hhTocHmFeFv(i_run,MHm,MFe,MFv,MVWm,Mhh,cplhhcHmVWm,cplhhHmcHm,cplcFeFehhL,       & 
& cplcFeFehhR,cplFvFecHmL,cplFvFecHmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,              & 
& cplFvFvhhR,deltaM,epsI,check,ghhcHmFeFvi)

ghhcHmFeFv(i_run,:,:,:) = ghhcHmFeFvi 
gT(i_run) = gT(i_run) + 2._dp*Sum(ghhcHmFeFvi) 
 
ghhhhFecFei = 0._dp 
Call hhTohhFecFe(i_run,Mhh,MFe,cplhhhhhh,cplcFeFehhL,cplcFeFehhR,deltaM,              & 
& epsI,check,ghhhhFecFei)

ghhhhFecFe(i_run,:,:,:) = ghhhhFecFei 
gT(i_run) = gT(i_run) + Sum(ghhhhFecFei) 
 
ghhhhFucFui = 0._dp 
Call hhTohhFucFu(i_run,Mhh,MFu,cplhhhhhh,cplcFuFuhhL,cplcFuFuhhR,deltaM,              & 
& epsI,check,ghhhhFucFui)

ghhhhFucFu(i_run,:,:,:) = ghhhhFucFui 
gT(i_run) = gT(i_run) + Sum(ghhhhFucFui) 
 
ghhhhFvFvi = 0._dp 
Call hhTohhFvFv(i_run,Mhh,MFv,cplhhhhhh,cplFvFvhhL,cplFvFvhhR,deltaM,epsI,            & 
& check,ghhhhFvFvi)

ghhhhFvFv(i_run,:,:,:) = ghhhhFvFvi 
gT(i_run) = gT(i_run) + Sum(ghhhhFvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=3,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhAhFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhAhFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhAhFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,2
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= ghhAhFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhhhFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*ghhcHmFdcFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,1
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= 2._dp*ghhcHmFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhhhFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= ghhhhFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= ghhhhFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Iname = Iname - 1 
 
End Subroutine hhThreeBodyDecay
 
 
Subroutine hhToAhFdcFd(iIN,MAh,MFd,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MFd(3),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),& 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 49 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/Mhh(iIN))**2 
rm2 = (MFd(gt3)/Mhh(iIN))**2 
rj2 = (MAh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhAhhh(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFdFdhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhhhVZp(gt1,iIN) 
coup(5) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFd2(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZ,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fd]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZp(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZpR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFd2(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZp(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: VZp,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,bar[Fd]'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhhh(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: Ah,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdhhL(i1,gt2,iIN) 
coup(2) = cplcFdFdhhR(i1,gt2,iIN) 
coup(3) = cplcFdFdAhL(gt3,i1,gt1) 
coup(4) = cplcFdFdAhR(gt3,i1,gt1) 
coup(5) = cplcFdFdhhL(i2,gt2,iIN) 
coup(6) = cplcFdFdhhR(i2,gt2,iIN)  
coup(7) = cplcFdFdAhL(gt3,i2,gt1) 
coup(8) = cplcFdFdAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fd cFd Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhToAhFdcFd 
 
 
Subroutine hhToAhFecFe(iIN,MAh,MFe,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MFe(3),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 49 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/Mhh(iIN))**2 
rm2 = (MFe(gt3)/Mhh(iIN))**2 
rj2 = (MAh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhAhhh(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFeFehhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFehhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhhhVZp(gt1,iIN) 
coup(5) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFe2(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(gt1,iIN) 
coup(7) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZ,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fe]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZp(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZpR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFe2(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZp(gt1,iIN) 
coup(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: VZp,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,bar[Fe]'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhhh(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(i1,gt1,iIN) 
coup(7) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: Ah,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFehhL(i1,gt2,iIN) 
coup(2) = cplcFeFehhR(i1,gt2,iIN) 
coup(3) = cplcFeFeAhL(gt3,i1,gt1) 
coup(4) = cplcFeFeAhR(gt3,i1,gt1) 
coup(5) = cplcFeFehhL(i2,gt2,iIN) 
coup(6) = cplcFeFehhR(i2,gt2,iIN)  
coup(7) = cplcFeFeAhL(gt3,i2,gt1) 
coup(8) = cplcFeFeAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fe cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhToAhFecFe 
 
 
Subroutine hhToAhFucFu(iIN,MAh,MFu,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MFu(3),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),& 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 49 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/Mhh(iIN))**2 
rm2 = (MFu(gt3)/Mhh(iIN))**2 
rj2 = (MAh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhAhhh(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFuFuhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFuhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhhhVZp(gt1,iIN) 
coup(5) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, bar[Fu] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFuhhL(i2,gt2,iIN) 
coup(2) = cplcFuFuhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZ(gt1,iIN) 
coup(7) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZ,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Fu]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZp(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZpR(gt3,gt2))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, bar[Fu] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFuhhL(i2,gt2,iIN) 
coup(2) = cplcFuFuhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhhhVZp(gt1,iIN) 
coup(7) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: VZp,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,bar[Fu]'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhhh(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuhhL(i2,gt2,iIN) 
coup(2) = cplcFuFuhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(gt3,i2,gt1))  
coup(5) = cplAhAhhh(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: Ah,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFuhhL(i1,gt2,iIN) 
coup(2) = cplcFuFuhhR(i1,gt2,iIN) 
coup(3) = cplcFuFuAhL(gt3,i1,gt1) 
coup(4) = cplcFuFuAhR(gt3,i1,gt1) 
coup(5) = cplcFuFuhhL(i2,gt2,iIN) 
coup(6) = cplcFuFuhhR(i2,gt2,iIN)  
coup(7) = cplcFuFuAhL(gt3,i2,gt1) 
coup(8) = cplcFuFuAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fu cFu Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,2
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhToAhFucFu 
 
 
Subroutine hhToAhFvFv(iIN,MAh,MFv,MVZ,MVZp,Mhh,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MFv(6),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplFvFvAhL(6,6,2),cplFvFvAhR(6,6,2),  & 
& cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),  & 
& cplFvFvVZpR(6,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 100 
Allocate( gSum(2,6,6, Isum) ) 
Allocate( Contribution(2,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,2
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
rk2 = (MFv(gt2)/Mhh(iIN))**2 
rm2 = (MFv(gt3)/Mhh(iIN))**2 
rj2 = (MAh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZ(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MVZ 
mass(2) = MVZ 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZ(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZL(gt3,gt2)) 
coup(2) = Conjg(cplFvFvVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZp(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZpR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MVZp 
mass(2) = MVZp 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhhhVZp(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZpL(gt3,gt2)) 
coup(2) = Conjg(cplFvFvVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhAhhh(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplAhAhhh(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhAhhh(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhAhhh(i1,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplFvFvhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFvhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplFvFvhhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvhhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFvAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i1,gt2,iIN) 
coup(6) = cplFvFvhhR(i1,gt2,iIN)  
coup(7) = cplFvFvAhL(i1,gt3,gt1) 
coup(8) = cplFvFvAhR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(3) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhhhVZp(gt1,iIN) 
coup(5) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZ(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, Fv 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvhhL(i2,gt2,iIN) 
coup(2) = cplFvFvhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhhhVZ(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt2,gt1))  
coup(5) = cplAhhhVZ(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZ,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fv'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplAhhhVZp(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, Fv 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvhhL(i2,gt2,iIN) 
coup(2) = cplFvFvhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhhhVZp(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZp2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt2,gt1))  
coup(5) = cplAhhhVZp(gt1,iIN) 
coup(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: VZp,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Fv'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhAhhh(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhAhhh(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvhhL(i2,gt2,iIN) 
coup(2) = cplFvFvhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhAhhh(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvAhR(i2,gt2,gt1))  
coup(5) = cplAhAhhh(i1,gt1,iIN) 
coup(7) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: Ah,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt2,iIN) 
coup(2) = cplFvFvhhR(i1,gt2,iIN) 
coup(3) = cplFvFvAhL(i1,gt3,gt1) 
coup(4) = cplFvFvAhR(i1,gt3,gt1) 
coup(5) = cplFvFvhhL(i2,gt2,iIN) 
coup(6) = cplFvFvhhR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i2,gt2,iIN) 
coup(6) = cplFvFvhhR(i2,gt2,iIN)  
coup(7) = cplFvFvAhL(i2,gt3,gt1) 
coup(8) = cplFvFvAhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvAhL(i1,gt2,gt1) 
coup(4) = cplFvFvAhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFvAhL(i2,gt2,gt1) 
coup(8) = cplFvFvAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt2,iIN) 
coup(2) = cplFvFvhhR(i1,gt2,iIN) 
coup(3) = cplFvFvAhL(i1,gt3,gt1) 
coup(4) = cplFvFvAhR(i1,gt3,gt1) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFvAhL(i2,gt2,gt1) 
coup(8) = cplFvFvAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->Ah Fv Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,2
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhToAhFvFv 
 
 
Subroutine hhTohhFdcFd(iIN,Mhh,MFd,cplhhhhhh,cplcFdFdhhL,cplcFdFdhhR,deltaM,          & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(2),MFd(3)

Complex(dp),Intent(in) :: cplhhhhhh(2,2,2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 25 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/Mhh(iIN))**2 
rm2 = (MFd(gt3)/Mhh(iIN))**2 
rj2 = (Mhh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhhhhh(iIN,i1,gt1)) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fd cFd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFdFdhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fd cFd Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd]'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplhhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fd cFd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt3,i2,gt1))  
coup(5) = cplhhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fd cFd Propagator: hh,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdhhL(i1,gt2,iIN) 
coup(2) = cplcFdFdhhR(i1,gt2,iIN) 
coup(3) = cplcFdFdhhL(gt3,i1,gt1) 
coup(4) = cplcFdFdhhR(gt3,i1,gt1) 
coup(5) = cplcFdFdhhL(i2,gt2,iIN) 
coup(6) = cplcFdFdhhR(i2,gt2,iIN)  
coup(7) = cplcFdFdhhL(gt3,i2,gt1) 
coup(8) = cplcFdFdhhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fd cFd Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhTohhFdcFd 
 
 
Subroutine hhTocHmFdcFu(iIN,MHm,MFd,MFu,MVWm,Mhh,cplhhcHmVWm,cplhhHmcHm,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,         & 
& cplcFuFuhhL,cplcFuFuhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHm,MFd(3),MFu(3),MVWm,Mhh(2)

Complex(dp),Intent(in) :: cplhhcHmVWm(2),cplhhHmcHm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3), & 
& cplcFuFdcHmR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),            & 
& cplcFuFuhhR(3,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 64 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/Mhh(iIN))**2 
rm2 = (MFu(gt3)/Mhh(iIN))**2 
rj2 = (MHm/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MHm))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhcHmVWm(iIN)) 
coup(3) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFdcVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHm 
mass(2) = MHm 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhHmcHm(iIN)) 
coup(3) = Conjg(cplcFuFdcHmL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFdcHmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Hm'



!-------------- 
!  bar[Fd] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFdFdhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFdFdhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFdcHmL(gt3,i1)) 
coup(3) = Conjg(cplcFuFdcHmR(gt3,i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fd]'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFuFuhhL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcFuFuhhR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFuFdcHmL(i1,gt2)) 
coup(3) = Conjg(cplcFuFdcHmR(i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  VWm, Hm 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHm  
coup(1) = cplhhcHmVWm(iIN) 
coup(2) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
coup(4) = cplhhHmcHm(iIN) 
coup(5) = Conjg(cplcFuFdcHmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcHmR(gt3,gt2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: VWm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,Hm'



!-------------- 
!  VWm, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFd2(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFdcHmL(gt3,i2)) 
coup(3) = Conjg(cplcFuFdcHmR(gt3,i2))  
coup(5) = cplhhcHmVWm(iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: VWm,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,bar[Fd]'
      End Do 



!-------------- 
!  VWm, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFu2(i2)  
coup(1) = cplcFuFuhhL(gt3,i2,iIN) 
coup(2) = cplcFuFuhhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFuFdcHmL(i2,gt2)) 
coup(3) = Conjg(cplcFuFdcHmR(i2,gt2))  
coup(5) = cplhhcHmVWm(iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 3*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: VWm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,Fu'
      End Do 



!-------------- 
!  Hm, bar[Fd] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHm  
mass(1) = MFd(i2)  
coup(1) = cplcFdFdhhL(i2,gt2,iIN) 
coup(2) = cplcFdFdhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFdcHmL(gt3,i2)) 
coup(3) = Conjg(cplcFuFdcHmR(gt3,i2))  
coup(5) = cplhhHmcHm(iIN) 
coup(7) = Conjg(cplcFuFdcHmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcHmR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: Hm,bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Hm,bar[Fd]'
      End Do 



!-------------- 
!  Hm, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHm  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuhhL(gt3,i2,iIN) 
coup(2) = cplcFuFuhhR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFuFdcHmL(i2,gt2)) 
coup(3) = Conjg(cplcFuFdcHmR(i2,gt2))  
coup(5) = cplhhHmcHm(iIN) 
coup(7) = Conjg(cplcFuFdcHmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcHmR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: Hm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Hm,Fu'
      End Do 



!-------------- 
!  bar[Fd], bar[Fd] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplcFdFdhhL(i1,gt2,iIN) 
coup(2) = cplcFdFdhhR(i1,gt2,iIN) 
coup(3) = cplcFuFdcHmL(gt3,i1) 
coup(4) = cplcFuFdcHmR(gt3,i1) 
coup(5) = cplcFdFdhhL(i2,gt2,iIN) 
coup(6) = cplcFdFdhhR(i2,gt2,iIN)  
coup(7) = cplcFuFdcHmL(gt3,i2) 
coup(8) = cplcFuFdcHmR(gt3,i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: bar[Fd],bar[Fd]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fd],bar[Fd]'
        End Do 
      End Do 



!-------------- 
!  bar[Fd], Fu 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFdFdhhL(i1,gt2,iIN) 
coup(2) = cplcFdFdhhR(i1,gt2,iIN) 
coup(3) = cplcFuFdcHmL(gt3,i1) 
coup(4) = cplcFuFdcHmR(gt3,i1) 
coup(5) = cplcFuFuhhL(gt3,i2,iIN) 
coup(6) = cplcFuFuhhR(gt3,i2,iIN)  
coup(7) = cplcFuFdcHmL(i2,gt2) 
coup(8) = cplcFuFdcHmR(i2,gt2) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: bar[Fd],Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fd],Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFuhhL(gt3,i1,iIN) 
coup(2) = cplcFuFuhhR(gt3,i1,iIN) 
coup(3) = cplcFuFdcHmL(i1,gt2) 
coup(4) = cplcFuFdcHmR(i1,gt2) 
coup(5) = cplcFuFuhhL(gt3,i2,iIN) 
coup(6) = cplcFuFuhhR(gt3,i2,iIN)  
coup(7) = cplcFuFdcHmL(i2,gt2) 
coup(8) = cplcFuFdcHmR(i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fd cFu Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:64))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
End Subroutine hhTocHmFdcFu 
 
 
Subroutine hhTocHmFeFv(iIN,MHm,MFe,MFv,MVWm,Mhh,cplhhcHmVWm,cplhhHmcHm,               & 
& cplcFeFehhL,cplcFeFehhR,cplFvFecHmL,cplFvFecHmR,cplFvFecVWmL,cplFvFecVWmR,             & 
& cplFvFvhhL,cplFvFvhhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHm,MFe(3),MFv(6),MVWm,Mhh(2)

Complex(dp),Intent(in) :: cplhhcHmVWm(2),cplhhHmcHm(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplFvFecHmL(6,3),  & 
& cplFvFecHmR(6,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 121 
Allocate( gSum(1,3,6, Isum) ) 
Allocate( Contribution(1,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFe(gt2)/Mhh(iIN))**2 
rm2 = (MFv(gt3)/Mhh(iIN))**2 
rj2 = (MHm/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MHm))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhcHmVWm(iIN)) 
coup(3) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(2) = Conjg(cplFvFecVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHm 
mass(2) = MHm 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhHmcHm(iIN)) 
coup(3) = Conjg(cplFvFecHmL(gt3,gt2)) 
coup(2) = Conjg(cplFvFecHmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Hm'



!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFeFehhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFehhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFecHmL(gt3,i1)) 
coup(3) = Conjg(cplFvFecHmR(gt3,i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplFvFvhhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvhhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFecHmL(i1,gt2)) 
coup(3) = Conjg(cplFvFecHmR(i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VWm, Hm 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHm  
coup(1) = cplhhcHmVWm(iIN) 
coup(2) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(3) = Conjg(cplFvFecVWmR(gt3,gt2))  
coup(4) = cplhhHmcHm(iIN) 
coup(5) = Conjg(cplFvFecHmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecHmR(gt3,gt2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: VWm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,Hm'



!-------------- 
!  VWm, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFe2(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFecHmL(gt3,i2)) 
coup(3) = Conjg(cplFvFecHmR(gt3,i2))  
coup(5) = cplhhcHmVWm(iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: VWm,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,bar[Fe]'
      End Do 



!-------------- 
!  VWm, Fv 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFv2(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFecHmL(i2,gt2)) 
coup(3) = Conjg(cplFvFecHmR(i2,gt2))  
coup(5) = cplhhcHmVWm(iIN) 
coup(7) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: VWm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='VWm,Fv'
      End Do 



!-------------- 
!  Hm, bar[Fe] 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHm  
mass(1) = MFe(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFecHmL(gt3,i2)) 
coup(3) = Conjg(cplFvFecHmR(gt3,i2))  
coup(5) = cplhhHmcHm(iIN) 
coup(7) = Conjg(cplFvFecHmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecHmR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: Hm,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Hm,bar[Fe]'
      End Do 



!-------------- 
!  Hm, Fv 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHm  
mass(1) = MFv(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFecHmL(i2,gt2)) 
coup(3) = Conjg(cplFvFecHmR(i2,gt2))  
coup(5) = cplhhHmcHm(iIN) 
coup(7) = Conjg(cplFvFecHmL(gt3,gt2)) 
coup(6) = Conjg(cplFvFecHmR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: Hm,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Hm,Fv'
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFehhL(i1,gt2,iIN) 
coup(2) = cplcFeFehhR(i1,gt2,iIN) 
coup(3) = cplFvFecHmL(gt3,i1) 
coup(4) = cplFvFecHmR(gt3,i1) 
coup(5) = cplcFeFehhL(i2,gt2,iIN) 
coup(6) = cplcFeFehhR(i2,gt2,iIN)  
coup(7) = cplFvFecHmL(gt3,i2) 
coup(8) = cplFvFecHmR(gt3,i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], Fv 
!-------------- 
Do i1=1,3
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFv(i2)  
coup(1) = cplcFeFehhL(i1,gt2,iIN) 
coup(2) = cplcFeFehhR(i1,gt2,iIN) 
coup(3) = cplFvFecHmL(gt3,i1) 
coup(4) = cplFvFecHmR(gt3,i1) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFecHmL(i2,gt2) 
coup(8) = cplFvFecHmR(i2,gt2) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: bar[Fe],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='bar[Fe],Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFecHmL(i1,gt2) 
coup(4) = cplFvFecHmR(i1,gt2) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFecHmL(i2,gt2) 
coup(8) = cplFvFecHmR(i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->cHm Fe Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,6
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:121))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
End Subroutine hhTocHmFeFv 
 
 
Subroutine hhTohhFecFe(iIN,Mhh,MFe,cplhhhhhh,cplcFeFehhL,cplcFeFehhR,deltaM,          & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(2),MFe(3)

Complex(dp),Intent(in) :: cplhhhhhh(2,2,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 25 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/Mhh(iIN))**2 
rm2 = (MFe(gt3)/Mhh(iIN))**2 
rj2 = (Mhh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhhhhh(iIN,i1,gt1)) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fe cFe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFeFehhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFeFehhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeFehhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fe cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplhhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fe cFe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFehhL(i2,gt2,iIN) 
coup(2) = cplcFeFehhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeFehhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i2,gt1))  
coup(5) = cplhhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fe cFe Propagator: hh,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFehhL(i1,gt2,iIN) 
coup(2) = cplcFeFehhR(i1,gt2,iIN) 
coup(3) = cplcFeFehhL(gt3,i1,gt1) 
coup(4) = cplcFeFehhR(gt3,i1,gt1) 
coup(5) = cplcFeFehhL(i2,gt2,iIN) 
coup(6) = cplcFeFehhR(i2,gt2,iIN)  
coup(7) = cplcFeFehhL(gt3,i2,gt1) 
coup(8) = cplcFeFehhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fe cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhTohhFecFe 
 
 
Subroutine hhTohhFucFu(iIN,Mhh,MFu,cplhhhhhh,cplcFuFuhhL,cplcFuFuhhR,deltaM,          & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(2),MFu(3)

Complex(dp),Intent(in) :: cplhhhhhh(2,2,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 25 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/Mhh(iIN))**2 
rm2 = (MFu(gt3)/Mhh(iIN))**2 
rj2 = (Mhh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhhhhh(iIN,i1,gt1)) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fu cFu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  bar[Fu] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplcFuFuhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcFuFuhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fu cFu Propagator: bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu]'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplhhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fu cFu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplcFuFuhhL(i2,gt2,iIN) 
coup(2) = cplcFuFuhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(gt3,i2,gt1))  
coup(5) = cplhhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fu cFu Propagator: hh,bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fu]'
        End Do 
      End Do 



!-------------- 
!  bar[Fu], bar[Fu] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplcFuFuhhL(i1,gt2,iIN) 
coup(2) = cplcFuFuhhR(i1,gt2,iIN) 
coup(3) = cplcFuFuhhL(gt3,i1,gt1) 
coup(4) = cplcFuFuhhR(gt3,i1,gt1) 
coup(5) = cplcFuFuhhL(i2,gt2,iIN) 
coup(6) = cplcFuFuhhR(i2,gt2,iIN)  
coup(7) = cplcFuFuhhL(gt3,i2,gt1) 
coup(8) = cplcFuFuhhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fu cFu Propagator: bar[Fu],bar[Fu]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fu],bar[Fu]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhTohhFucFu 
 
 
Subroutine hhTohhFvFv(iIN,Mhh,MFv,cplhhhhhh,cplFvFvhhL,cplFvFvhhR,deltaM,             & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(2),MFv(6)

Complex(dp),Intent(in) :: cplhhhhhh(2,2,2),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = Mhh(iIN) 
 
Isum = 64 
Allocate( gSum(2,6,6, Isum) ) 
Allocate( Contribution(2,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
rk2 = (MFv(gt2)/Mhh(iIN))**2 
rm2 = (MFv(gt3)/Mhh(iIN))**2 
rj2 = (Mhh(gt1)/Mhh(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=Mhh(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(Mhh(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhhhhh(iIN,i1,gt1)) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = Mhh(iIN) 
coup(1) = Conjg(cplhhhhhh(iIN,i1,gt1)) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))  
coup(4) = cplhhhhhh(iIN,i1,gt1) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplFvFvhhL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvFvhhR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvFvhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = Mhh(iIN) 
coup(2) = Conjg(cplFvFvhhL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvFvhhR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFvhhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i1,gt2,iIN) 
coup(6) = cplFvFvhhR(i1,gt2,iIN)  
coup(7) = cplFvFvhhL(i1,gt3,gt1) 
coup(8) = cplFvFvhhR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fv Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhhhhh(iIN,i1,gt1) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
coup(4) = cplhhhhhh(iIN,i2,gt1) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fv 
!-------------- 
Do i1=1,2
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvhhL(i2,gt2,iIN) 
coup(2) = cplFvFvhhR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt3,gt1))  
coup(5) = cplhhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplFvFvhhL(i2,gt3,iIN) 
coup(2) = cplFvFvhhR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvFvhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvFvhhR(i2,gt2,gt1))  
coup(5) = cplhhhhhh(iIN,i1,gt1) 
coup(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fv Fv Propagator: hh,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt2,iIN) 
coup(2) = cplFvFvhhR(i1,gt2,iIN) 
coup(3) = cplFvFvhhL(i1,gt3,gt1) 
coup(4) = cplFvFvhhR(i1,gt3,gt1) 
coup(5) = cplFvFvhhL(i2,gt2,iIN) 
coup(6) = cplFvFvhhR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i2,gt2,iIN) 
coup(6) = cplFvFvhhR(i2,gt2,iIN)  
coup(7) = cplFvFvhhL(i2,gt3,gt1) 
coup(8) = cplFvFvhhR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt3,iIN) 
coup(2) = cplFvFvhhR(i1,gt3,iIN) 
coup(3) = cplFvFvhhL(i1,gt2,gt1) 
coup(4) = cplFvFvhhR(i1,gt2,gt1) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFvhhL(i2,gt2,gt1) 
coup(8) = cplFvFvhhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvFvhhL(i1,gt2,iIN) 
coup(2) = cplFvFvhhR(i1,gt2,iIN) 
coup(3) = cplFvFvhhL(i1,gt3,gt1) 
coup(4) = cplFvFvhhR(i1,gt3,gt1) 
coup(5) = cplFvFvhhL(i2,gt3,iIN) 
coup(6) = cplFvFvhhR(i2,gt3,iIN)  
coup(7) = cplFvFvhhL(i2,gt2,gt1) 
coup(8) = cplFvFvhhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "hh->hh Fv Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine hhTohhFvFv 
 
 
End Module hh3Decays_ZpBminusLSM 
 
