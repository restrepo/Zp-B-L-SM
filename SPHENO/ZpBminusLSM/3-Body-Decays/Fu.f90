! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:27 on 27.9.2016   
! ----------------------------------------------------------------------  
 
 
Module Fu3Decays_ZpBminusLSM 
 
Use Control 
Use CouplingsForDecays_ZpBminusLSM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FuThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,               & 
& Yv,Yu,MUP,mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,              & 
& gFuFucFuFu,gFuFuFvFv,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Complex(dp) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Real(dp),Intent(in) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp),Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Real(dp),Intent(inout) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,6),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),      & 
& gFuFuFvFv(3,3,6,6)

Real(dp),Intent(in) :: gThh(2),gTVWm,gTVZ,gTVZp

Real(dp) :: gFuFucFdFdi(3,3,3),gFuFdcFeFvi(3,3,6),gFuFucFeFei(3,3,3),gFuFucFuFui(3,3,3),          & 
& gFuFuFvFvi(3,6,6)

Real(dp) :: gThhtemp(2),gTVWmtemp,gTVZtemp,gTVZptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FuThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gThhtemp = 0._dp 
gTVWmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZptemp = 0._dp 
Else 
gThhtemp = gThh 
gTVWmtemp = gTVWm 
gTVZtemp = gTVZ 
gTVZptemp = gTVZp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fu_decays_3B(MFu(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,             & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,            & 
& Yx,Yd,Ye,Yv,Yu,MUP,mu,v,vX,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,           & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFehhL,cplcFeFehhR,            & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,          & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,     & 
& cplFvFvVZR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFuFucFdFdi = 0._dp 
Call FuToFucFdFd(i_run,MFu,MFd,MVZ,MVZp,MVWm,Mhh,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst,          & 
& gTVZtemp,gTVZptemp,gTVWmtemp,gThhtemp,deltaM,epsI,check,gFuFucFdFdi)

gFuFucFdFd(i_run,:,:,:) = gFuFucFdFdi 
gT(i_run) = gT(i_run) + Sum(gFuFucFdFdi) 
 
gFuFdcFeFvi = 0._dp 
Call FuToFdcFeFv(i_run,MFd,MFe,MFv,MVWm,MFu,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWmtemp,deltaM,epsI,check,           & 
& gFuFdcFeFvi)

gFuFdcFeFv(i_run,:,:,:) = gFuFdcFeFvi 
gT(i_run) = gT(i_run) + Sum(gFuFdcFeFvi) 
 
gFuFucFeFei = 0._dp 
Call FuToFucFeFe(i_run,MFu,MFe,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralVs,              & 
& IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gThhtemp,       & 
& deltaM,epsI,check,gFuFucFeFei)

gFuFucFeFe(i_run,:,:,:) = gFuFucFeFei 
gT(i_run) = gT(i_run) + Sum(gFuFucFeFei) 
 
gFuFucFuFui = 0._dp 
Call FuToFucFuFu(i_run,MFu,MVZ,MVZp,Mhh,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,          & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralSSst,            & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZptemp,gThhtemp,deltaM,epsI,             & 
& check,gFuFucFuFui)

gFuFucFuFu(i_run,:,:,:) = gFuFucFuFui 
gT(i_run) = gT(i_run) + Sum(gFuFucFuFui) 
 
gFuFuFvFvi = 0._dp 
Call FuToFuFvFv(i_run,MFu,MFv,MVZ,MVZp,Mhh,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,       & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,               & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gThhtemp,deltaM,             & 
& epsI,check,gFuFuFvFvi)

gFuFuFvFv(i_run,:,:,:) = gFuFuFvFvi 
gT(i_run) = gT(i_run) + Sum(gFuFuFvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gFuFdcFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFuFucFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gFuFuFvFv(i1,gt1,gt2,gt3)
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
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FuThreeBodyDecay
 
 
Subroutine FuToFucFdFd(iIN,MFu,MFd,MVZ,MVZp,MVWm,Mhh,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst,          & 
& gTVZ,gTVZp,gTVWm,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFd(3),MVZ,MVZp,MVWm,Mhh(2)

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),               & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12),IntegralVSst(500000,16),              & 
& IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTVWm,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 25 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[VWm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdcVWmL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFdcVWmR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFuVWmL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFuVWmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: hh" 
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
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[VWm] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWmR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWm]'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, conj[VWm] 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWmR(iIN,gt3))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZp,conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[VWm]'



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  conj[VWm], hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWmL(gt2,gt1) 
coup2(6) = cplcFdFuVWmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFdFd 
 
 
Subroutine FuToFdcFeFv(iIN,MFd,MFe,MFv,MVWm,MFu,cplcFeFvVWmL,cplcFeFvVWmR,            & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWm,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFv(6),MVWm,MFu(3)

Complex(dp),Intent(in) :: cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWm

Integer, Intent(inout) :: NVs,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  conj[VWm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFvVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFe Fv Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



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
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFdcFeFv 
 
 
Subroutine FuToFucFeFe(iIN,MFu,MFe,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,             & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,             & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),              & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh" 
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
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFeFe 
 
 
Subroutine FuToFucFuFu(iIN,MFu,MVZ,MVZp,Mhh,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralSSst,            & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZp,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),              & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuVZpL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuVZpR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt3) 
coup2(2) = cplcFuFuVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplcFuFuVZpL(gt2,gt1) 
coup2(6) = cplcFuFuVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i1))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh" 
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
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZpL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFuVZpR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuVZpL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFuVZpR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt3) 
coup2(2) = cplcFuFuVZpR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt1) 
coup2(6) = cplcFuFuVZpR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt3) 
coup2(2) = cplcFuFuVZpR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt1) 
coup2(6) = cplcFuFuVZpR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh,hh" 
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
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFuFu 
 
 
Subroutine FuToFuFvFv(iIN,MFu,MFv,MVZ,MVZp,Mhh,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,      & 
& IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,gThh,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(6),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),              & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt3,gt2) 
coup2(6) = cplFvFvVZpR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt3,gt2,i1) 
coup2(6) = cplFvFvhhR(gt3,gt2,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: hh" 
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
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZpL(iIN,gt1) 
coup2(2) = cplcFuFuVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFuFvFv 
 
 
End Module Fu3Decays_ZpBminusLSM 
 
