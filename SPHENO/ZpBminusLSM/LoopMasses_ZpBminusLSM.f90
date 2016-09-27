! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:27 on 27.9.2016   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_ZpBminusLSM 
 
Use Control 
Use Couplings_ZpBminusLSM 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_ZpBminusLSM 
Use StandardModel 
Use Tadpoles_ZpBminusLSM 
 Use TreeLevelMasses_ZpBminusLSM 
 
Real(dp), Private :: Mhh_1L(2), Mhh2_1L(2)  
Complex(dp), Private :: ZH_1L(2,2)  
Real(dp), Private :: MAh_1L(2), MAh2_1L(2)  
Complex(dp), Private :: ZA_1L(2,2)  
Real(dp), Private :: MFv_1L(6), MFv2_1L(6)  
Complex(dp), Private :: UV_1L(6,6)  
Real(dp), Private :: MHm_1L, MHm2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZp_1L, MVZp2_1L  
Real(dp), Private :: MVWm_1L, MVWm2_1L  
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,               & 
& Yu,MUP,mu,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,gBY,g2,g3,gBL,gYB

Complex(dp),Intent(inout) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Real(dp),Intent(inout) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp),Intent(inout) :: v,vX

Complex(dp) :: cplAhAhcVWmVWm(2,2),cplAhAhHmcHm(2,2),cplAhAhUhh(2,2,2),cplAhAhUhhUhh(2,2,2,2),       & 
& cplAhAhVZpVZp(2,2),cplAhAhVZVZ(2,2),cplAhcHmVWm(2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),     & 
& cplAhHmcVWm(2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUAhL(3,3,2),   & 
& cplcFdFdUAhR(3,3,2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFdFdVZL(3,3),          & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeFeUAhL(3,3,2),              & 
& cplcFeFeUAhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFeFeVZL(3,3),          & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),& 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuUAhL(3,3,2),cplcFuFuUAhR(3,3,2),         & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),            & 
& cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcgAgWmcVWm,cplcgWmgWmUAh(2),cplcgWmgWmUhh(2),    & 
& cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWmgZHm,cplcgWmgZpHm,cplcgWpCgAcVWm,cplcgWpCgWpCUAh(2), & 
& cplcgWpCgWpCUhh(2),cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHm,cplcgWpCgZcVWm,        & 
& cplcgWpCgZpcHm,cplcgWpCgZpcVWm,cplcgZgWmcHm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgZgZpUhh(2),& 
& cplcgZgZUhh(2),cplcgZpgWmcHm,cplcgZpgWmcVWm,cplcgZpgWpCHm,cplcgZpgZpUhh(2),            & 
& cplcgZpgZUhh(2),cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplcUFdFdAhL(3,3,2),              & 
& cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHmL(3,3),             & 
& cplcUFdFuHmR(3,3),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFeFeAhL(3,3,2),           & 
& cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),         & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFeVZR(3,3),cplcUFeFvHmL(3,6),cplcUFeFvHmR(3,6),cplcUFeFvVWmL(3,6),              & 
& cplcUFeFvVWmR(3,6),cplcUFuFdcHmL(3,3),cplcUFuFdcHmR(3,3),cplcUFuFdcVWmL(3,3),          & 
& cplcUFuFdcVWmR(3,3),cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),cplcUFuFuhhL(3,3,2),       & 
& cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),             & 
& cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),             & 
& cplcUFuFuVZR(3,3),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,            & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWm,cplcVWmVWmVZ,             & 
& cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplcVWmVWmVZVZ1,   & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplFvFecHmL(6,3),cplFvFecHmR(6,3),cplFvFecVWmL(6,3),   & 
& cplFvFecVWmR(6,3),cplFvFvUAhL(6,6,2),cplFvFvUAhR(6,6,2),cplFvFvUhhL(6,6,2),            & 
& cplFvFvUhhR(6,6,2),cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6),  & 
& cplhhcHmVWm(2),cplhhcVWmVWm(2),cplhhhhcVWmVWm(2,2),cplhhhhHmcHm(2,2),cplhhhhVZpVZp(2,2),& 
& cplhhhhVZVZ(2,2),cplhhHmcHm(2),cplhhHmcVWm(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHmcHmcVWmVWm,cplHmcHmVP,cplHmcHmVPVP,     & 
& cplHmcHmVZ,cplHmcHmVZp,cplHmcHmVZpVZp,cplHmcHmVZVZ,cplHmcVWmVP,cplHmcVWmVZ,            & 
& cplHmcVWmVZp,cplHmHmcHmcHm,cplUAhAhhh(2,2,2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2)

Complex(dp) :: cplUAhhhVZp(2,2),cplUAhHmcVWm(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhcVWmVWm(2,2),         & 
& cplUAhUAhhhhh(2,2,2,2),cplUAhUAhHmcHm(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhVZpVZp(2,2),    & 
& cplUAhUAhVZVZ(2,2),cplUFvFecHmL(6,3),cplUFvFecHmR(6,3),cplUFvFecVWmL(6,3),             & 
& cplUFvFecVWmR(6,3),cplUFvFvAhL(6,6,2),cplUFvFvAhR(6,6,2),cplUFvFvhhL(6,6,2),           & 
& cplUFvFvhhR(6,6,2),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),cplUFvFvVZL(6,6),cplUFvFvVZpL(6,6),& 
& cplUFvFvVZpR(6,6),cplUFvFvVZR(6,6),cplUhhcVWmVWm(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2),  & 
& cplUhhHmcVWm(2),cplUhhUhhcVWmVWm(2,2),cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2),      & 
& cplUhhUhhVPVP(2,2),cplUhhUhhVZpVZp(2,2),cplUhhUhhVZVZ(2,2),cplUhhVPVZ(2),              & 
& cplUhhVPVZp(2),cplUhhVZpVZp(2),cplUhhVZVZ(2),cplUhhVZVZp(2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Complex(dp) :: Tad1Loop(2), dmz2  
Real(dp) :: comp(2), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWm = RXi 
RXiZ = RXi 
RXiZp = RXi 

 ! Running angles 

 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& GenerationMixing,kont)

muTree  = mu
MUPTree  = MUP

 
 If (CalculateOneLoopMasses) Then 
 
Call CouplingsForVectorBosons(g2,ZA,ZH,g1,gBY,TW,TWp,v,gBL,gYB,UV,vX,ZDL,             & 
& ZUL,ZEL,cplAhcHmVWm,cplhhcHmVWm,cplHmcHmVZ,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,       & 
& cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ, & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,       & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplHmcVWmVZp,cplcVWmVWmVZp,            & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplAhHmcVWm,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,    & 
& cplcVWmVPVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,            & 
& cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVWmVZ,     & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,  & 
& kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
vSM=sqrt(vev2) 
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,              & 
& UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,               & 
& GenerationMixing,kont)

Call CouplingsForLoopMasses(lam2,lam3,lam1,v,vX,ZA,g1,g2,gYB,TW,gBL,gBY,              & 
& TWp,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,ZH,g3,cplAhAhUhh,cplAhUhhVP,             & 
& cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,            & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,            & 
& cplUhhHmcVWm,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,              & 
& cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,& 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,       & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,cplUAhUAhAhAh,          & 
& cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,             & 
& cplUAhUAhVZpVZp,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,        & 
& cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFuFuAhL,      & 
& cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,   & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplUFvFvAhL,       & 
& cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,         & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,              & 
& cplUFvFvVZpR,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,            & 
& cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,        & 
& cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,             & 
& cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm,cplhhhhHmcHm,            & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp,cplAhhhVZ,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,      & 
& cplcVWmVWmVZVZ3,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,        & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZpVZp,cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,         & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplAhHmcVWm,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,    & 
& cplcVWmVPVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,            & 
& cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)

Call OneLoopTadpoleshh(v,vX,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,cplcFdFdUhhL,              & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,        & 
& cplUhhHmcHm,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZpVZp,Tad1Loop(1:2))

muTree  = mu
MUPTree  = MUP
Call SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,              & 
& Yv,Yu,MUP,mu,v,vX,Tad1Loop)

