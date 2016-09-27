! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:32 on 27.9.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_ZpBminusLSM 
 
Use Model_Data_ZpBminusLSM 
Use TreeLevelMasses_ZpBminusLSM 
Use RGEs_ZpBminusLSM 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,              & 
& Yd,Ye,Yv,Yu,MUP,mu,v,vX,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp),Intent(inout) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(108)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
MUP = (lam3*v**2)/2._dp + lam2*vX**2 + Tad1Loop(2)/vX
mu = lam1*v**2 + (lam3*vX**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(MUP,dp).ne.Real(MUP,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MUP" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(MUP)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for MUP" 
   !Call TerminateProgram  
   MUP = Real(MUP,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mu,dp).ne.Real(mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mu" 
   !Call TerminateProgram  
   mu = Real(mu,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
MUP = (lam3*v**2)/2._dp + lam2*vX**2 + Tad1Loop(2)/vX
mu = lam1*v**2 + (lam3*vX**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(MUP,dp).ne.Real(MUP,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MUP" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(MUP)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for MUP" 
   !Call TerminateProgram  
   MUP = Real(MUP,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mu,dp).ne.Real(mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mu" 
   !Call TerminateProgram  
   mu = Real(mu,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,               & 
& Ye,Yv,Yu,MUP,mu,v,vX,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,gBY,g2,g3,gBL,gYB,v,vX

Complex(dp),Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real(-(v*(-2._dp*(mu) + 2*lam1*v**2 + lam3*vX**2))/2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real(-(vX*(-2._dp*(MUP) + lam3*v**2 + 2*lam2*vX**2))               & 
& /2._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_ZpBminusLSM 
 
