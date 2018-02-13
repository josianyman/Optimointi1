/*********************************************
 * OPL 12.8.0.0 Model
 * Author: josianyman
 * Creation Date: Feb 13, 2018 at 10:11:51 AM
 *********************************************/

 // variables
 
 // Tammikuussa kurssille otetut opiskelijat
 dvar int+ o1;
 // Helmikuussa kurssille otetut opiskelijat
 dvar int+ o2;
 
 dvar int+ o3;
 
 dvar int+ o4;
 
 dvar int+ o5;

 // expressions
 
 dexpr float graduated1 = (o1 * 4/5);
 dexpr float graduated2 = (o2 * 4/5);
 dexpr float graduated3 = (o3 * 4/5);
 dexpr float graduated4 = (o4 * 4/5);
 dexpr float graduated5 = (o5 * 4/5);

 dexpr float teachers1 = (o1/15);
 dexpr float teachers2 = (o2/15);
 dexpr float teachers3 = (o3/15);
 dexpr float teachers4 = (o4/15);
 dexpr float teachers5 = (o5/15);
 
 dexpr float teachers = teachers1 + teachers2 + teachers3 + teachers4 + teachers5;
 
 dexpr float trained1 = 145;
 dexpr float trained2 = trained1*(1-0.08)+graduated1;
 dexpr float trained3 = trained2*(1-0.08)+graduated2;
 dexpr float trained4 = trained3*(1-0.08)+graduated3;
 dexpr float trained5 = trained4*(1-0.08)+graduated4;
 dexpr float trained6 = trained5*(1-0.08)+graduated5;
 
 dexpr float rentalDemand1 = 135;
 dexpr float rentalDemand2 = 125;
 dexpr float rentalDemand3 = 150;
 dexpr float rentalDemand4 = 170;
 dexpr float rentalDemand5 = 160;
 dexpr float rentalDemand6 = 180;
 
 dexpr float demand = rentalDemand1 + rentalDemand2 + rentalDemand3 + rentalDemand4 + rentalDemand5 + rentalDemand6;
 
 dexpr float idle1 = trained1 - rentalDemand1 - teachers1; 
 dexpr float idle2 = trained2 - rentalDemand2 - teachers2; 
 dexpr float idle3 = trained3 - rentalDemand3 - teachers3; 
 dexpr float idle4 = trained4 - rentalDemand4 - teachers4; 
 dexpr float idle5 = trained5 - rentalDemand5 - teachers5; 
 dexpr float idle6 = trained6 - rentalDemand6;
 
 dexpr float idle = idle1 + idle2 + idle3 + idle4 + idle5 + idle6;
 
 // model
 
 minimize (o1 + o2 + o3 + o4 + o5) * 350 + (teachers + demand) * 600 + idle * 500;
 subject to{
  	idle1 >= 0;
  	idle2 >= 0;
  	idle3 >= 0;
  	idle4 >= 0;
  	idle5 >= 0;
  	idle6 >= 0;
 }
 