mu1L = mu
MUP1L = MUP
Call OneLoophh(MUP1L,mu1L,lam2,lam3,lam1,v,vX,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,cplAhAhUhh,           & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,        & 
& cplUhhHmcHm,cplUhhHmcVWm,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,              & 
& cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,     & 
& cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,0.1_dp*delta_mass,Mhh_1L,               & 
& Mhh2_1L,ZH_1L,kont)

Call OneLoopAh(g1,g2,gBL,gBY,gYB,MUP1L,mu1L,lam2,lam3,lam1,v,vX,TW,TWp,               & 
& Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,             & 
& MVWm,MVWm2,MHm,MHm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,    & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,cplUAhUAhAhAh,cplUAhUAhhhhh,            & 
& cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,cplUAhUAhVZpVZp,           & 
& 0.1_dp*delta_mass,MAh_1L,MAh2_1L,ZA_1L,kont)

Call OneLoopFv(Yx,Yv,v,vX,MFv,MFv2,MAh,MAh2,MHm,MHm2,MFe,MFe2,MVWm,MVWm2,             & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,        & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,0.1_dp*delta_mass,MFv_1L,            & 
& MFv2_1L,UV_1L,kont)

Call OneLoopHm(g2,mu,lam3,lam1,v,vX,MVWm,MVWm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,            & 
& MFv,MFv2,MFe,MFe2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHmVWm,cplcFuFdcHmL,      & 
& cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,           & 
& cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,       & 
& cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,    & 
& cplAhAhHmcHm,cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,     & 
& cplHmcHmVZpVZp,0.1_dp*delta_mass,MHm_1L,MHm2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
ZA = ZA_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MHm = MHm_1L 
MHm2 = MHm2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,             & 
& ZH,UV,ZW,ZZ,kont)

! Set pole masses 
MVWm = mW 
MVWm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWm = 1._dp 
RXiZ = 1._dp 
RXiZp = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHm=MVWm
MHm2=MVWm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
mu  = muTree 
MUP  = MUPTree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(v,vX,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,cplcFdFdUhhL,         & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,        & 
& cplUhhHmcHm,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZpVZp,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),        & 
& cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplFvFvUhhL(6,6,2),        & 
& cplFvFvUhhR(6,6,2),cplcgWmgWmUhh(2),cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplcgZpgZpUhh(2),& 
& cplUhhhhhh(2,2,2),cplUhhHmcHm(2),cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplUhhVZpVZp(2)

