! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:05 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_ZpBminusLSM
 
Use Control 
Use Model_Data_ZpBminusLSM 
Use Couplings_ZpBminusLSM 
Use LoopCouplings_ZpBminusLSM 
Use Tadpoles_ZpBminusLSM 
 Use TreeLevelMasses_ZpBminusLSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),          & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvVWmL,cplcFeFvVWmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),              & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFuVWmL,cplcFdFuVWmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),              & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_VZ_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,       & 
& cplhhVZVZp,cplcVWmVWmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3), & 
& cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVZVZ(2),cplhhVZVZp(2),           & 
& cplcVWmVWmVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZ_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,TWp,cplcVWmVWmVZ)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZ_decays_2B
 
Subroutine CouplingsFor_VWm_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplFvFecVWmL,cplFvFecVWmR,cplhhcVWmVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),            & 
& cplhhcVWmVWm(2),cplcVWmVWmVZ,cplcVWmVWmVZp

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,TWp,cplcVWmVWmVZ)



cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWm_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplHiggsPP,cplHiggsGG,         & 
& cplHiggsZZvirt,cplHiggsWWvirt,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cplcFdFdhhL(3,3,2),   & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),cplhhhhhh(2,2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHm,ratVWm

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHm,ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
v=vSM
Ye=YeSM
Yd=YdSM
Yu=YuSM
g1=g1SM
g2=g2SM
g3=g3SM
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWmVWm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
ratHm = 0._dp 
ratVWm = -0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHm,ratVWm,MFd,MFe,MFu,            & 
& MHm,MVWm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHm,MVWm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha))**2 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ))**2 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
End Do 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2)**2 
rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2)**2 
Do i2=1, 6
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
End Do 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_VZp_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdVZpL,cplcFdFdVZpR,     & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplhhVZVZp,cplhhVZpVZp,cplcVWmVWmVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),              & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplhhVZVZp(2),   & 
& cplhhVZpVZp(2),cplcVWmVWmVZp

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZp_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZp_decays_2B
 
Subroutine CouplingsFor_Fv_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,              & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_3B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,          & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,              & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeFvVWmL(3,6),& 
& cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),            & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,          & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,              & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),             & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Subroutine CouplingsFor_VZp_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,          & 
& cplcFuFuVZpR,cplcFuFuVZR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,              & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),             & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),             & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZp_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZp_decays_3B
 
Subroutine CouplingsFor_hh_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,        & 
& MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,              & 
& ZULinput,ZAinput,ZHinput,UVinput,ZWinput,ZZinput,g1input,gBYinput,g2input,             & 
& g3input,gBLinput,gYBinput,lam2input,lam3input,lam1input,Yxinput,Ydinput,               & 
& Yeinput,Yvinput,Yuinput,MUPinput,muinput,vinput,vXinput,cplAhAhhh,cplAhhhVZ,           & 
& cplAhhhVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuFdcHmL,cplcFuFdcHmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplFvFecHmL,cplFvFecHmR,             & 
& cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhcHmVWm,cplhhhhhh,cplhhHmcHm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,gBYinput,g2input,g3input,gBLinput,gYBinput,vinput,vXinput

Complex(dp),Intent(in) :: lam2input,lam3input,lam1input,Yxinput(3,3),Ydinput(3,3),Yeinput(3,3),Yvinput(3,3),    & 
& Yuinput(3,3),MUPinput,muinput

Real(dp),Intent(in) :: MAhinput(2),MAh2input(2),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(2),Mhh2input(2),            & 
& MHminput,MHm2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,       & 
& TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(6,6),ZWinput(2,2)

Real(dp) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp),Intent(out) :: cplAhAhhh(2,2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),& 
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

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHm,ratVWm

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHm,ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
gBY = gBYinput 
g2 = g2input 
g3 = g3input 
gBL = gBLinput 
gYB = gYBinput 
lam2 = lam2input 
lam3 = lam3input 
lam1 = lam1input 
Yx = Yxinput 
Yd = Ydinput 
Ye = Yeinput 
Yv = Yvinput 
Yu = Yuinput 
MUP = MUPinput 
mu = muinput 
v = vinput 
vX = vXinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
v=vSM
Ye=YeSM
Yd=YdSM
Yu=YuSM
g1=g1SM
g2=g2SM
g3=g3SM
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& .True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZH = ZHinput 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcHmT(gt1,lam3,lam1,v,vX,ZH,cplhhHmcHm(gt1))

End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmT(gt1,g2,ZH,cplhhcHmVWm(gt1))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvAhT(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2)            & 
& ,cplcFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHmL = 0._dp 
cplFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplFvFecHmL(gt1,gt2),cplFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_ZpBminusLSM