Real(dp), Intent(in) :: v,vX

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(2)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 2
 A0m = A0(MAh2(i1)) 
  Do gO1 = 1, 2
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*A0(MFd2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*A0(MFe2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*A0(MFu2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 6
 A0m = 2._dp*MFv(i1)*A0(MFv2(i1)) 
  Do gO1 = 1, 2
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWm] 
!------------------------ 
A0m = 1._dp*A0(MVWm2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWmgWmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWmC] 
!------------------------ 
A0m = 1._dp*A0(MVWm2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWpCgWpCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*A0(MVZ2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZp] 
!------------------------ 
A0m = 1._dp*A0(MVZp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 2
 A0m = A0(Mhh2(i1)) 
  Do gO1 = 1, 2
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
A0m = A0(MHm2) 
  Do gO1 = 1, 2
   coup = cplUhhHmcHm(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWm] 
!------------------------ 
A0m = 3._dp*A0(MVWm2)+RXi*A0(MVWm2*RXi) - 2._dp*MVWm2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhcVWmVWm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*A0(MVZ2)+RXi*A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! VZp 
!------------------------ 
A0m = 3._dp*A0(MVZp2)+RXi*A0(MVZp2*RXi) - 2._dp*MVZp2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZpVZp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(MUP,mu,lam2,lam3,lam1,v,vX,MAh,MAh2,MVZ,MVZ2,MVZp,               & 
& MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,cplAhAhUhh,     & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,          & 
& cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,        & 
& cplUhhHmcHm,cplUhhHmcVWm,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,              & 
& cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,     & 
& cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MVZ,MVZ2,MVZp,MVZp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(6),MFv2(6),Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2

Real(dp), Intent(in) :: v,vX

Complex(dp), Intent(in) :: MUP,mu,lam2,lam3,lam1

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(3,3,2),& 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplFvFvUhhL(6,6,2),cplFvFvUhhR(6,6,2),cplcgWmgWmUhh(2),            & 
& cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),    & 
& cplUhhhhhh(2,2,2),cplUhhHmcHm(2),cplUhhHmcVWm(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWmVWm(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mu
mat2a(1,1) = mat2a(1,1)-3*lam1*v**2
mat2a(1,1) = mat2a(1,1)-(lam3*vX**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-(lam3*v*vX)
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+MUP
mat2a(2,2) = mat2a(2,2)-(lam3*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)-3*lam2*vX**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,        & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmcVWm,cplUhhVPVZ,             & 
& cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,             & 
& cplUhhUhhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplcgZpgZUhh,        & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmcVWm,cplUhhVPVZ,             & 
& cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,             & 
& cplUhhUhhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,       & 
& cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,          & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,        & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmcVWm,           & 
& cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,              & 
& cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,             & 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MVZ,MVZ2,MVZp,MVZp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(6),MFv2(6),Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(3,3,2),& 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplFvFvUhhL(6,6,2),cplFvFvUhhR(6,6,2),cplcgWmgWmUhh(2),            & 
& cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),    & 
& cplUhhhhhh(2,2,2),cplUhhHmcHm(2),cplUhhHmcVWm(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWmVWm(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,MAh2(i1),MAh2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZp(i2,gO1)
coup2 =  Conjg(cplAhUhhVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Gloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWmgWmUhh(gO1)
coup2 =  cplcgWmgWmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgWpCUhh(gO1)
coup2 =  cplcgWpCgWpCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZp], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZp2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Mhh2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHm2,MHm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmcHm(gO1)
coup2 = Conjg(cplUhhHmcHm(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], Hm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHm2,MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmcVWm(gO1)
coup2 =  Conjg(cplUhhHmcVWm(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVZ2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVZp2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZp(gO1)
coup2 =  Conjg(cplUhhVPVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWm2,MVWm2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWmVWm(gO1)
coup2 =  Conjg(cplUhhcVWmVWm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZ2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZp2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZp(gO1)
coup2 =  Conjg(cplUhhVZVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZp2,MVZp2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZpVZp(gO1)
coup2 =  Conjg(cplUhhVZpVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHmcHm(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWm2) + 0.25_dp*RXi*A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZp2) + 0.25_dp*RXi*A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopAh(g1,g2,gBL,gBY,gYB,MUP,mu,lam2,lam3,lam1,v,vX,TW,TWp,             & 
& Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,             & 
& MVWm,MVWm2,MHm,MHm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,    & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,cplUAhUAhAhAh,cplUAhUAhhhhh,            & 
& cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,cplUAhUAhVZpVZp,           & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MHm,MHm2

Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(in) :: MUP,mu,lam2,lam3,lam1

Complex(dp), Intent(in) :: cplUAhAhhh(2,2,2),cplcFdFdUAhL(3,3,2),cplcFdFdUAhR(3,3,2),cplcFeFeUAhL(3,3,2),        & 
& cplcFeFeUAhR(3,3,2),cplcFuFuUAhL(3,3,2),cplcFuFuUAhR(3,3,2),cplFvFvUAhL(6,6,2),        & 
& cplFvFvUAhR(6,6,2),cplcgWmgWmUAh(2),cplcgWpCgWpCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),& 
& cplUAhhhVZp(2,2),cplUAhHmcVWm(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),        & 
& cplUAhUAhHmcHm(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhcVWmVWm(2,2),cplUAhUAhVZVZ(2,2),       & 
& cplUAhUAhVZpVZp(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mu
mat2a(1,1) = mat2a(1,1)-(lam1*v**2)
mat2a(1,1) = mat2a(1,1)-(lam3*vX**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*v**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*v**2*Cos(TWp)**2*RXiZp)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*v**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*v**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,1) = mat2a(1,1)-(gBY*g2*v**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(gBY*g2*v**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)-(g1*gBY*v**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1*gBY*v**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(gBY**2*v**2*RXiZ*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*v**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*v**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*v**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+gBY*gBL*v*vX*Cos(TWp)**2*RXiZp
mat2a(1,2) = mat2a(1,2)+gYB*g2*v*vX*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW)
mat2a(1,2) = mat2a(1,2)+g1*gYB*v*vX*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat2a(1,2) = mat2a(1,2)-(gBL*g2*v*vX*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat2a(1,2) = mat2a(1,2)+gBL*g2*v*vX*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp)
mat2a(1,2) = mat2a(1,2)-(g1*gBL*v*vX*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat2a(1,2) = mat2a(1,2)-(gBY*gYB*v*vX*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat2a(1,2) = mat2a(1,2)+g1*gBL*v*vX*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(1,2) = mat2a(1,2)+gBY*gYB*v*vX*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(1,2) = mat2a(1,2)+gBY*gBL*v*vX*RXiZ*Sin(TWp)**2
mat2a(1,2) = mat2a(1,2)+gYB*g2*v*vX*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2
mat2a(1,2) = mat2a(1,2)+g1*gYB*v*vX*RXiZp*Sin(TW)**2*Sin(TWp)**2
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+MUP
mat2a(2,2) = mat2a(2,2)-(lam3*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)-(lam2*vX**2)
mat2a(2,2) = mat2a(2,2)+4*gBL**2*vX**2*Cos(TWp)**2*RXiZp
mat2a(2,2) = mat2a(2,2)+4*gYB**2*vX**2*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat2a(2,2) = mat2a(2,2)-8*gBL*gYB*vX**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat2a(2,2) = mat2a(2,2)+8*gBL*gYB*vX**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(2,2) = mat2a(2,2)+4*gBL**2*vX**2*RXiZ*Sin(TWp)**2
mat2a(2,2) = mat2a(2,2)+4*gYB**2*vX**2*RXiZp*Sin(TW)**2*Sin(TWp)**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MHm,MHm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,          & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,          & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MHm,MHm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,          & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,          & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MHm,MHm2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,     & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,          & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MVWm,MVWm2,MHm,MHm2

Complex(dp), Intent(in) :: cplUAhAhhh(2,2,2),cplcFdFdUAhL(3,3,2),cplcFdFdUAhR(3,3,2),cplcFeFeUAhL(3,3,2),        & 
& cplcFeFeUAhR(3,3,2),cplcFuFuUAhL(3,3,2),cplcFuFuUAhR(3,3,2),cplFvFvUAhL(6,6,2),        & 
& cplFvFvUAhR(6,6,2),cplcgWmgWmUAh(2),cplcgWpCgWpCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),& 
& cplUAhhhVZp(2,2),cplUAhHmcVWm(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),        & 
& cplUAhUAhHmcHm(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhcVWmVWm(2,2),cplUAhUAhVZVZ(2,2),       & 
& cplUAhUAhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MAh2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Gloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWmgWmUAh(gO1)
coup2 =  cplcgWmgWmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWm2*RXi,MVWm2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpCgWpCUAh(gO1)
coup2 =  cplcgWpCgWpCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZp(gO1,i2)
coup2 =  Conjg(cplUAhhhVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWm], Hm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHm2,MVWm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhHmcVWm(gO1)
coup2 =  Conjg(cplUAhHmcVWm(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHm2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhHmcHm(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWm2) + 0.25_dp*RXi*A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhcVWmVWm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZp2) + 0.25_dp*RXi*A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoopFd(Yd,v,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,             & 
& MHm,MHm2,MFu,MFu2,MVWm,MVWm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,      & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& delta,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,            & 
& MFu(3),MFu2(3),MVWm,MVWm2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,2),cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHmL(3,3),cplcUFdFuHmR(3,3),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(v*Yd(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*Yd(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*Yd(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*Yd(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*Yd(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*Yd(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*Yd(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*Yd(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*Yd(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHm,              & 
& MHm2,MFu,MFu2,MVWm,MVWm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHm,              & 
& MHm2,MFu,MFu2,MVWm,MVWm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHm,MHm2,MFu,MFu2,MVWm,MVWm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,      & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,     & 
& sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,            & 
& MFu(3),MFu2(3),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,2),cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHmL(3,3),cplcUFdFuHmR(3,3),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! Hm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),MHm2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),MHm2),dp) 
coupL1 = cplcUFdFuHmL(gO1,i2)
coupR1 = cplcUFdFuHmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuHmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuHmR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWmL(gO1,i2)
coupR1 = cplcUFdFuVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(Yu,v,MFu,MFu2,MAh,MAh2,MHm,MHm2,MFd,MFd2,MVWm,MVWm2,             & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,    & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(2),MAh2(2),MHm,MHm2,MFd(3),MFd2(3),MVWm,MVWm2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),cplcUFuFdcHmL(3,3),cplcUFuFdcHmR(3,3),        & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHm,MHm2,MFd,MFd2,MVWm,MVWm2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,        & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHm,MHm2,MFd,MFd2,MVWm,MVWm2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,        & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHm,MHm2,MFd,MFd2,MVWm,MVWm2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,    & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(2),MAh2(2),MHm,MHm2,MFd(3),MFd2(3),MVWm,MVWm2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),cplcUFuFdcHmL(3,3),cplcUFuFdcHmR(3,3),        & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! conj[Hm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),MHm2),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),MHm2),dp) 
coupL1 = cplcUFuFdcHmL(gO1,i2)
coupR1 = cplcUFuFdcHmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcHmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcHmR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWmL(gO1,i2)
coupR1 = cplcUFuFdcVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(Ye,v,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,             & 
& MHm,MHm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,      & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,delta,MFe_1L,MFe2_1L,            & 
& ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,            & 
& MFv(6),MFv2(6),MVWm,MVWm2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,2),cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFvHmL(3,6),cplcUFeFvHmR(3,6),             & 
& cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(v*Ye(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*Ye(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*Ye(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*Ye(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*Ye(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*Ye(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*Ye(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*Ye(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*Ye(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHm,              & 
& MHm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHm,              & 
& MHm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHm,MHm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,      & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,            & 
& MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,2),cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFvHmL(3,6),cplcUFeFvHmR(3,6),             & 
& cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! Hm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFv2(i2),MHm2),dp) 
B0m2 = MFv(i2)*Real(B0(p2,MFv2(i2),MHm2),dp) 
coupL1 = cplcUFeFvHmL(gO1,i2)
coupR1 = cplcUFeFvHmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvHmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvHmR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWm, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFv2(i2),MVWm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(B0(p2,MFv2(i2),MVWm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWmL(gO1,i2)
coupR1 = cplcUFeFvVWmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopFv(Yx,Yv,v,vX,MFv,MFv2,MAh,MAh2,MHm,MHm2,MFe,MFe2,MVWm,             & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHmL,               & 
& cplUFvFecHmR,cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,          & 
& cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,delta,MFv_1L,            & 
& MFv2_1L,ZM_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(2),MAh2(2),MHm,MHm2,MFe(3),MFe2(3),MVWm,MVWm2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: v,vX

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,2),cplUFvFvAhR(6,6,2),cplUFvFecHmL(6,3),cplUFvFecHmR(6,3),            & 
& cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),cplUFvFvhhL(6,6,2),cplUFvFvhhR(6,6,2),           & 
& cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZpL(6,6), & 
& cplUFvFvVZpR(6,6)

Complex(dp) :: mat1a(6,6), mat1(6,6), mat2(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2 
Real(dp), Intent(out) :: MFv_1L(6),MFv2_1L(6) 
Complex(dp), Intent(out) ::  ZM_1L(6,6) 
Real(dp) :: MFv_t(6),MFv2_t(6) 
Complex(dp) ::  ZM_t(6,6) 
Complex(dp) ::  phaseM, E6(6), sigL(6,6), sigR(6,6), sigS(6,6) 
Real(dp) :: ZMa(6,6), test(2), eig(6) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(v*Yv(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(v*Yv(1,2))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(v*Yv(1,3))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(v*Yv(2,1))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(v*Yv(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(v*Yv(2,3))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(v*Yv(3,1))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(v*Yv(3,2))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(v*Yv(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(v*Yv(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(v*Yv(2,1))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(v*Yv(3,1))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+sqrt(2._dp)*vX*Yx(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+(vX*Yx(1,2))/sqrt(2._dp)
mat1a(4,5) = mat1a(4,5)+(vX*Yx(2,1))/sqrt(2._dp)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+(vX*Yx(1,3))/sqrt(2._dp)
mat1a(4,6) = mat1a(4,6)+(vX*Yx(3,1))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(v*Yv(1,2))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(v*Yv(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(v*Yv(3,2))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+(vX*Yx(1,2))/sqrt(2._dp)
mat1a(5,4) = mat1a(5,4)+(vX*Yx(2,1))/sqrt(2._dp)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+sqrt(2._dp)*vX*Yx(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+(vX*Yx(2,3))/sqrt(2._dp)
mat1a(5,6) = mat1a(5,6)+(vX*Yx(3,2))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(v*Yv(1,3))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(v*Yv(2,3))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(v*Yv(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+(vX*Yx(1,3))/sqrt(2._dp)
mat1a(6,4) = mat1a(6,4)+(vX*Yx(3,1))/sqrt(2._dp)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+(vX*Yx(2,3))/sqrt(2._dp)
mat1a(6,5) = mat1a(6,5)+(vX*Yx(3,2))/sqrt(2._dp)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+sqrt(2._dp)*vX*Yx(3,3)

 
 Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHm,MHm2,MFe,MFe2,MVWm,MVWm2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,            & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    ZM_1L(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    ZM_1L(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = ZM_1L(i1,:) 
      ZM_1L(i1,:) = ZM_1L(i2,:) 
      ZM_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZM_1L, ierr, test) 
mat2 = Matmul( Conjg(ZM_1L), Matmul( mat1, Transpose( Conjg(ZM_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM_1L(i1,:)= phaseM * ZM_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHm,MHm2,MFe,MFe2,MVWm,MVWm2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,            & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    ZM_1L(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    ZM_1L(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = ZM_1L(i1,:) 
      ZM_1L(i1,:) = ZM_1L(i2,:) 
      ZM_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZM_1L, ierr, test) 
mat2 = Matmul( Conjg(ZM_1L), Matmul( mat1, Transpose( Conjg(ZM_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM_1L(i1,:)= phaseM * ZM_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHm,MHm2,MFe,MFe2,MVWm,MVWm2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,        & 
& cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(2),MAh2(2),MHm,MHm2,MFe(3),MFe2(3),MVWm,MVWm2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,2),cplUFvFvAhR(6,6,2),cplUFvFecHmL(6,3),cplUFvFecHmR(6,3),            & 
& cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),cplUFvFvhhL(6,6,2),cplUFvFvhhR(6,6,2),           & 
& cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZpL(6,6), & 
& cplUFvFvVZpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigS(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumS(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFv2(i1),MAh2(i2)) 
B0m2 = 2._dp*MFv(i1)*B0(p2,MFv2(i1),MAh2(i2)) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! conj[Hm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFe2(i2),MHm2) 
B0m2 = 2._dp*MFe(i2)*B0(p2,MFe2(i2),MHm2) 
coupL1 = cplUFvFecHmL(gO1,i2)
coupR1 = cplUFvFecHmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecHmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecHmR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFe2(i2),MVWm2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(B0(p2,MFe2(i2),MVWm2) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWmL(gO1,i2)
coupR1 = cplUFvFecVWmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFv2(i2),Mhh2(i1)) 
B0m2 = 2._dp*MFv(i2)*B0(p2,MFv2(i2),Mhh2(i1)) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),0._dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),0._dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),MVZ2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZ2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! VZp, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),MVZp2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZp2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZpL(gO1,i2)
coupR1 = cplUFvFvVZpR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZpL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFv 
 
Subroutine OneLoopHm(g2,mu,lam3,lam1,v,vX,MVWm,MVWm2,MAh,MAh2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHmVWm,          & 
& cplcFuFdcHmL,cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,cplcgZgWmcHm,cplcgWmgZHm,            & 
& cplcgZpgWmcHm,cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,    & 
& cplhhHmcHm,cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,      & 
& cplcHmVWmVZp,cplAhAhHmcHm,cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,     & 
& cplHmcHmVZVZ,cplHmcHmVZpVZp,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MVWm,MVWm2,MAh(2),MAh2(2),MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),               & 
& MFe(3),MFe2(3),MHm,MHm2,Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: g2,v,vX

Complex(dp), Intent(in) :: mu,lam3,lam1

Complex(dp), Intent(in) :: cplAhcHmVWm(2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),cplFvFecHmL(6,3),cplFvFecHmR(6,3), & 
& cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,        & 
& cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm(2),cplhhcHmVWm(2),cplHmcHmVP,cplHmcHmVZ,       & 
& cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm(2,2),cplhhhhHmcHm(2,2),  & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHm'
 
mi2 = mu - lam1*v**2 - (lam3*vX**2)/2._dp + (g2**2*v**2*RXiWm)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopHm(p2,MVWm,MVWm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,            & 
& MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,           & 
& cplFvFecHmL,cplFvFecHmR,cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,           & 
& cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,cplhhcHmVWm,        & 
& cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm,   & 
& cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp,   & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopHm(p2,MVWm,MVWm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,            & 
& MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,           & 
& cplFvFecHmL,cplFvFecHmR,cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,           & 
& cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,cplhhcHmVWm,        & 
& cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm,   & 
& cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp,   & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHm
 
 
Subroutine Pi1LoopHm(p2,MVWm,MVWm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,               & 
& MFe,MFe2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHmVWm,cplcFuFdcHmL,               & 
& cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,           & 
& cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,       & 
& cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,    & 
& cplAhAhHmcHm,cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,     & 
& cplHmcHmVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWm,MVWm2,MAh(2),MAh2(2),MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),               & 
& MFe(3),MFe2(3),MHm,MHm2,Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhcHmVWm(2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),cplFvFecHmL(6,3),cplFvFecHmR(6,3), & 
& cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,        & 
& cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm(2),cplhhcHmVWm(2),cplHmcHmVP,cplHmcHmVZ,       & 
& cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm(2,2),cplhhhhHmcHm(2,2),  & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! VWm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),MVWm2) 
coup1 = cplAhcHmVWm(i2)
coup2 =  Conjg(cplAhcHmVWm(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
coupL1 = cplcFuFdcHmL(i1,i2)
coupR1 = cplcFuFdcHmR(i1,i2)
coupL2 =  Conjg(cplcFuFdcHmL(i1,i2))
coupR2 =  Conjg(cplcFuFdcHmR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFv2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFv(i1)*MFe(i2)*B0(p2,MFv2(i1),MFe2(i2)) 
coupL1 = cplFvFecHmL(i1,i2)
coupR1 = cplFvFecHmR(i1,i2)
coupL2 =  Conjg(cplFvFecHmL(i1,i2))
coupR2 =  Conjg(cplFvFecHmR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWm2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWmcHm
coup2 =  cplcgWmgZHm 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWm2*RXi,MVZp2*RXi),dp) 
 coup1 = cplcgZpgWmcHm
coup2 =  cplcgWmgZpHm 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZ2*RXi,MVWm2*RXi),dp) 
 coup1 = cplcgWpCgZcHm
coup2 =  cplcgZgWpCHm 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZp2*RXi,MVWm2*RXi),dp) 
 coup1 = cplcgWpCgZpcHm
coup2 =  cplcgZpgWpCHm 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = B0(p2,MHm2,Mhh2(i2)) 
coup1 = cplhhHmcHm(i2)
coup2 = Conjg(cplhhHmcHm(i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWm2) 
coup1 = cplhhcHmVWm(i2)
coup2 =  Conjg(cplhhcHmVWm(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHm2,0._dp) 
coup1 = cplHmcHmVP
coup2 =  Conjg(cplHmcHmVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHm2,MVZ2) 
coup1 = cplHmcHmVZ
coup2 =  Conjg(cplHmcHmVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, Hm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHm2,MVZp2) 
coup1 = cplHmcHmVZp
coup2 =  Conjg(cplHmcHmVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWm2) 
coup1 = cplcHmVPVWm
coup2 =  Conjg(cplcHmVPVWm)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWm2,MVZ2) 
coup1 = cplcHmVWmVZ
coup2 =  Conjg(cplcHmVWmVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWm2,MVZp2) 
coup1 = cplcHmVWmVZp
coup2 =  Conjg(cplcHmVWmVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MAh2(i1)) 
coup1 = cplAhAhHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
coup1 = cplhhhhHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHm2) 
coup1 = cplHmHmcHmcHm
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(0._dp) + 0.25_dp*RXi*A0(0._dp*RXi) - 0.5_dp*0._dp*rMS 
coup1 = cplHmcHmVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWm2) + 0.25_dp*RXi*A0(MVWm2*RXi) - 0.5_dp*MVWm2*rMS 
coup1 = cplHmcHmcVWmVWm
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplHmcHmVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZp2) + 0.25_dp*RXi*A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
coup1 = cplHmcHmVZpVZp
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopHm 
 
Subroutine OneLoopVZ(g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,               & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2

Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZ(2,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHmcHmVZ,cplHmcVWmVZ,         & 
& cplcVWmVWmVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplHmcHmVZVZ,cplcVWmVWmVZVZ1,           & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVWmVZ,     & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,  & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVWmVZ,     & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,  & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVWmVZ,     & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhhhVZ(2,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHmcHmVZ,cplHmcVWmVZ,         & 
& cplcVWmVWmVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplHmcHmVZVZ,cplcVWmVWmVZVZ1,           & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = VSSloop(p2,MAh2(i2),Mhh2(i1))  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVWm2)
coup1 = cplcgWmgWmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVWm2)
coup1 = cplcgWpCgWpCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,0._dp,Mhh2(i2)) 
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVZ2,Mhh2(i2)) 
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVZp2,Mhh2(i2)) 
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MHm2,MHm2)  
coup1 = cplHmcHmVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWm2,MHm2) 
coup1 = cplHmcVWmVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHm2)
 coup1 = cplHmcHmVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWm2) +RXi/4._dp*A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine OneLoopVZp(g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,               & 
& cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,           & 
& cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHmcHmVZp,cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,           & 
& cplhhhhVZpVZp,cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,    & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2

Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZp(2,2),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcgWmgWmVZp,   & 
& cplcgWpCgWpCVZp,cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHmcHmVZp,cplHmcVWmVZp,   & 
& cplcVWmVWmVZp,cplAhAhVZpVZp(2,2),cplhhhhVZpVZp(2,2),cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,  & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZp'
 
mi2 = MVZp2 

 
p2 = MVZp2
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,          & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHmcHmVZp,           & 
& cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,& 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,          & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHmcHmVZp,           & 
& cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,& 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZp
 
 
Subroutine Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,     & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHmcHmVZp,           & 
& cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,& 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZp,MVZp2,MHm,MHm2,MVWm,MVWm2

Complex(dp), Intent(in) :: cplAhhhVZp(2,2),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcgWmgWmVZp,   & 
& cplcgWpCgWpCVZp,cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHmcHmVZp,cplHmcVWmVZp,   & 
& cplcVWmVWmVZp,cplAhAhVZpVZp(2,2),cplhhhhVZpVZp(2,2),cplHmcHmVZpVZp,cplcVWmVWmVZpVZp1,  & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = VSSloop(p2,MAh2(i2),Mhh2(i1))  
coup1 = cplAhhhVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWm], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVWm2)
coup1 = cplcgWmgWmVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gWmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVWm2)
coup1 = cplcgWpCgWpCVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,0._dp,Mhh2(i2)) 
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVZ2,Mhh2(i2)) 
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVZp2,Mhh2(i2)) 
coup1 = cplhhVZpVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MHm2,MHm2)  
coup1 = cplHmcHmVZp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWm], Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWm2,MHm2) 
coup1 = cplHmcVWmVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWm], VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHm2)
 coup1 = cplHmcHmVZpVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWm2) +RXi/4._dp*A0(MVWm2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZp 
 
Subroutine OneLoopVWm(g2,v,MHm,MHm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,              & 
& MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhHmcVWm,cplcFuFdcVWmL,            & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,    & 
& cplHmcVWmVZ,cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,       & 
& cplhhhhcVWmVWm,cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,        & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHm,MHm2,MAh(2),MAh2(2),MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),          & 
& MFe2(3),Mhh(2),Mhh2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(in) :: cplAhHmcVWm(2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),               & 
& cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,           & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm(2),cplhhcVWmVWm(2),cplHmcVWmVP,             & 
& cplHmcVWmVZ,cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm(2,2),  & 
& cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,   & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWm'
 
mi2 = MVWm2 

 
p2 = MVWm2
PiSf = ZeroC 
Call Pi1LoopVWm(p2,MHm,MHm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,             & 
& Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhHmcVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,   & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,cplHmcVWmVZ,       & 
& cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,    & 
& cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,    & 
& cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3, & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWm(p2,MHm,MHm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,             & 
& Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhHmcVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,   & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,cplHmcVWmVZ,       & 
& cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,    & 
& cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,    & 
& cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3, & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWm
 
 
Subroutine Pi1LoopVWm(p2,MHm,MHm2,MAh,MAh2,MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,            & 
& MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,cplAhHmcVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,  & 
& cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,   & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,cplHmcVWmVZ,       & 
& cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,    & 
& cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,    & 
& cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3, & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHm,MHm2,MAh(2),MAh2(2),MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(6),MFv2(6),MFe(3),          & 
& MFe2(3),Mhh(2),Mhh2(2),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhHmcVWm(2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),               & 
& cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,           & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm(2),cplhhcVWmVWm(2),cplHmcVWmVP,             & 
& cplHmcVWmVZ,cplHmcVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm(2,2),  & 
& cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,   & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = VSSloop(p2,MAh2(i2),MHm2)  
coup1 = cplAhHmcVWm(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
coupL1 = cplcFuFdcVWmL(i1,i2)
coupR1 = cplcFuFdcVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFv2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*B0(p2,MFv2(i1),MFe2(i2)) 
coupL1 = cplFvFecVWmL(i1,i2)
coupR1 = cplFvFecVWmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWm2)
coup1 = cplcgWpCgAcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,0._dp)
coup1 = cplcgAgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVZ2)
coup1 = cplcgZgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZp], gWm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWm2,MVZp2)
coup1 = cplcgZpgWmcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWm2)
coup1 = cplcgWpCgZcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWmC], gZp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZp2,MVWm2)
coup1 = cplcgWpCgZpcVWm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = VSSloop(p2,Mhh2(i2),MHm2)  
coup1 = cplhhHmcVWm(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVWm2,Mhh2(i2)) 
coup1 = cplhhcVWmVWm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,0._dp,MHm2) 
coup1 = cplHmcVWmVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZ2,MHm2) 
coup1 = cplHmcVWmVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, Hm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZp2,MHm2) 
coup1 = cplHmcVWmVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVPVWm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZp, VWm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWmVWmVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZp2,MVWm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhcVWmVWm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHm2)
 coup1 = cplHmcHmcVWmVWm
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(0._dp) +RXi/4._dp*A0(0._dp*RXi) 
coup1 = cplcVWmVPVPVWm3
coup2 = cplcVWmVPVPVWm1
coup3 = cplcVWmVPVPVWm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWm2) +RXi/4._dp*A0(MVWm2*RXi) 
coup1 = cplcVWmcVWmVWmVWm2
coup2 = cplcVWmcVWmVWmVWm3
coup3 = cplcVWmcVWmVWmVWm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZ2) +RXi/4._dp*A0(MVZ2*RXi) 
coup1 = cplcVWmVWmVZVZ1
coup2 = cplcVWmVWmVZVZ2
coup3 = cplcVWmVWmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZp 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZp2) +RXi/4._dp*A0(MVZp2*RXi) 
coup1 = cplcVWmVWmVZpVZp1
coup2 = cplcVWmVWmVZpVZp2
coup3 = cplcVWmVWmVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWm 
 

  Complex(dp) Function FloopRXi(p2,m12,m22) 
   Implicit None 
   Real(dp),Intent(in)::p2,m12,m22 
    
   
    If (RXi.eq.1._dp) Then
       FloopRXi=Floop(p2,m12,m22)
    Else
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
          FloopRXi=A0(m12)-A0(m22)+((m12-p2)*A0(m22))/m22-&
               & ((m12-p2+m22*RXi)*A0(m22*RXi))/m22+(-m12+m22+p2)*b0(p2,m12,m22)-&
               & (m12-(m12-p2)**2/m22+3._dp*p2)*b0(p2,m12,m22)-((m12-p2)**2*b0(p2,m12,m22*RXi))/m22
       Else
          If (m12.gt.1.0E-10_dp) Then
              FloopRXi=A0(m12)-2._dp*(m12+p2)*B0(p2,0._dp,m12)
          Else If (m22.gt.1.0E-10_dp) Then
              FloopRXi=(-((m22+p2)*A0(m22))+(p2-m22*RXi)*A0(m22*RXi)+(m22-p2)**2*B0(p2,0._dp,m22)-p2**2*B0(p2,0._dp,m22*RXi))/m22
          Else
              FloopRXi=0._dp
          End if
       End if
    End if
     If (Real(FloopRXi,dp).ne.Real(FloopRXi,dp)) Write(*,*) "NaN in FloopRXi", p2,m12,m22
  End Function FloopRXi


  
  Complex(dp) Function SVVloop(p2,m12,m22)
    Implicit None

    Real(dp),Intent(in)::p2,m12,m22
    

    If (RXi.eq.1._dp) Then
	   
        SVVloop = 4._dp*Real(B0(p2,m12,m22)-0.5_dp*rMS,dp)
    Else If (RXi.lt.0.1_dp) Then
	If (m12.gt.1.0E-10_dp) Then
	    If (p2.gt.0.1_dp) Then
		SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
	    Else
	     If (m12.eq.m22) Then 
	        SVVloop = 0._dp
	     Else 
		SVVloop = (2._dp*rMS*(-m12+m22)+3._dp*A0(m12)-3._dp*A0(m22))/(m12-m22)
             End if
	    End if
        Else
	     If (p2.gt.0.1) Then
		SVVloop = (-8._dp*rMS*m22+A0(m22)+2._dp*p2*B0(p2,0._dp,0._dp)+2._dp*(5._dp*m22-p2)*B0(p2,0._dp,m22))/(4._dp*m22)
	    Else
		SVVloop = -2._dp*rMS + 3._dp*B0(0._dp,0._dp,m22)
	    End if
	End if
    Else
    
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-2._dp*rMS*m12+2._dp*rMS*m22+3._dp*A0(m12)-3._dp*A0(m22)+RXi*A0(m12*RXi)-RXi*A0(m22*RXi))/(m12-m22)
	  Else
	  
	   If (m12-m22.lt.1_dp) Then 
	     SVVloop=  (p2**2*(B0(p2,m12,m12) - 2*B0(p2,m12,m12*RXi) + B0(p2,m12*RXi,m12*RXi)) + &
     &  4*m12*p2*(-B0(p2,m12,m12) + (1 + RXi)*B0(p2,m12,m12*RXi) - RXi*B0(p2,m12*RXi,m12*RXi)) + &
     &  2*m12*((1 - RXi)*A0(m12) + (-1 + RXi)*A0(m12*RXi) - m12*(4*rMS - 6*B0(p2,m12,m12) + (-1 + RXi)**2*B0(p2,m12,m12*RXi) - 2*RXi**2*B0(p2,m12*RXi,m12*RXi))))/(4*m12**2)
	   Else 
	      SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
          End if
          End if 
       Else If ((m12.gt.1.0E-10_dp).and.(m22.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-8._dp*rMS*m22+(11._dp+RXi)*A0(m22)+(1._dp+3._dp*RXi)*A0(m22*RXi))/(4._dp*m22)
	  Else
	      SVVloop =  -2._dp*rMS+A0(m12)/(4._dp*m12)-(RXi*A0(m12))/(4._dp*m12)-A0(m12*RXi)/(4._dp*m12)+(RXi*A0(m12*RXi))/(4._dp*m12)&
              &+(5._dp*B0(p2,0._dp,m12))/2._dp-(p2*B0(p2,0._dp,m12))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12))/2._dp+(p2*RXi*B0(p2,0._dp,m12))/(2._dp*m12)& 
              &+(p2*B0(p2,0._dp,m12*RXi))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m12*RXi))/(2._dp*m12) + (RXi**2*B0(p2,0._dp,m12*RXi))/2._dp
          End if 
          
       Else If ((m22.gt.1.0E-10_dp).and.(m12.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = -2._dp*rMS + (1.0_dp*RXi)*B0(0._dp,0._dp,m22*RXi) + (3._dp)*B0(0._dp,0._dp,m22) !+ A0(m22)/m22
	  Else
	       SVVloop =  -2._dp*rMS+A0(m22)/(4._dp*m22)-(RXi*A0(m22))/(4._dp*m22)-A0(m22*RXi)/(4._dp*m22)+(RXi*A0(m22*RXi))/(4._dp*m22)&
              &+(5._dp*B0(p2,0._dp,m22))/2._dp-(p2*B0(p2,0._dp,m22))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22))/2._dp+(p2*RXi*B0(p2,0._dp,m22))/(2._dp*m22)& 
              &+(p2*B0(p2,0._dp,m22*RXi))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m22*RXi))/(2._dp*m22) + (RXi**2*B0(p2,0._dp,m22*RXi))/2._dp
          End if 
          
       End if
    End if
         If (Real(SVVloop,dp).ne.Real(SVVloop,dp)) Write(*,*) "NaN in SVVloop", p2,m12,m22
  End Function SVVloop

Complex(dp) Function VSSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

VSSloop=  -4._dp*B00(p2,m12,m22) 

! If (RXi.eq.1._dp) Then 
!   VSSloop=  -4._dp*B00(p2,m12,m22) 
! Else
!   If (p2.gt.0) Then 
!         VSSloop=   -(6*(m12 + m22)*(-1 + RXi) + (2*p2*(-p2 + 3*(m12 + m22)*RXi) + &
!       & 3*(p2 + (m12 - m22)*RXi)*A0(m12) + 3*(p2 - m12*RXi + m22*RXi)*A0(m22) - &
!       & 3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12,m22))/p2)/9._dp  &
!       &  + rMS*(2._dp/3._dp)*(m12 + m22)*(-1._dp + RXi)
!   Else ! to be added
!      VSSloop= 0._dp
!    End if
! End if
End Function VSSloop

Complex(dp) Function VVSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

If (RXi.eq.1._dp) Then 
  VVSloop=  B0(p2,m12,m22) 
Else
  ! VVSloop = B0(p2,m12,m22) - 0.25_dp*(B00(p2,m12,m22) + B00(p2,rxi*m12,m22))/m12  !! Mark
   VVSloop = B0(p2,m12,m22) + (-B00(p2,m12,m22) + B00(p2,m22,rxi*m12))/m12 !! FeynArts
End if

End Function VVSloop


Complex(dp) Function VVVloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 
Real(dp) :: b001

If (RXi.eq.1._dp) Then 
  VVVloop=   -2._dp*rMS*(m12 + m22 - p2/3._dp) + 10._dp*B00(p2,m12,m22) &
     & + (m12+m22+4._dp*p2)*B0(p2,m12,m22)+  A0(m12) + A0(m22)
Else
!   If ((m12.eq.m22).and.(m22.gt.0._dp)) Then 
!       b001 = (-A0(m22)+(p2+m12-m22)*B11(MZ2,m22,m22) + 2._dp*m22*B1(MZ2,m22,m22) - 1._dp/6._dp*(-p2 + 2._dp*m22+4._dp*m22))/8._dp
!       VVVloop =        ((m22*(96._dp*b001*MZ2 + 16._dp*m22*MZ2*rMS - 3._dp*m22**2*(-1._dp + 32._dp*rMS + RXi**2)) + 6._dp*m22*(4*MZ2 + m22*(-3._dp + 4._dp*RXi))*A0(m22) + 6._dp*m22*(-4._dp*MZ2 + m22*(4._dp + 3._dp*RXi))*A0(m22*RXi) +  &
!        &      24._dp*(7._dp*m22**2*MZ2*B0(MZ2,m22,m22) + m22**2*(m22 - 2._dp*MZ2 - 4._dp*MZ2*RXi + m22*RXi**2)*B0(MZ2,m22,m22*RXi) + 12._dp*m22**2*B00(MZ2,m22,m22) - 7._dp*m22*MZ2*B00(MZ2,m22,m22) +  &
!        &         MZ2**2*B00(MZ2,m22,m22) - m22**2*B00(MZ2,m22,m22*RXi) + 9._dp*m22*MZ2*B00(MZ2,m22,m22*RXi) - 2._dp*MZ2**2*B00(MZ2,m22,m22*RXi) - m22**2*RXi*B00(MZ2,m22,m22*RXi) +  &
!        &         MZ2**2*B00(MZ2,m22*RXi,m22*RXi) - 2._dp*m22**2*MZ2*b1(MZ2,m22,m22) - 4._dp*m22**2*MZ2*RXi*b1(MZ2,m22,m22*RXi) - 4._dp*m22*MZ2**2*b11(MZ2,m22,m22) + 4._dp*m22*MZ2**2*b11(MZ2,m22,m22*RXi))))/ &
!        &  (24._dp*m22**2)
!   Else      
    
  If ((p2.gt.0).and.(m12.gt.0_dp).and.(m22.gt.0._dp)) Then 
      VVVloop= ((m12*m22*p2*(-3*m12 - 3*m22 - 40*p2 - 12*(m12 + m22 - 4*p2)*RXi - 9*(m12 + m22)*RXi**2) +  &
     &      6*m22*(-m22**2 - 9*m22*p2 + m12*(-9*m22 + p2*(13 - 2*RXi)) + m12**2*(9 + RXi) + p2**2*(9 + RXi))*A0(m12) -  &
     &      6*m12*(m12**2 + 9*m12*(m22 + p2) - m22**2*(9 + RXi) - p2**2*(9 + RXi) + m22*p2*(-13 + 2*RXi))*A0(m22) +  &
     &      6*(m22*(m22**2 + m22*(9*p2 - m12*RXi) - p2*(-11*m12*RXi + p2*(9 + RXi)))*A0(m12*RXi) + m12*(m12**2 + 9*m12*p2 - 9*p2**2 - (m12*m22 - 11*m22*p2 + p2**2)*RXi)*A0(m22*RXi) -  &
     &         m12**4*B0(p2,m12,m22) - 8*m12**3*m22*B0(p2,m12,m22) + 18*m12**2*m22**2*B0(p2,m12,m22) - 8*m12*m22**3*B0(p2,m12,m22) - m22**4*B0(p2,m12,m22) - 8*m12**3*p2*B0(p2,m12,m22) + &  
     &         32*m12**2*m22*p2*B0(p2,m12,m22) + 32*m12*m22**2*p2*B0(p2,m12,m22) - 8*m22**3*p2*B0(p2,m12,m22) + 18*m12**2*p2**2*B0(p2,m12,m22) + 32*m12*m22*p2**2*B0(p2,m12,m22) +  &
     &         18*m22**2*p2**2*B0(p2,m12,m22) - 8*m12*p2**3*B0(p2,m12,m22) - 8*m22*p2**3*B0(p2,m12,m22) - p2**4*B0(p2,m12,m22) + m12**4*B0(p2,m12,m22*RXi) + 8*m12**3*p2*B0(p2,m12,m22*RXi) -  &
     &         18*m12**2*p2**2*B0(p2,m12,m22*RXi) + 8*m12*p2**3*B0(p2,m12,m22*RXi) + p2**4*B0(p2,m12,m22*RXi) - 2*m12**3*m22*RXi*B0(p2,m12,m22*RXi) + 2*m12**2*m22*p2*RXi*B0(p2,m12,m22*RXi) +  &
     &         2*m12*m22*p2**2*RXi*B0(p2,m12,m22*RXi) - 2*m22*p2**3*RXi*B0(p2,m12,m22*RXi) + m12**2*m22**2*RXi**2*B0(p2,m12,m22*RXi) - 2*m12*m22**2*p2*RXi**2*B0(p2,m12,m22*RXi) +  &
     &         m22**2*p2**2*RXi**2*B0(p2,m12,m22*RXi) + m22**4*B0(p2,m22,m12*RXi) + 8*m22**3*p2*B0(p2,m22,m12*RXi) - 18*m22**2*p2**2*B0(p2,m22,m12*RXi) + 8*m22*p2**3*B0(p2,m22,m12*RXi) +  &
     &         p2**4*B0(p2,m22,m12*RXi) - 2*m12*m22**3*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22**2*p2*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22*p2**2*RXi*B0(p2,m22,m12*RXi) - 2*m12*p2**3*RXi*B0(p2,m22,m12*RXi) +  &
     &         m12**2*m22**2*RXi**2*B0(p2,m22,m12*RXi) - 2*m12**2*m22*p2*RXi**2*B0(p2,m22,m12*RXi) + m12**2*p2**2*RXi**2*B0(p2,m22,m12*RXi) -  &
     &         p2**2*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi))))/(72.*m12*m22*p2) -2._dp*(rMS-1._dp)*(m12 + m22 - p2/3._dp)
  Else ! to be added
     Write(*,*) "Warning from VVVloop", p2,m12,m22
     VVVloop= 0._dp
   End if
! End if
End if
End Function VVVloop


Complex(dp) Function VGGloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 


If (RXi.eq.1._dp) Then 
  VGGloop=  B00(p2,m12,m22) 
Else
  VGGloop=  B00(p2,m12*RXi,m22*RXi) 

!   If (p2.gt.0) Then 
!       VGGloop=   -((2*p2*(p2 - 3*(m12 + m22)*RXi) - 3*(p2 + (m12 - m22)*RXi)*A0(m12*RXi)  &
!       & - 3*(p2 - m12*RXi + m22*RXi)*A0(m22*RXi) +  &
!     &       3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi)))/(36.*p2)
!   Else  ! to be added
!          Write(*,*) "Warning from VVSloop", p2,m12,m22
!      VGGloop= 0._dp
!    End if
End if
End Function VGGloop
End Module LoopMasses_ZpBminusLSM 
