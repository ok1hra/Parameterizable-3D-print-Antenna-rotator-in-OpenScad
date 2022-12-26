/*
 Parametric 3D print antenna rotator
 © 2010 by OK1HRA https://remoteqth.com/3d-rotator.php
 Creative Commons BY-SA
 -------------------------------------------------------------------
 Gear module
 Parametric Involute Bevel and Spur Gears by GregFrost
 It is licensed under the Creative Commons - GNU LGPL 2.1 license.
 © 2010 by GregFrost, thingiverse.com/Amp
 http://www.thingiverse.com/thing:3575 and http://www.thingiverse.com/thing:3752
-------------------------------------------------------------------
 How to export .stl
 After open change inputs parameters and press F5
 .STL export press F6 and menu /Design/Export as STL...

 How to export .dxf
 - set PartNumber to 0 or 13
 - set DXFexport to 1
 - render [F6]
 - menu File/Export/ExportDXF
----------------- Input parameter ---------------------------------*/

    RotatorMountingPointsDiameter   =  10.2     ;// it must be sufficiently robust
    AntMountScrewRadius             =   0       ;// 0 for auto, if greater than zero, the value is used (18.5 first version dimension)
    FlangeScrewDiameter             =   4       ;// 4 optimal size
    ScrewHoleTolerance              =   0.2     ;// it creates clearance and compensates for the inaccuracy of the 3d printer
    InAxisDiameter                  =   8.0     ;// main internal axes
    MotorMountType                  =   2       ;// [1-2] part #8 | type 1 from unknown parkside | motor type 2 from PARKSIDE PBSA 12 D4 (max 28 Nm, 350/1 300 RPM)
    MotorMountZshift                =   8       ;// in mm, expand part #8 in Z
    MotorAxisDiameter               =  13       ;// according to the selected motor - part #6
    MotorShaftFlattening            =   0       ;// in mm, if need - part #6
    MotorShaftScrew                 =   3       ;// in mm, if need - part #6, 0 for disable
    SmallNumberOfTeeth              =  12       ;// smaller gear
    VerticalSpacing                 =   3       ;// between gears
    PlainBearingHeight              =   2.1     ;// smaller than VerticalSpacing
    PotentiometerAxisDiameter       =   6.34    ;// according to the selected potentiometer
    PotentiometerMountAxisDiameter  =  10.5     ;// according to the selected potentiometer
    PotentiometerExpand             =   6       ;// number of  teeth
    BodyPrimaryExpander             =   1.25    ;// bigger than 1.2
    BodySecondExpander              =   1.4     ;// bigger than 1.2
    IndentedDiameter                =   7       ;// part #1
    EndstopRotate                   = 165       ;// do not change
    CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer = 390   ;// I recommend not to change, because not space in small design
    DXFexport                       =   0       ;// [0-1] off/on for part #0 and #13
    PartNumber                      =  -7       ;// export parts [0-13], preview all [negative value]
    
// ----------------- Small size---------------------------------
    
//    AntMountScrewDiameter           =   6       ;// it must be sufficiently robust  (>6)
//    AntMountScrewHead               =  10.2     ;// measure the screw used (M8 13.2, M6 10.2)
//    AntWheelHeight                  =  15       ;// bigger than 15
//    RotatorMountingPointsPitch      = 200       ;// check that it exceeds the dimension of part number seven
//    TransferRatio                   =   3       ;// full transfer ratio for 3 = 243 | for 4 = 1024
//    FirstHeight                     =  15       ;// gear height number one is used to calculate the height of the others gear
//    CircularPitch                   = 230       ;
//    BoxThickness                    =   3       ;// wall thickness of part number seven

// ----------------- Medium size---------------------------------

    AntMountScrewDiameter           =   8       ;// it must be sufficiently robust  (>6)
    AntMountScrewHead               =  13.2     ;// measure the screw used (M8 13.2, M6 10.2)
    AntWheelHeight                  =  20       ;// bigger than 15
    RotatorMountingPointsPitch      = 260       ;// check that it exceeds the dimension of part number seven
    TransferRatio                   =   3       ;// full transfer ratio for 3 = 243 | for 4 = 1024
    FirstHeight                     =  40       ;// gear height number one is used to calculate the height of the others gear
    CircularPitch                   = 400       ;
    BoxThickness                    =   4       ;// wall thickness of part number seven

// ----------------- Big size---------------------------------

//    AntMountScrewDiameter           =   8       ;// it must be sufficiently robust  (>6)
//    AntMountScrewHead               =  13.2     ;// measure the screw used (M8 13.2, M6 10.2)
//    AntWheelHeight                  =  20       ;// bigger than 15
//    RotatorMountingPointsPitch      = 280       ;// check that it exceeds the dimension of part number seven
//    TransferRatio                   =   3       ;// full transfer ratio for 3 = 243 | for 4 = 1024
//    FirstHeight                     =  50       ;// gear height number one is used to calculate the height of the others gear
//    CircularPitch                   = 500       ;
//    BoxThickness                    =   5       ;// wall thickness of part number seven

//================================================

//    ToDo
//    - box for control electronics

echo ("PARAMETERS ============================");
echo("MAX printed size (part #7)", (PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander+4*BoxThickness+PitchRadiusBig+PitchRadiusSmall+PitchRadiusBig*BodyPrimaryExpander+4*BoxThickness), "x",  (sin(60)*(PitchRadiusBig+PitchRadiusSmall)+(PitchRadiusBig*BodyPrimaryExpander+4*BoxThickness))*2, "mm");
echo("MAX lasered steel cover size (part #0)", (PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander+4*BoxThickness+PitchRadiusBig+PitchRadiusSmall+PitchRadiusBig*BodyPrimaryExpander+4*BoxThickness), "x",  (RotatorMountingPointsPitch/2+RotatorMountingPointsDiameter*2)*2, "mm, Thickness: ", BoxThickness, "mm");
if(TransferRatio ==3){echo ("Transfer ratio: 243");}
if(TransferRatio ==4){echo ("Transfer ratio: 1024");}
echo ("Azimuth potentiometer to antenna transfer ratio ", (SmallNumberOfTeeth*TransferRatio)/(SmallNumberOfTeeth+PotentiometerExpand), "x" );
if(AntMountScrewRadius>0){
    echo ("Antenna mount screw radius: ", AntMountScrewRadius, "mm X,Y distance: ", pow( 2*pow(AntMountScrewRadius, 2), 1/2), "mm" );
}else{
    echo ("Antenna mount screw radius: ", (PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter), "mm X,Y distance: ", pow( 2*pow((PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter), 2), 1/2), "mm" );
}
if(PitchRadiusSmall>14){ echo("Custom Motor terminal distance: ", CustomMotorTerminalDistance*2, "mm Diameter: ", PitchRadiusSmall*2 );}
echo ("All input variables: ", RotatorMountingPointsDiameter, "|", AntMountScrewRadius, "|", FlangeScrewDiameter, "|", ScrewHoleTolerance, "|", InAxisDiameter, "|", MotorMountType, "|", MotorMountZshift, "|", MotorAxisDiameter, "|", MotorShaftFlattening, "|", MotorShaftScrew, "|", SmallNumberOfTeeth, "|", VerticalSpacing, "|", PlainBearingHeight, "|", PotentiometerAxisDiameter, "|", PotentiometerMountAxisDiameter, "|", PotentiometerExpand, "|", BodyPrimaryExpander, "|", BodySecondExpander, "|", IndentedDiameter, "|", EndstopRotate, "|", CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer, "|", DXFexport, "|", PartNumber, "||", AntMountScrewDiameter, "|", AntMountScrewHead, "|", AntWheelHeight, "|", RotatorMountingPointsPitch, "|", TransferRatio, "|", FirstHeight, "|", CircularPitch, "|", BoxThickness );
echo ("BOM =================================");
echo ("Lasered steel cover with Thickness: ", BoxThickness, "mm by .DXF fie");
echo ("Optional lasered steel output terminal with Thickness: ", BoxThickness, "mm by .DXF fie");
echo ("4x steel axis, Diameter: ", InAxisDiameter, "mm Length: ", (FirstHeight-VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+2*BoxThickness+4*BoxThickness), "mm" );
echo ("Drill for precise machining of the hole for internal axes ", InAxisDiameter+0.1, "mm" );
echo ("4x steel Ant mount srew, Diameter: ", AntMountScrewDiameter, "mm Length: >", (FirstHeight+VerticalSpacing+2+AntWheelHeight+20), "mm, in radius: ", (PitchRadiusBig-5-AntMountScrewDiameter), "mm" );
echo ("35x steel flange srew, Diameter: ", FlangeScrewDiameter, "mm Length: >", (3*BoxThickness), "mm" );
echo ("5x nuts for srew, Diameter: ", FlangeScrewDiameter, "mm" );
echo ("4x M3 x ", (3*BoxThickness), "mm" );
echo ("7x steel spacer for inner axis with diameter ", InAxisDiameter, "/<",PitchRadiusSmall ,"mm, and Thickness: ", PlainBearingHeight-0.1, "mm"  );
if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
    echo ("Azimuth potentiometer: https://www.tme.eu/cz/details/3547s-1aa-102a/potenciometry-viceotackove-dratove/bourns/");
    echo ("Optional homing endstop for stepper motor: https://www.tme.eu/cz/details/d3v-166-1a5/mikrospinace-snap-action/omron-ocb/");
}
echo ("=====================================");

$fn=60;
PitchRadiusBig  =  (SmallNumberOfTeeth* TransferRatio* CircularPitch / 180)/2;
PitchRadiusSmall  =  (SmallNumberOfTeeth* CircularPitch / 180)/2;
PitchRadiusAZpot  =  ((SmallNumberOfTeeth+PotentiometerExpand)* CircularPitch / 180)/2;
CustomMotorTerminalDistance=pow( 2*pow( (PitchRadiusSmall*2), 2), 1/2)/2;

// 0
if(PartNumber ==0){
    if(DXFexport==1){
        projection(cut=true)      // enable for .DXF export
        difference(){
            hull(){
                translate([0,0,-0.1]) BodySilhouette(BoxThickness, 8*BoxThickness, 8*BoxThickness, 360);
                translate([0,RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
                translate([0,-RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
            }
            if(PartNumber <0){
                // - 1/2
                translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
            }
            translate([0,0,BoxThickness-0.1]) FlangeScrew(BoxThickness+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance);
            translate([0,0,-0.2]) cylinder(h=BoxThickness+0.2, d=PitchRadiusBig*2-2*IndentedDiameter+0.4, center=false, $fn=360);
            for (a =[0:120:350]){
                rotate([0,0,a]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2])
                    cylinder(h=BoxThickness+0.2, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
                }
                rotate([0,0,a+60]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2]) {
                        cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=60);
                    }
                }
           }
            translate([0,RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            translate([0,-RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            }
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                // endstop
                rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
                rotate([0,0,EndstopRotate]) translate([33-22.2,-5-10.3-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
            }
            rotate([0,0,-97]) translate([-PitchRadiusBig*1.15,0,-0.2]) scale([1,2,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
            rotate([0,0,60]) translate([-PitchRadiusBig*1.1,0,-0.2]) scale([1,3,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
        }
    }else{
        //        projection(cut=true)      // enable for .DXF export
        difference(){
            hull(){
                translate([0,0,-0.1]) BodySilhouette(BoxThickness, 8*BoxThickness, 8*BoxThickness, 360);
                translate([0,RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
                translate([0,-RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
            }
            if(PartNumber <0){
                // - 1/2
                translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
            }
            translate([0,0,BoxThickness-0.1]) FlangeScrew(BoxThickness+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance);
            translate([0,0,-0.2]) cylinder(h=BoxThickness+0.2, d=PitchRadiusBig*2-2*IndentedDiameter+0.4, center=false, $fn=360);
            for (a =[0:120:350]){
                rotate([0,0,a]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2])
                    cylinder(h=BoxThickness+0.2, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
                }
                rotate([0,0,a+60]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2]) {
                        cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=60);
                    }
                }
           }
            translate([0,RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            translate([0,-RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            }
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                // endstop
                rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
                rotate([0,0,EndstopRotate]) translate([33-22.2,-5-10.3-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
            }
            rotate([0,0,-97]) translate([-PitchRadiusBig*1.15,0,-0.2]) scale([1,2,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
            rotate([0,0,60]) translate([-PitchRadiusBig*1.1,0,-0.2]) scale([1,3,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
        }
    }
}
if(PartNumber <=-0){
   %     difference(){
            hull(){
                translate([0,0,-0.1]) BodySilhouette(BoxThickness, 8*BoxThickness, 8*BoxThickness, 360);
                translate([0,RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
                translate([0,-RotatorMountingPointsPitch/2,-0.1]) cylinder(h=BoxThickness,d=RotatorMountingPointsDiameter*4, center=false, $fn=60);
            }
            if(PartNumber <0){
                // - 1/2
                translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
            }
            translate([0,0,BoxThickness-0.1]) FlangeScrew(BoxThickness+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance);
            translate([0,0,-0.2]) cylinder(h=BoxThickness+0.2, d=PitchRadiusBig*2-2*IndentedDiameter+0.4, center=false, $fn=360);
            for (a =[0:120:350]){
                rotate([0,0,a]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2])
                    cylinder(h=BoxThickness+0.2, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
                }
                rotate([0,0,a+60]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2]) {
                        cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=60);
                    }
                }
           }
            translate([0,RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            translate([0,-RotatorMountingPointsPitch/2,-0.2]) cylinder(h=BoxThickness+0.2,d=RotatorMountingPointsDiameter, center=false, $fn=60);
            if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            }
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                // endstop
                rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
                rotate([0,0,EndstopRotate]) translate([33-22.2,-5-10.3-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
            }
            rotate([0,0,-97]) translate([-PitchRadiusBig*1.15,0,-0.2]) scale([1,2,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
            rotate([0,0,60]) translate([-PitchRadiusBig*1.1,0,-0.2]) scale([1,3,1]) cylinder(h=BoxThickness+0.2, d=10, center=false, $fn=60);
        }

}

// 1
if(PartNumber ==1||PartNumber <0){
    // endstop
    if(PartNumber <0&&CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
        rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-5.2])
        import("V_166_1A006.stl", convexity=3);
    }
    difference(){
        union(){
           rotate([0,0,0]) translate([-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter+PitchRadiusBig/2+1,0,-0.5]) rotate([180,0,0]) scale([1,1,1])
            cylinder(h=8, d=PitchRadiusBig, center=false, $fn=180);
           rotate([0,0,0]) translate([-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter+PitchRadiusBig/2+1,0,-8.5]) rotate([180,0,0]) scale([1,1,1])
            cylinder(h=2, d1=PitchRadiusBig, d2=PitchRadiusBig*0.915, center=false, $fn=180);
            translate([0,0,-FirstHeight-VerticalSpacing])
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
                gear (
                    number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                    circular_pitch=CircularPitch,
        //            diametral_pitch = 50,
                    gear_thickness = FirstHeight+VerticalSpacing-0.5,     // vyska vnejsiho kruhu
                    rim_thickness = FirstHeight-10.5+VerticalSpacing,            // vyska ozubeni
                    rim_width = 0,                               // odsazeni vnejsiho kruhu od ozubeni
                    hub_thickness = FirstHeight+AntWheelHeight+VerticalSpacing,  // vyska vnitrniho kruhu
                    hub_diameter=PitchRadiusBig*2-2*IndentedDiameter,            // prumer vnitrniho kruhu
                    bore_diameter=0,      // prumer otvoru osy
                    circles=0);                                      // pocet otvoru ve vnesim kruhu
            }else{
                gear (
                    number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                    circular_pitch=CircularPitch,
        //            diametral_pitch = 50,
                    gear_thickness = FirstHeight+VerticalSpacing,     // vyska vnejsiho kruhu
                    rim_thickness = FirstHeight,            // vyska ozubeni
                    rim_width = 0,                               // odsazeni vnejsiho kruhu od ozubeni
                    hub_thickness = FirstHeight+AntWheelHeight+VerticalSpacing,  // vyska vnitrniho kruhu
                    hub_diameter=PitchRadiusBig*2-2*IndentedDiameter,            // prumer vnitrniho kruhu
                    bore_diameter=0,      // prumer otvoru osy
                    circles=0);                                      // pocet otvoru ve vnesim kruhu        
            }
        }
        // -
       translate([0,0,-FirstHeight-VerticalSpacing-1]) cylinder(h=FirstHeight+VerticalSpacing+3*BoxThickness, d=InAxisDiameter, center=false, $fn=60);
       // -screw
       for (a =[0:90:350]){
            rotate([0,0,a]) union(){
                if(AntMountScrewRadius>0){
                    translate([AntMountScrewRadius,0,-FirstHeight-VerticalSpacing-1]) {
                        cylinder(h=FirstHeight+VerticalSpacing+2+AntWheelHeight, d=AntMountScrewDiameter, center=false, $fn=60);
                        rotate([0,0,30]) cylinder(h=8, d=AntMountScrewHead/sin(60), $fn=6, center=false);
                    }                                
                }else{
                    translate([PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter,0,-FirstHeight-VerticalSpacing-1]) {
                        cylinder(h=FirstHeight+VerticalSpacing+2+AntWheelHeight, d=AntMountScrewDiameter, center=false, $fn=60);
                        rotate([0,0,30]) cylinder(h=8, d=AntMountScrewHead/sin(60), $fn=6, center=false);
                    }                
                }
            }
        }
        translate([0,0,AntWheelHeight-0.5]) scale([1.5,1.5,1]) rq(1);
    }
}

// 2
if(PartNumber ==2||PartNumber <0){
    for (a =[0:120:350]){
        rotate([0,0,a]) 
            difference(){
                union(){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
                    if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
                        gear (
                            number_of_teeth=SmallNumberOfTeeth,
                            circular_pitch=CircularPitch,
                            gear_thickness = FirstHeight-10.5+VerticalSpacing,
                            rim_thickness = FirstHeight-10.5+VerticalSpacing,
                            rim_width = 0,
                            hub_thickness = FirstHeight+VerticalSpacing-0.5,
                            hub_diameter=2*InAxisDiameter,
                            bore_diameter=InAxisDiameter,
                            circles=0);
                    }else{
                        gear (
                            number_of_teeth=SmallNumberOfTeeth,
                            circular_pitch=CircularPitch,
                            gear_thickness = FirstHeight+VerticalSpacing,
                            rim_thickness = FirstHeight,
                            rim_width = 0,
                            hub_thickness = FirstHeight+VerticalSpacing,
                            hub_diameter=2*InAxisDiameter,
                            bore_diameter=InAxisDiameter,
                            circles=0);
                    }
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
                    gear (
                        number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                        circular_pitch=CircularPitch,
                        gear_thickness = FirstHeight/TransferRatio*1.5,
                        rim_thickness = FirstHeight/TransferRatio*1.5-0.5,
                        rim_width = PitchRadiusSmall/10,
                        hub_thickness = FirstHeight/TransferRatio*1.5+VerticalSpacing,
                        hub_diameter=PitchRadiusSmall*2.5,
                        bore_diameter=InAxisDiameter,
                        circles=6);
                }
                translate([-PitchRadiusBig-PitchRadiusSmall-(InAxisDiameter+1)/2, -0.5, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing])
                cube([InAxisDiameter+1,1,FirstHeight/TransferRatio*1.5+VerticalSpacing+FirstHeight+VerticalSpacing]);
                translate([-PitchRadiusBig-PitchRadiusSmall-0.5, -(InAxisDiameter+1)/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing])
                cube([1,InAxisDiameter+1,FirstHeight/TransferRatio*1.5+VerticalSpacing+FirstHeight+VerticalSpacing]);
                if(PartNumber >0){
                    // TXT
                    rotate([0,0,-5])translate([-PitchRadiusBig*1.85-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-VerticalSpacing-0.5])rotate([0,0,-90])
                        linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
                           text(str("2"), halign="center", size=7);
                        }
                    }
        }
    }
}

// 3
if(PartNumber ==3||PartNumber <0){
    difference(){
        union(){
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio*1.5,
                rim_thickness = FirstHeight/TransferRatio*1.5,
                rim_width = 0,
                hub_thickness = FirstHeight/TransferRatio*1.5+VerticalSpacing-PlainBearingHeight,
                hub_diameter=PitchRadiusSmall*2,
                bore_diameter=InAxisDiameter,
                circles=0);
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio,
                rim_thickness = FirstHeight/TransferRatio-0.5,
                rim_width = PitchRadiusSmall/10,
                hub_thickness = FirstHeight/TransferRatio+VerticalSpacing,
                hub_diameter=PitchRadiusSmall*2.5,
                bore_diameter=InAxisDiameter,
                circles=6);
        }
        translate([-(InAxisDiameter+1)/2, -0.5, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*VerticalSpacing])
        cube([InAxisDiameter+1,1,FirstHeight/TransferRatio+VerticalSpacing+FirstHeight/TransferRatio*1.5+VerticalSpacing-PlainBearingHeight]);
        translate([-0.5, -(InAxisDiameter+1)/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*VerticalSpacing])
        cube([1,InAxisDiameter+1,FirstHeight/TransferRatio+VerticalSpacing+FirstHeight/TransferRatio*1.5+VerticalSpacing-PlainBearingHeight]);
        if(PartNumber >0){
        // TXT
        rotate([0,0,-15])translate([-PitchRadiusBig*0.85,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-2*VerticalSpacing-0.5])rotate([0,0,-90])
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
               text(str("3"), halign="center", size=7);
            }
        }
    }
}

// 4
if(PartNumber ==4||PartNumber <0){
    difference(){
        union(){
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio,
                rim_thickness = FirstHeight/TransferRatio,
                rim_width = 0,
                hub_thickness = FirstHeight/TransferRatio+VerticalSpacing-PlainBearingHeight,
                hub_diameter=PitchRadiusSmall*2,
                bore_diameter=InAxisDiameter,
                circles=0);
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio/2,
                rim_thickness = FirstHeight/TransferRatio/2-0.5,
                rim_width = PitchRadiusSmall/10,
                hub_thickness = FirstHeight/TransferRatio/2+VerticalSpacing,
                hub_diameter=PitchRadiusSmall*2.5,
                bore_diameter=InAxisDiameter,
                circles=6);
        }
        translate([-PitchRadiusBig-PitchRadiusSmall-(InAxisDiameter+1)/2, -0.5, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing])
        cube([InAxisDiameter+1,1, FirstHeight/TransferRatio/2+VerticalSpacing+FirstHeight/TransferRatio+VerticalSpacing-PlainBearingHeight]);
        translate([-PitchRadiusBig-PitchRadiusSmall-0.5, -(InAxisDiameter+1)/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing])
        cube([1,InAxisDiameter+1, FirstHeight/TransferRatio/2+VerticalSpacing+FirstHeight/TransferRatio+VerticalSpacing-PlainBearingHeight]);
        if(PartNumber >0){
        // TXT
        rotate([0,0,-6])translate([-PitchRadiusBig-PitchRadiusSmall-PitchRadiusBig*0.85,0, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-3*VerticalSpacing-0.5])rotate([0,0,-90])
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
               text(str("4"), halign="center", size=7);
            }
        }
    }
}

// 5
if(PartNumber ==5||PartNumber <0){
    difference(){
        union(){
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio/2,
                rim_thickness = FirstHeight/TransferRatio/2,
                rim_width = 0,
                hub_thickness = FirstHeight/TransferRatio/2+VerticalSpacing-PlainBearingHeight,
                hub_diameter=PitchRadiusSmall*2,
                bore_diameter=InAxisDiameter,
                circles=0);
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing]) rotate([0,0,180/SmallNumberOfTeeth])
            gear (
                number_of_teeth=SmallNumberOfTeeth*TransferRatio,
                circular_pitch=CircularPitch,
                gear_thickness = FirstHeight/TransferRatio/2,
                rim_thickness = FirstHeight/TransferRatio/2,
                rim_width = PitchRadiusSmall/10,
                hub_thickness = FirstHeight/TransferRatio/2+VerticalSpacing,
                hub_diameter=PitchRadiusSmall*2.5,
                bore_diameter=InAxisDiameter,
                circles=6);
        }
        translate([-(InAxisDiameter+1)/2, -0.5, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing])
        cube([InAxisDiameter+1,1, FirstHeight/TransferRatio/2+VerticalSpacing+FirstHeight/TransferRatio/2+VerticalSpacing-PlainBearingHeight]);
        translate([-0.5, -(InAxisDiameter+1)/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing])
        cube([1,InAxisDiameter+1, FirstHeight/TransferRatio/2+VerticalSpacing+FirstHeight/TransferRatio/2+VerticalSpacing-PlainBearingHeight]);
        if(PartNumber >0){
        // TXT
        rotate([0,0,-15])translate([-PitchRadiusBig*0.85,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-4*VerticalSpacing-0.5])rotate([0,0,-90])
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
               text(str("5"), halign="center", size=7);
            }
        }
    }
}

// 6
if(PartNumber ==6){
    difference(){
        translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)]) rotate([0,0,180/SmallNumberOfTeeth])
        gear (
            number_of_teeth=SmallNumberOfTeeth,
            circular_pitch=CircularPitch,
            gear_thickness = FirstHeight/TransferRatio+3*MotorShaftScrew,
            rim_thickness = FirstHeight/TransferRatio,
            rim_width = 0,
            hub_thickness = FirstHeight/TransferRatio/2,
            hub_diameter=PitchRadiusSmall*2,
            bore_diameter=MotorAxisDiameter,
            circles=0);
//    translate([PitchRadiusBig+PitchRadiusSmall-(MotorAxisDiameter+1)/2, -0.5, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)])
//    #cube([MotorAxisDiameter+1,1, FirstHeight/TransferRatio+2*BoxThickness]);
//    translate([PitchRadiusBig+PitchRadiusSmall-0.5, -(MotorAxisDiameter+1)/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)])
//    cube([1,MotorAxisDiameter+1, FirstHeight/TransferRatio+2*BoxThickness]);
        if(PartNumber >0){
        // TXT
        rotate([0,0,0])translate([PitchRadiusBig+PitchRadiusSmall*0.28,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)+0.5])rotate([180,0,90])
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
               text(str("6"), halign="center", size=6);
            }
        }
        if(MotorShaftScrew>0){
            for (a =[0:120:360]){
                translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75+FirstHeight/TransferRatio+MotorShaftScrew*1.5)]) 
                rotate([0,0,a]) translate([0,-MotorAxisDiameter/2+0.5,0]) rotate([90,0,0])cylinder(h=PitchRadiusSmall-MotorAxisDiameter/2, d1=MotorShaftScrew*0.9, d2=MotorShaftScrew+0.2, center=false, $fn=30);
            }
        }
    }
    translate([PitchRadiusBig+PitchRadiusSmall+(MotorAxisDiameter+1)/2, MotorAxisDiameter/2, -FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)])
    rotate([0,0,180]) cube([MotorAxisDiameter+1,MotorShaftFlattening, FirstHeight/TransferRatio+2*BoxThickness]);
}
if(PartNumber <0){
    difference(){
        translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)]) rotate([180,0,180/SmallNumberOfTeeth])
        gear (
            number_of_teeth=SmallNumberOfTeeth,
            circular_pitch=CircularPitch,
            gear_thickness = FirstHeight/TransferRatio+3*MotorShaftScrew,
            rim_thickness = FirstHeight/TransferRatio,
            rim_width = 0,
            hub_thickness = FirstHeight/TransferRatio/2,
            hub_diameter=PitchRadiusSmall*2,
            bore_diameter=MotorAxisDiameter,
            circles=0);
        if(MotorShaftScrew>0){
            for (a =[0:120:360]){
                translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing+(FirstHeight/TransferRatio*0.75)-FirstHeight/TransferRatio-MotorShaftScrew*1.5]) 
                rotate([0,0,a]) translate([0,-MotorAxisDiameter/2+0.5,0]) rotate([90,0,0])cylinder(h=PitchRadiusSmall-MotorAxisDiameter/2, d1=MotorShaftScrew*0.9, d2=MotorShaftScrew+0.2, center=false, $fn=30);
            }
        }

    }
}

// 7
if(PartNumber ==7||PartNumber <-0){
    difference(){
        union(){
            // upper collar
            translate([0,0,-BoxThickness]) BodySilhouette(BoxThickness, 8*BoxThickness, 8*BoxThickness, 180);
            translate([0,0,-5*BoxThickness]) BodySilhouette(4*BoxThickness, 2*BoxThickness, 8*BoxThickness, 180);
            // body
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-BoxThickness])
            BodySilhouette(FirstHeight-VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+BoxThickness, 2*BoxThickness, 2*BoxThickness, 180);
            translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness])
            BodySilhouette(2*BoxThickness, -2*BoxThickness, 2*BoxThickness, 180);
            // nema
            if(PitchRadiusSmall>14){
                // CUSTOM terminal
                translate([PitchRadiusBig+PitchRadiusSmall+CustomMotorTerminalDistance,CustomMotorTerminalDistance,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness])
                    cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=10, center=false, $fn=60);
                translate([PitchRadiusBig+PitchRadiusSmall+CustomMotorTerminalDistance,-CustomMotorTerminalDistance,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness])
                    cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=10, center=false, $fn=60);
            }else{
                // nema 17 terminal
                translate([PitchRadiusBig+PitchRadiusSmall+15.5,15.5,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness])
                    cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=10, center=false, $fn=60);
                translate([PitchRadiusBig+PitchRadiusSmall+15.5,-15.5,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness])
                    cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=10, center=false, $fn=60);
            }
        }
        if(PartNumber <0){
            // - 1/2
            translate([-200,0,1]) rotate([0,180,180]) cube([400,200,200]);
        }
        // - in
        translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight+2*BoxThickness])
            BodySilhouette(FirstHeight-VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+2*BoxThickness+PlainBearingHeight-2*BoxThickness, 0, 0, 60);
        translate([0,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight]){
            if(PitchRadiusBig+PitchRadiusSmall>50){
                BodySilhouette(2*BoxThickness+0.1, -3*BoxThickness, 0, 60);
            }else{
                BodySilhouette(2*BoxThickness+0.1, 0, 0, 60);
            }
        }
        for (a =[0:120:350]){
        // -axis hole
        translate([0,0,2*BoxThickness]) rotate([180,0,0])
                cylinder(h=FirstHeight-VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+2*BoxThickness+4*BoxThickness, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
        rotate([0,0,a]){
                translate([-PitchRadiusBig-PitchRadiusSmall,0,2*BoxThickness]) rotate([180,0,0])
                cylinder(h=FirstHeight-VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+2*BoxThickness+4*BoxThickness, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
            }
       }
        // hole for water out
        for (a =[0:120:350]){
            rotate([0,0,a]) translate([-PitchRadiusBig*1.7-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness-0.1])
            cylinder(h=3*BoxThickness+0.2, d1=4, d2=PitchRadiusBig/2, center=false, $fn=60);
        }
       // - motor axis hole
        translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness-0.1]){ 
            cylinder(h=3*BoxThickness+0.2, d1=PitchRadiusSmall*3, d2=PitchRadiusSmall*3, center=false, $fn=60);
            if(PitchRadiusSmall>14){
                // CUSTOM terminal
                translate([CustomMotorTerminalDistance,CustomMotorTerminalDistance,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,CustomMotorTerminalDistance,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([CustomMotorTerminalDistance,-CustomMotorTerminalDistance,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,-CustomMotorTerminalDistance,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
            }else{
                // nema 17 terminal            
                translate([15.5,15.5,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([-15.5,15.5,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([15.5,-15.5,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
                translate([-15.5,-15.5,0]) cylinder(h=3*BoxThickness+0.2, d1=3.2, d2=2.8, center=false, $fn=30);
            }

        }
        translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3]){
            if(PitchRadiusSmall>14){
                // CUSTOM terminal            
                translate([CustomMotorTerminalDistance,CustomMotorTerminalDistance,0]) cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=6, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,CustomMotorTerminalDistance,0]) cylinder(h=4, d=6, center=false, $fn=30);
                translate([CustomMotorTerminalDistance,-CustomMotorTerminalDistance,0]) cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=6, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,-CustomMotorTerminalDistance,0]) cylinder(h=4, d=6, center=false, $fn=30);
            }else{
                // nema 17 terminal            
                translate([15.5,15.5,0]) cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=6, center=false, $fn=30);
                translate([-15.5,15.5,0]) cylinder(h=4, d=6, center=false, $fn=30);
                translate([15.5,-15.5,0]) cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight+4, d=6, center=false, $fn=30);
                translate([-15.5,-15.5,0]) cylinder(h=4, d=6, center=false, $fn=30);
            }
        }

        // - flange screw
        FlangeScrew(4*BoxThickness, FlangeScrewDiameter+ScrewHoleTolerance, FlangeScrewDiameter-0.5);
        if(PartNumber >0){
            // TXT
            translate([-PitchRadiusBig-PitchRadiusSmall*4+2*BoxThickness,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness+0.3]) rotate([180,0,-30]){
                linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
                   text(str(AntMountScrewDiameter,"|",AntMountScrewHead,"|",FlangeScrewDiameter,"|",AntWheelHeight,"|",InAxisDiameter,"|",MotorAxisDiameter,"|",TransferRatio), font = "Sans Uralic:style=Bold", halign="left", size=BoxThickness*3);
                   translate([0,-BoxThickness*5,0])
                   text(str(SmallNumberOfTeeth,"|",FirstHeight,"|",CircularPitch,"|",VerticalSpacing,"|",PlainBearingHeight,"|",BoxThickness), font = "Sans Uralic:style=Bold", halign="left", size=BoxThickness*3);
                }
            }
        }
        // wire tunel
        rotate([0,0,240]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness-0.1])
            cylinder(h=6*BoxThickness+0.2, d=6, center=false, $fn=30);
          rotate([0,0,120]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness-0.1])
            cylinder(h=6*BoxThickness+0.2, d=6, center=false, $fn=30);
    }
    // wire tunel
    difference(){
        rotate([0,0,240]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight])
        scale([1,2,1]) cylinder(h=(FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing-PlainBearingHeight)-FirstHeight-VerticalSpacing, d=10, center=false, $fn=30);
        rotate([0,0,240]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-1])
        cylinder(h=(FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing-PlainBearingHeight)-FirstHeight-VerticalSpacing+2, d=6, center=false, $fn=30);
        if(PartNumber <0){
            // - 1/2
            translate([-200,0,1]) rotate([0,180,180]) cube([400,200,200]);
        }
    }
    difference(){
        rotate([0,0,120]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight])
        scale([1,2,1]) cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight-10, d=10, center=false, $fn=30);
        rotate([0,0,120]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander-3,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-1])
        cylinder(h=FirstHeight+VerticalSpacing+FirstHeight/TransferRatio*1.5+FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+4*VerticalSpacing+PlainBearingHeight, d=6, center=false, $fn=30);
        if(PartNumber <0){
            // - 1/2
            translate([-200,0,1]) rotate([0,180,180]) cube([400,200,200]);
        }
    }
}

// 8
if(PartNumber ==8){
    MotorMount(MotorMountType,MotorMountZshift);    
    translate([0,-3,0]) mirror([0,1,0]) MotorMount(MotorMountType,MotorMountZshift);    
}
if(PartNumber <0){
    translate([PitchRadiusBig+PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-2*FirstHeight/TransferRatio/2-4*VerticalSpacing-PlainBearingHeight-3*BoxThickness]) rotate([180,0,180]){
        MotorMount(MotorMountType,MotorMountZshift);
%        translate([0,0,MotorMountZshift]) rotate([180,0,0])cylinder(h=23, d=MotorAxisDiameter, center=false);
//        #translate([0,0,MotorMountZshift]) rotate([180,0,0])cylinder(h=14.5, d=PitchRadiusSmall*2, center=false);
    }
}

// 9
OutsideDiaMult=2.5;

if(PartNumber ==9){
    difference(){
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
                cylinder(h=1.5*FirstHeight/TransferRatio/2, d=2.5*InAxisDiameter,center=false, $fn=60);
            }else{
                cylinder(h=1.5*FirstHeight/TransferRatio/2, d=1.5*InAxisDiameter,center=false, $fn=60);
            }
                translate([0,0,-1])
                cylinder(h=1.5*FirstHeight/TransferRatio/2+2, d=InAxisDiameter,center=false, $fn=60);
    }
    difference(){
                translate([3*InAxisDiameter,0,0])
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=2.5*InAxisDiameter,center=false, $fn=60);
            }else{
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=1.5*InAxisDiameter,center=false, $fn=60);
            }
                translate([3*InAxisDiameter,0,-1])
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing+2, d=InAxisDiameter,center=false, $fn=60);
    }
    difference(){
                translate([6*InAxisDiameter,0,0])
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=2.5*InAxisDiameter,center=false, $fn=60);
            }else{
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=1.5*InAxisDiameter,center=false, $fn=60);
            }
                translate([6*InAxisDiameter,0,-1])
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing+2, d=InAxisDiameter,center=false, $fn=60);
    }
}
if(PartNumber <-0){
    difference(){
        if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing-PlainBearingHeight]) rotate([180,0,0])
                cylinder(h=1.5*FirstHeight/TransferRatio/2, d=2.5*InAxisDiameter,center=false, $fn=60);
        }else{
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing-PlainBearingHeight]) rotate([180,0,0])
                cylinder(h=1.5*FirstHeight/TransferRatio/2, d=1.5*InAxisDiameter,center=false, $fn=60);
        }
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-FirstHeight/TransferRatio-FirstHeight/TransferRatio/2-3*VerticalSpacing-PlainBearingHeight+1]) rotate([180,0,0])
                cylinder(h=1.5*FirstHeight/TransferRatio/2+2, d=InAxisDiameter,center=false, $fn=60);
    }
    rotate([0,0,120])difference(){
        if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer){
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing-PlainBearingHeight]) rotate([180,0,0])
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=2.5*InAxisDiameter,center=false, $fn=60);
        }else{
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing-PlainBearingHeight]) rotate([180,0,0])
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing, d=1.5*InAxisDiameter,center=false, $fn=60);
        }
            translate([-PitchRadiusBig-PitchRadiusSmall,0,-FirstHeight-VerticalSpacing-FirstHeight/TransferRatio*1.5-VerticalSpacing-PlainBearingHeight+1]) rotate([180,0,0])
                cylinder(h=FirstHeight/TransferRatio+2*FirstHeight/TransferRatio/2+3*VerticalSpacing+2, d=InAxisDiameter,center=false, $fn=60);
    }
}

// 10
if(PartNumber ==10||PartNumber <0){
        difference(){
            translate([0,0,BoxThickness]) 
            hull(){
                cylinder(h=AntWheelHeight-1-BoxThickness, d1=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter, d2=PitchRadiusBig*2-10+2+10, center=false, $fn=360);
                cylinder(h=2*BoxThickness, d1=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2+1.5*InAxisDiameter, center=false, $fn=360);
            }
            if(PartNumber <0){
                // - 1/2
                translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
            }
            translate([0,0,BoxThickness-0.1]) cylinder(h=AntWheelHeight-1-BoxThickness+0.2, d1=(PitchRadiusBig+PitchRadiusSmall)*2-2*InAxisDiameter, d2=PitchRadiusBig*2-10+2, center=false, $fn=360);
            for (a =[0:120:350]){
                rotate([0,0,a]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,BoxThickness]) 
                    translate([0,0,-0.1]) cylinder(h=1.3*BoxThickness+0.1, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
                }
                rotate([0,0,a+60]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,BoxThickness]) {
                        translate([0,0,-0.1]) cylinder(h=AntWheelHeight-1-BoxThickness, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=60);
                        translate([0,0,1.3*BoxThickness]) cylinder(h=AntWheelHeight-1-BoxThickness, d=FlangeScrewDiameter*1.75, center=false, $fn=60);
                    }
                }
            }
            difference(){
                translate([0,0,BoxThickness-0.1]) cylinder(h=0.5*InAxisDiameter, d1=(PitchRadiusBig+PitchRadiusSmall)*2+0.5*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2, center=false, $fn=180);
                translate([0,0,BoxThickness-0.1]) cylinder(h=0.5*InAxisDiameter+0.1, d1=(PitchRadiusBig+PitchRadiusSmall)*2-0.5*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2, center=false, $fn=180);
            }
            if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,BoxThickness-0.1]) cylinder(h=BoxThickness*1.25, d=(FlangeScrewDiameter+ScrewHoleTolerance)*1.76, center=false, $fn=30);
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,BoxThickness-0.1]) cylinder(h=BoxThickness*1.25, d=(FlangeScrewDiameter+ScrewHoleTolerance)*1.76, center=false, $fn=30);
            }
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                // endstop
                rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,BoxThickness-0.1]) cylinder(h=4, d=6.5, center=false, $fn=30);
                rotate([0,0,EndstopRotate]) translate([33-22.2,-5-10.3-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter, BoxThickness-0.1]) cylinder(h=4, d=6.5, center=false, $fn=30);

            }
       }
}

// 11
if( (PartNumber ==11||PartNumber <0)&&CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
    difference(){
        rotate([0,0,-120]) 
        translate([PitchRadiusBig+PitchRadiusAZpot,0,-FirstHeight/TransferRatio/2-10.5]) rotate([0,0,180/(SmallNumberOfTeeth+PotentiometerExpand)])
        gear (
            number_of_teeth=SmallNumberOfTeeth+PotentiometerExpand,
            circular_pitch=CircularPitch,
            gear_thickness = FirstHeight/TransferRatio/2,
            rim_thickness = FirstHeight/TransferRatio/2,
            rim_width = 0,
            hub_thickness = FirstHeight/TransferRatio/2,
            hub_diameter=PitchRadiusSmall*2,
            bore_diameter=PotentiometerAxisDiameter,
            circles=0);
        if(PartNumber >0){
        // TXT
        rotate([0,0,-120])translate([PitchRadiusBig+PitchRadiusAZpot*1.65,0, -11])rotate([0,0,90])
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
               text(str("11"), halign="center", size=7);
            }
        }
    }
}


// 12
if( (PartNumber ==12||PartNumber <0)&&CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
PotentiometerMountHeight=10+8;
    difference(){
        union(){
            hull(){
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+PotentiometerMountHeight, d=FlangeScrewDiameter*4, center=false, $fn=30);
                rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+PotentiometerMountHeight, d=PotentiometerMountAxisDiameter*2, center=false, $fn=30);
            }
            hull(){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+PotentiometerMountHeight, d=FlangeScrewDiameter*4, center=false, $fn=30);
                rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+PotentiometerMountHeight, d=PotentiometerMountAxisDiameter*2, center=false, $fn=30);
            }
        }
        rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0.1]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+PotentiometerMountHeight-3.5, d=PitchRadiusAZpot*2.5, center=false, $fn=30);
        rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0.1]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=PotentiometerMountAxisDiameter, center=false, $fn=30);
            rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot-7.42,0,0.1]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=1.7, center=false, $fn=30);

        rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0.1]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-BoxThickness]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=(FlangeScrewDiameter*1.75)/sin(60), center=false, $fn=6);
        rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,0.1]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-BoxThickness]) rotate([180,0,0]) cylinder(h=FirstHeight/TransferRatio/2+BoxThickness+22, d=(FlangeScrewDiameter*1.75)/sin(60), center=false, $fn=6);
        if(PartNumber <0){
            % rotate([0,0,-120]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-FirstHeight/TransferRatio/2-BoxThickness-PotentiometerMountHeight]) rotate([180,0,0]) cylinder(h=20, d=23, center=false, $fn=30);
        }
    }
}

// 13
if(PartNumber ==13){
    if(DXFexport==1){
        projection(cut=true)      // enable for .DXF export
        translate([0,0,-AntWheelHeight+BoxThickness+2-BoxThickness*0.75+1]) difference(){
                translate([0,0,0.01]) cylinder(h=AntWheelHeight-BoxThickness-2+BoxThickness*0.75, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter+BoxThickness*1.5, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter+BoxThickness, center=false, $fn=360);
                translate([0,0,0]) cylinder(h=AntWheelHeight-BoxThickness-2, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter, center=false, $fn=360);
                for (a =[0:90:350]){
                    rotate([0,0,a]) union(){
                        if(AntMountScrewRadius>0){
                            translate([AntMountScrewRadius,0,0]) {
                                cylinder(h=AntWheelHeight, d=AntMountScrewDiameter, center=false, $fn=60);
                            }
                        }else{
                            translate([PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter,0,0]) {
                            cylinder(h=AntWheelHeight, d=AntMountScrewDiameter, center=false, $fn=60);
                        }
                    }
                }
            }
       }

    }else{
        rotate([180,0,0]) difference(){
                translate([0,0,BoxThickness+2.01]) cylinder(h=AntWheelHeight-BoxThickness-2+BoxThickness*0.75, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter+BoxThickness*1.5, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter+BoxThickness, center=false, $fn=360);
                if(PartNumber <0){
                    // - 1/2
                    translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
                }
                translate([0,0,BoxThickness+2]) cylinder(h=AntWheelHeight-BoxThickness-2, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter, center=false, $fn=360);
                for (a =[0:90:350]){
                    rotate([0,0,a]) union(){
                        if(AntMountScrewRadius>0){
                            translate([AntMountScrewRadius,0,BoxThickness+2]) {
                                cylinder(h=AntWheelHeight-BoxThickness+2, d=AntMountScrewDiameter, center=false, $fn=60);
                            }
                        }else{
                            translate([PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter,0,BoxThickness+2]) {
                            cylinder(h=AntWheelHeight-BoxThickness+2, d=AntMountScrewDiameter, center=false, $fn=60);
                        }
                    }
                }
            }
            translate([0,0,BoxThickness+2.5+AntWheelHeight-BoxThickness]) scale([1.5,1.5,1]) rq(1);
       }
   }
}
if(PartNumber <0){
%        difference(){
            translate([0,0,BoxThickness+2.01]) cylinder(h=AntWheelHeight-BoxThickness-2+BoxThickness*0.75, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter+BoxThickness*1.5, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter+BoxThickness, center=false, $fn=360);
            if(PartNumber <0){
                // - 1/2
                translate([200,0,-1]) rotate([0,0,180]) cube([400,200,200]);
            }
            translate([0,0,BoxThickness+2]) cylinder(h=AntWheelHeight-BoxThickness-2, d1=(PitchRadiusBig+PitchRadiusSmall)*2+3.5*InAxisDiameter, d2=(PitchRadiusBig+PitchRadiusSmall)*2+2*InAxisDiameter, center=false, $fn=360);
            for (a =[0:90:350]){
                rotate([0,0,a]) union(){
                    if(AntMountScrewRadius>0){
                        translate([AntMountScrewRadius,0,BoxThickness+2]) {
                            cylinder(h=AntWheelHeight-BoxThickness+2, d=AntMountScrewDiameter, center=false, $fn=60);
                        }
                    }else{
                            translate([PitchRadiusBig-IndentedDiameter-AntMountScrewDiameter,0,BoxThickness+2]) {
                            cylinder(h=AntWheelHeight-BoxThickness+2, d=AntMountScrewDiameter, center=false, $fn=60);
                    }
                }
            }
        }
        translate([0,0,BoxThickness+2.5+AntWheelHeight-BoxThickness]) scale([1.5,1.5,1]) rq(1);
   }
}

// 73
if(PartNumber ==73){
        difference(){
            hull(){
                translate([0,0,-0.1])
//                BodySilhouette(BoxThickness, 8*BoxThickness, 8*BoxThickness, 360);
                for (a =[0:120:350]){
                    rotate([0,0,a]){
//                        translate([-PitchRadiusBig-PitchRadiusSmall,0,0]) cylinder(h=BoxThickness, d1=8*BoxThickness+(PitchRadiusBig+PitchRadiusSmall)*2, d2=8*BoxThickness+(PitchRadiusBig+PitchRadiusSmall)*2, center=false, $fn=360);
                        translate([+PitchRadiusBig+PitchRadiusSmall,0,0]) cylinder(h=BoxThickness, d1=8*BoxThickness+PitchRadiusSmall*4, d2=8*BoxThickness+PitchRadiusSmall*4, center=false, $fn=360);
                    }
                }
            }
            translate([0,0,BoxThickness-0.1]) FlangeScrew(BoxThickness+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance, FlangeScrewDiameter+ScrewHoleTolerance);
            translate([0,0,-0.2]) cylinder(h=BoxThickness+0.2, d=PitchRadiusBig*2-2*IndentedDiameter+0.4, center=false, $fn=360);
            for (a =[0:120:350]){
                rotate([0,0,a]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2])
                    cylinder(h=BoxThickness+0.2, d=InAxisDiameter+ScrewHoleTolerance, center=false, $fn=60);
                }
                rotate([0,0,a+60]){
                    translate([-PitchRadiusBig-PitchRadiusSmall,0,-0.2]) {
                        cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=60);
                    }
                }
           }
            if( CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                rotate([0,0,-120+30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
                rotate([0,0,-120-30]) translate([PitchRadiusBig+PitchRadiusAZpot,0,-0.2]) cylinder(h=BoxThickness+0.2, d=FlangeScrewDiameter+ScrewHoleTolerance, center=false, $fn=30);
            }
            if(CircularPitch>CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer ){
                // endstop
                rotate([0,0,EndstopRotate]) translate([33,-5-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
                rotate([0,0,EndstopRotate]) translate([33-22.2,-5-10.3-PitchRadiusBig-PitchRadiusSmall+InAxisDiameter,-0.2]) cylinder(h=BoxThickness+0.2, d=3.2, center=false, $fn=30);
            }
        }
}

//---------------------------------------------------------------------------------------------------------------

module FlangeScrew(ZZ, D1EXPAND, D2EXPAND){
    for (a =[0:120:350]){
        rotate([0,0,a])
        for (b =[-70:140/5:70]){
            translate([-PitchRadiusBig-PitchRadiusSmall,0,0.1]) rotate([0,0,b+180]) translate([PitchRadiusBig*BodyPrimaryExpander+2*BoxThickness,0,0])
            rotate([180,0,0]) cylinder(h=ZZ, d1=D1EXPAND, d2=D2EXPAND, center=false, $fn=30);
        }
        rotate([0,0,a]) translate([PitchRadiusBig+PitchRadiusAZpot+PitchRadiusAZpot*BodySecondExpander+2*BoxThickness,0,0.1])
        rotate([180,0,0]) cylinder(h=ZZ, d1=D1EXPAND, d2=D2EXPAND, center=false, $fn=30);
    }
}

module BodySilhouette(ZZ, D1EXPAND, D2EXPAND, FN){
    for (a =[0:120:350]){
        rotate([0,0,a]){
            translate([-PitchRadiusBig-PitchRadiusSmall,0,0]) cylinder(h=ZZ, d1=D1EXPAND+PitchRadiusBig*2*BodyPrimaryExpander, d2=D2EXPAND+PitchRadiusBig*2*BodyPrimaryExpander, center=false, $fn=FN);
            translate([+PitchRadiusBig+PitchRadiusAZpot,0,0]) cylinder(h=ZZ, d1=D1EXPAND+PitchRadiusAZpot*2*BodySecondExpander, d2=D2EXPAND+PitchRadiusAZpot*2*BodySecondExpander, center=false, $fn=FN);
        }
    }
    cylinder(h=ZZ, d1=D1EXPAND+PitchRadiusBig*2*BodyPrimaryExpander, d2=D2EXPAND+PitchRadiusBig*2*BodyPrimaryExpander, center=false, $fn=FN);
}

module MotorMount(TYPE, ZSHIFT){
translate([0,0,MotorMountZshift]) difference(){
    union(){
        // vnejsi obal
        translate([0,0,10-3]) cylinder(h=48+65, d=50, center=false, $fn=90);
        translate([0,0,-MotorMountZshift]) cylinder(h=10.1-3+MotorMountZshift, d2=50, d1=30, center=false, $fn=90);
        // spodni priruba
        if(PitchRadiusSmall>14){
            // CUSTOM terminal            
            hull(){
                translate([-31,0,-MotorMountZshift]) cube([62, 3, 4], center=false); 
                translate([CustomMotorTerminalDistance,CustomMotorTerminalDistance,-MotorMountZshift]) cylinder(h=3, d=11, center=false, $fn=30);
                translate([CustomMotorTerminalDistance,-CustomMotorTerminalDistance,-MotorMountZshift]) cylinder(h=3, d=11, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,CustomMotorTerminalDistance,-MotorMountZshift]) cylinder(h=3, d=11, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,-CustomMotorTerminalDistance,-MotorMountZshift]) cylinder(h=3, d=11, center=false, $fn=30);
            }
        }else{
            // nema 17 terminal
            hull(){
                translate([-31,0,-MotorMountZshift]) cube([62, 3, 4], center=false); 
                translate([15.5,15.5,-MotorMountZshift]) cylinder(h=4, d=11, center=false, $fn=30);
                translate([15.5,-15.5,-MotorMountZshift]) cylinder(h=4, d=11, center=false, $fn=30);
                translate([-15.5,15.5,-MotorMountZshift]) cylinder(h=4, d=11, center=false, $fn=30);
                translate([-15.5,-15.5,-MotorMountZshift]) cylinder(h=4, d=11, center=false, $fn=30);
            }
        }
        // bocni priruba
        translate([-31,0,-MotorMountZshift]) cube([62, 3, 55+65+MotorMountZshift], center=false); 
        if(TYPE==2){
            hull(){
                translate([0,0,10]) cylinder(h=48, d=50, center=false, $fn=90);
                translate([18.5,18.5,30.5-2]) cylinder(h=14+1+4, d=6+4, center=false, $fn=30);
                translate([18.5,-18.5,30.5-2]) cylinder(h=14+1+4, d=6+4, center=false, $fn=30);
                translate([-18.5,18.5,30.5-2]) cylinder(h=14+1+4, d=6+4, center=false, $fn=30);
                translate([-18.5,-18.5,30.5-2]) cylinder(h=14+1+4, d=6+4, center=false, $fn=30);
            }
        }
    }
    // -vnitrni tvar motoru
    if(TYPE==1){
        hull(){
            translate([17,17,44]) cylinder(h=12, d=6, center=false, $fn=30);
            translate([17,-17,44]) cylinder(h=12, d=6, center=false, $fn=30);
            translate([-17,17,44]) cylinder(h=12, d=6, center=false, $fn=30);
            translate([-17,-17,44]) cylinder(h=12, d=6, center=false, $fn=30);
        }
        translate([0,0,55-1.5]) cube([15,52,3+0.1], center=true); 
        translate([0,0,55-1.5-15]) cube([15,52,3+0.1], center=true);     
        translate([0,0,10]) cylinder(h=45.1, d=44.5, center=false, $fn=90);
        translate([0,0,-0.1+5]) cylinder(h=10.2-5,  d=28, center=false, $fn=90);
        translate([0,0,-MotorMountZshift-0.1]) cylinder(h=5.2+MotorMountZshift, d2=28, d1=15, center=false, $fn=90);
    }
    if(TYPE==2){
        hull(){
            translate([18.5,18.5,30.5]) cylinder(h=14+1, d=6, center=false, $fn=30);
            translate([18.5,-18.5,30.5]) cylinder(h=14+1, d=6, center=false, $fn=30);
            translate([-18.5,18.5,30.5]) cylinder(h=14+1, d=6, center=false, $fn=30);
            translate([-18.5,-18.5,30.5]) cylinder(h=14+1, d=6, center=false, $fn=30);
        }
        translate([0,0,30.5+26]) cylinder(h=65, d1=38, d2=50-4, center=false, $fn=90);
        translate([0,0,43+7.5+1.5+1]) cube([16.5,50-2,3+2+0.1], center=true); 
        translate([0,0,30.5-1.5]) cube([12,50-2,3+0.1], center=true);
        translate([0,0,45.5-0.1]) cylinder(h=4, d1=43, d2=38, center=false, $fn=90);
        translate([0,0,30.5]) cylinder(h=26.1+10, d=38, center=false, $fn=90);
        translate([0,0,7.5+3]) cylinder(h=2, d1=40+4, d2=40, center=false, $fn=90);
        for (a =[-70:140/5:70]){
            rotate([0,0,a]) translate([0,25.1,9]) rotate([90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
        }
        translate([0,0,7.5]) cylinder(h=3.1, d=40+4, center=false, $fn=90);
        translate([0,0,7.5]) cylinder(h=23.1, d=40, center=false, $fn=90);
        translate([0,0,-0.1+5]) cylinder(h=2.7+0.2,  d=33, center=false, $fn=90);
        translate([0,0,-MotorMountZshift-0.1]) cylinder(h=5.2+MotorMountZshift, d2=28, d1=28, center=false, $fn=90);
    }
    
    // -srouby spodni priruby
    if(PitchRadiusSmall>14){
        // CUSTOM terminal            
        translate([CustomMotorTerminalDistance,CustomMotorTerminalDistance,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);
        difference(){
            union(){
                translate([CustomMotorTerminalDistance,CustomMotorTerminalDistance,4-MotorMountZshift]) cylinder(h=14, d1=11, d2=8, center=false, $fn=30);
                translate([-CustomMotorTerminalDistance,CustomMotorTerminalDistance,4-MotorMountZshift]) cylinder(h=14, d1=11, d2=8, center=false, $fn=30);
            }
            translate([0,0,13-MotorMountZshift]) cylinder(h=5, d1=39.9, d2=50.1, center=false, $fn=90);

        }
        translate([-CustomMotorTerminalDistance,CustomMotorTerminalDistance,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);
        translate([CustomMotorTerminalDistance,-CustomMotorTerminalDistance,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);
        translate([-CustomMotorTerminalDistance,-CustomMotorTerminalDistance,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);

    }else{
        // nema 17 terminal
        translate([15.5,15.5,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);
        difference(){
            union(){
                translate([15.5,15.5,4-MotorMountZshift]) cylinder(h=14, d1=11, d2=8, center=false, $fn=30);
                translate([-15.5,15.5,4-MotorMountZshift]) cylinder(h=14, d1=11, d2=8, center=false, $fn=30);
            }
            translate([0,0,13-MotorMountZshift]) cylinder(h=5, d1=39.9, d2=50.1, center=false, $fn=90);

        }
        translate([-15.5,15.5,-MotorMountZshift-0.1]) cylinder(h=4.2, d1=3.2, d2=2.8, center=false, $fn=30);
    }

    // -srouby bocni priruby
    translate([-28,-0.1,105]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
    translate([-28,-0.1,85]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
    translate([-28,-0.1,65]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
    translate([-28,-0.1,45]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
    translate([-28,-0.1,25]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);
    translate([-28,-0.1,5]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=2.7, center=false, $fn=30);

    translate([28,-0.1,105]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);
    translate([28,-0.1,85]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);
    translate([28,-0.1,65]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);
    translate([28,-0.1,45]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);
    translate([28,-0.1,25]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);
    translate([28,-0.1,5]) rotate([-90,0,0]) cylinder(h=3.2, d1=3.2, d2=3.2, center=false, $fn=30);

    // -1/2
    translate([35,0,-MotorMountZshift-1]) rotate([0,0,180]) cube([70, 35, 160], center=false); 
    }
}    



    
fudge = 0.1;
module rq(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-7.281275,-22.968725],[-9.218775,-22.687475],[-11.086650,-21.758780],[-12.571819,-20.311942],[-13.552341,-18.466933],[-13.906275,-16.343725],[-13.875075,8.125025],[-11.843825,3.968775],[-11.562525,3.562525],[-11.562525,-16.343725],[-11.369259,-17.631210],[-10.828399,-18.759736],[-9.998352,-19.672444],[-8.937525,-20.312475],[-7.281275,-20.656225],[12.093725,-20.625025],[13.773681,-20.293083],[15.133026,-19.383076],[16.043033,-18.023731],[16.374975,-16.343775],[16.406175,16.343725],[16.074232,18.023677],[15.164223,19.383023],[13.804877,20.293032],[12.124925,20.624975],[1.062425,20.624975],[-0.093825,21.218725],[-0.156325,21.624975],[-0.425195,22.379917],[-0.968825,22.968725],[12.093675,22.937525],[14.667363,22.420090],[16.773759,21.008226],[18.196363,18.912575],[18.718675,16.343775],[18.718675,-16.343725],[18.201243,-18.917406],[16.789376,-21.023805],[14.693722,-22.446414],[12.124925,-22.968725],[-7.281325,-22.968725]]);
    linear_extrude(height=h)
      polygon([[10.968725,-16.437475],[-6.156275,-16.406275],[-6.875025,-16.281275],[-7.685400,-15.619512],[-8.000025,-14.593775],[-8.000025,3.062475],[-7.562525,3.156175],[-6.750756,3.499552],[-6.165395,4.158513],[-5.920108,5.005101],[-6.062525,5.874925],[-6.656275,7.374925],[-5.656275,7.593675],[-4.837019,7.995139],[-4.281275,8.718675],[-3.656275,8.843675],[-2.531275,9.062425],[-1.699656,9.444093],[-1.125025,10.156175],[-1.031325,10.187375],[-0.937625,10.218575],[-0.343875,10.343575],[0.486230,10.772203],[1.031125,11.531075],[1.437375,11.749825],[10.968725,11.781025],[12.272699,11.225624],[12.812475,9.906025],[12.812475,-14.593975],[12.272699,-15.897949],[10.968725,-16.437725]]);
    linear_extrude(height=h)
      polygon([[-9.906275,4.781275],[-9.906275,4.812475],[-9.999975,4.874975],[-10.031175,4.843775],[-12.249925,9.375025],[-14.468675,14.000025],[-15.062425,13.812525],[-15.656175,13.687525],[-15.093675,12.656275],[-14.562425,11.625025],[-15.218675,11.468775],[-15.843675,11.312525],[-15.656175,10.968775],[-15.437425,10.625025],[-16.656175,10.375025],[-17.843675,10.062525],[-18.281175,10.750025],[-18.718675,11.406275],[-18.093675,11.562525],[-17.468675,11.718775],[-17.687425,12.062525],[-17.874925,12.375025],[-17.249925,12.531275],[-16.624925,12.687525],[-16.999925,13.375025],[-17.374925,14.093775],[-16.749925,14.250025],[-16.093675,14.437525],[-16.437425,15.093775],[-16.812425,15.781275],[-16.156175,15.968775],[-15.468675,16.125025],[-15.812425,16.875025],[-16.156175,17.593775],[-15.468675,17.781275],[-14.781175,17.968775],[-15.093675,18.718775],[-15.374925,19.437525],[-9.593675,21.031275],[-3.749925,22.593775],[-3.624925,21.781275],[-3.437425,20.968775],[-2.781175,21.156275],[-2.124925,21.312525],[-1.937425,20.093775],[-1.749925,18.906275],[-1.062425,19.062525],[-0.343675,19.218775],[-0.031175,16.312525],[0.281325,13.375025],[-0.312425,13.250025],[-0.906175,13.093775],[-0.843675,12.687525],[-0.781175,12.312525],[-1.374925,12.156275],[-1.968675,12.062575],[-2.156175,13.281325],[-2.343675,14.500075],[-2.968675,14.343825],[-3.593675,14.218825],[-3.281175,12.593825],[-2.937425,11.031325],[-4.062425,10.781325],[-5.218675,10.531325],[-5.531175,11.687575],[-5.812425,12.843825],[-6.406175,12.687575],[-6.999925,12.562575],[-6.562425,11.062575],[-6.093775,9.531325],[-7.187525,9.281325],[-8.312525,9.062575],[-8.875025,10.531325],[-9.406275,12.031325],[-10.000025,11.875075],[-10.625025,11.750075],[-9.281275,8.437575],[-7.937525,5.125075],[-8.906275,4.937575],[-9.906275,4.781325]]);
    linear_extrude(height=h)
      polygon([[2.124975,14.625025],[1.937475,16.500025],[1.812475,17.812525],[3.218725,17.781325],[3.929543,17.492142],[4.218725,16.781325],[4.218725,15.656325],[3.913914,14.929882],[3.187475,14.625075],[2.124975,14.625075]]);
    linear_extrude(height=h)
      polygon([[9.531225,14.625025],[9.124975,14.718725],[8.675304,15.071853],[8.499975,15.624975],[8.531175,16.781225],[8.820361,17.492043],[9.531175,17.781225],[11.124925,17.812425],[11.835746,17.507614],[12.124925,16.781175],[12.124925,15.624925],[11.835743,14.914111],[11.124925,14.624925],[9.531175,14.624925]]);
  }
}    
    
    
    
//Complex Spur Gear Test:
//test_gears ();

// Meshing Double Helix:
//test_meshing_double_helix ();

module test_meshing_double_helix(){
    meshing_double_helix ();
}

// Demonstrate the backlash option for Spur gears.
//test_backlash ();

// Demonstrate how to make meshing bevel gears.
//test_bevel_gear_pair();

module test_bevel_gear_pair(){
    bevel_gear_pair ();
}

module test_bevel_gear(){bevel_gear();}

//bevel_gear();

pi=3.1415926535897932384626433832795;

//==================================================
// Bevel Gears:
// Two gears with the same cone distance, circular pitch (measured at the cone distance)
// and pressure angle will mesh.

module bevel_gear_pair (
	gear1_teeth = 41,
	gear2_teeth = 7,
	axis_angle = 90,
	outside_circular_pitch=1000)
{
	outside_pitch_radius1 = gear1_teeth * outside_circular_pitch / 360;
	outside_pitch_radius2 = gear2_teeth * outside_circular_pitch / 360;
	pitch_apex1=outside_pitch_radius2 * sin (axis_angle) +
		(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);
	cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
	pitch_apex2 = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius2, 2));
	echo ("cone_distance", cone_distance);
	pitch_angle1 = asin (outside_pitch_radius1 / cone_distance);
	pitch_angle2 = asin (outside_pitch_radius2 / cone_distance);
	echo ("pitch_angle1, pitch_angle2", pitch_angle1, pitch_angle2);
	echo ("pitch_angle1 + pitch_angle2", pitch_angle1 + pitch_angle2);

	rotate([0,0,90])
	translate ([0,0,pitch_apex1+20])
	{
		translate([0,0,-pitch_apex1])
		bevel_gear (
			number_of_teeth=gear1_teeth,
			cone_distance=cone_distance,
			pressure_angle=30,
			outside_circular_pitch=outside_circular_pitch);

		rotate([0,-(pitch_angle1+pitch_angle2),0])
		translate([0,0,-pitch_apex2])
		bevel_gear (
			number_of_teeth=gear2_teeth,
			cone_distance=cone_distance,
			pressure_angle=30,
			outside_circular_pitch=outside_circular_pitch);
	}
}

//Bevel Gear Finishing Options:
bevel_gear_flat = 0;
bevel_gear_back_cone = 1;

module bevel_gear (
	number_of_teeth=11,
	cone_distance=100,
	face_width=20,
	outside_circular_pitch=1000,
	pressure_angle=30,
	clearance = 0.2,
	bore_diameter=5,
	gear_thickness = 15,
	backlash = 0,
	involute_facets=0,
	finish = -1)
{
	echo ("bevel_gear",
		"teeth", number_of_teeth,
		"cone distance", cone_distance,
		face_width,
		outside_circular_pitch,
		pressure_angle,
		clearance,
		bore_diameter,
		involute_facets,
		finish);

	// Pitch diameter: Diameter of pitch circle at the fat end of the gear.
	outside_pitch_diameter  =  number_of_teeth * outside_circular_pitch / 180;
	outside_pitch_radius = outside_pitch_diameter / 2;

	// The height of the pitch apex.
	pitch_apex = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius, 2));
	pitch_angle = asin (outside_pitch_radius/cone_distance);

	echo ("Num Teeth:", number_of_teeth, " Pitch Angle:", pitch_angle);

	finish = (finish != -1) ? finish : (pitch_angle < 45) ? bevel_gear_flat : bevel_gear_back_cone;

	apex_to_apex=cone_distance / cos (pitch_angle);
	back_cone_radius = apex_to_apex * sin (pitch_angle);

	// Calculate and display the pitch angle. This is needed to determine the angle to mount two meshing cone gears.

	// Base Circle for forming the involute teeth shape.
	base_radius = back_cone_radius * cos (pressure_angle);

	// Diametrial pitch: Number of teeth per unit length.
	pitch_diametrial = number_of_teeth / outside_pitch_diameter;

	// Addendum: Radial distance from pitch circle to outside circle.
	addendum = 1 / pitch_diametrial;
	// Outer Circle
	outer_radius = back_cone_radius + addendum;

	// Dedendum: Radial distance from pitch circle to root diameter
	dedendum = addendum + clearance;
	dedendum_angle = atan (dedendum / cone_distance);
	root_angle = pitch_angle - dedendum_angle;

	root_cone_full_radius = tan (root_angle)*apex_to_apex;
	back_cone_full_radius=apex_to_apex / tan (pitch_angle);

	back_cone_end_radius =
		outside_pitch_radius -
		dedendum * cos (pitch_angle) -
		gear_thickness / tan (pitch_angle);
	back_cone_descent = dedendum * sin (pitch_angle) + gear_thickness;

	// Root diameter: Diameter of bottom of tooth spaces.
	root_radius = back_cone_radius - dedendum;

	half_tooth_thickness = outside_pitch_radius * sin (360 / (4 * number_of_teeth)) - backlash / 4;
	half_thick_angle = asin (half_tooth_thickness / back_cone_radius);

	face_cone_height = apex_to_apex-face_width / cos (pitch_angle);
	face_cone_full_radius = face_cone_height / tan (pitch_angle);
	face_cone_descent = dedendum * sin (pitch_angle);
	face_cone_end_radius =
		outside_pitch_radius -
		face_width / sin (pitch_angle) -
		face_cone_descent / tan (pitch_angle);

	// For the bevel_gear_flat finish option, calculate the height of a cube to select the portion of the gear that includes the full pitch face.
	bevel_gear_flat_height = pitch_apex - (cone_distance - face_width) * cos (pitch_angle);

//	translate([0,0,-pitch_apex])
	difference ()
	{
		intersection ()
		{
			union()
			{
				rotate (half_thick_angle)
				translate ([0,0,pitch_apex-apex_to_apex])
				cylinder ($fn=number_of_teeth*2, r1=root_cone_full_radius,r2=0,h=apex_to_apex);
				for (i = [1:number_of_teeth])
//				for (i = [1:1])
				{
					rotate ([0,0,i*360/number_of_teeth])
					{
						involute_bevel_gear_tooth (
							back_cone_radius = back_cone_radius,
							root_radius = root_radius,
							base_radius = base_radius,
							outer_radius = outer_radius,
							pitch_apex = pitch_apex,
							cone_distance = cone_distance,
							half_thick_angle = half_thick_angle,
							involute_facets = involute_facets);
					}
				}
			}

			if (finish == bevel_gear_back_cone)
			{
				translate ([0,0,-back_cone_descent])
				cylinder (
					$fn=number_of_teeth*2,
					r1=back_cone_end_radius,
					r2=back_cone_full_radius*2,
					h=apex_to_apex + back_cone_descent);
			}
			else
			{
				translate ([-1.5*outside_pitch_radius,-1.5*outside_pitch_radius,0])
				cube ([3*outside_pitch_radius,
					3*outside_pitch_radius,
					bevel_gear_flat_height]);
			}
		}

		if (finish == bevel_gear_back_cone)
		{
			translate ([0,0,-face_cone_descent])
			cylinder (
				r1=face_cone_end_radius,
				r2=face_cone_full_radius * 2,
				h=face_cone_height + face_cone_descent+pitch_apex);
		}

		translate ([0,0,pitch_apex - apex_to_apex])
		cylinder (r=bore_diameter/2,h=apex_to_apex);
	}
}

module involute_bevel_gear_tooth (
	back_cone_radius,
	root_radius,
	base_radius,
	outer_radius,
	pitch_apex,
	cone_distance,
	half_thick_angle,
	involute_facets)
{
//	echo ("involute_bevel_gear_tooth",
//		back_cone_radius,
//		root_radius,
//		base_radius,
//		outer_radius,
//		pitch_apex,
//		cone_distance,
//		half_thick_angle);

	min_radius = max (base_radius*2,root_radius*2);

	pitch_point =
		involute (
			base_radius*2,
			involute_intersect_angle (base_radius*2, back_cone_radius*2));
	pitch_angle = atan2 (pitch_point[1], pitch_point[0]);
	centre_angle = pitch_angle + half_thick_angle;

	start_angle = involute_intersect_angle (base_radius*2, min_radius);
	stop_angle = involute_intersect_angle (base_radius*2, outer_radius*2);

	res=(involute_facets!=0)?involute_facets:($fn==0)?5:$fn/4;

	translate ([0,0,pitch_apex])
	rotate ([0,-atan(back_cone_radius/cone_distance),0])
	translate ([-back_cone_radius*2,0,-cone_distance*2])
	union ()
	{
		for (i=[1:res])
		{
			assign (
				point1=
					involute (base_radius*2,start_angle+(stop_angle - start_angle)*(i-1)/res),
				point2=
					involute (base_radius*2,start_angle+(stop_angle - start_angle)*(i)/res))
			{
				assign (
					side1_point1 = rotate_point (centre_angle, point1),
					side1_point2 = rotate_point (centre_angle, point2),
					side2_point1 = mirror_point (rotate_point (centre_angle, point1)),
					side2_point2 = mirror_point (rotate_point (centre_angle, point2)))
				{
					polyhedron (
						points=[
							[back_cone_radius*2+0.1,0,cone_distance*2],
							[side1_point1[0],side1_point1[1],0],
							[side1_point2[0],side1_point2[1],0],
							[side2_point2[0],side2_point2[1],0],
							[side2_point1[0],side2_point1[1],0],
							[0.1,0,0]],
						triangles=[[0,2,1],[0,3,2],[0,4,3],[0,1,5],[1,2,5],[2,3,5],[3,4,5],[0,5,4]]);
				}
			}
		}
	}
}

module gear (
	number_of_teeth=15,
	circular_pitch=false, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=5,
	rim_thickness=8,
	rim_width=5,
	hub_thickness=10,
	hub_diameter=15,
	bore_diameter=5,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0,
	flat=false)
{
	if (circular_pitch==false && diametral_pitch==false)
		echo("MCAD ERROR: gear module needs either a diametral_pitch or circular_pitch");

	//Convert diametrial pitch to our native circular pitch
	circular_pitch = (circular_pitch!=false?circular_pitch:180/diametral_pitch);

	// Pitch diameter: Diameter of pitch circle.
	pitch_diameter  =  number_of_teeth * circular_pitch / 180;
	pitch_radius = pitch_diameter/2;

    //	echo ("Teeth:", number_of_teeth, " Pitch radius:", pitch_radius);

	// Base Circle
	base_radius = pitch_radius*cos(pressure_angle);

	// Diametrial pitch: Number of teeth per unit length.
	pitch_diametrial = number_of_teeth / pitch_diameter;

	// Addendum: Radial distance from pitch circle to outside circle.
	addendum = 1/pitch_diametrial;

	//Outer Circle
	outer_radius = pitch_radius+addendum;

	// Dedendum: Radial distance from pitch circle to root diameter
	dedendum = addendum + clearance;

	// Root diameter: Diameter of bottom of tooth spaces.
	root_radius = pitch_radius-dedendum;
	backlash_angle = backlash / pitch_radius * 180 / pi;
	half_thick_angle = (360 / number_of_teeth - backlash_angle) / 4;

	// Variables controlling the rim.
	rim_radius = root_radius - rim_width;

	// Variables controlling the circular holes in the gear.
	circle_orbit_diameter=hub_diameter/2+rim_radius;
	circle_orbit_curcumference=pi*circle_orbit_diameter;

	// Limit the circle size to 90% of the gear face.
	circle_diameter=
		min (
			0.70*circle_orbit_curcumference/circles,
			(rim_radius-hub_diameter/2)*0.9);

	difference()
	{
		union ()
		{
			difference ()
			{
				linear_extrude_flat_option(flat=flat, height=rim_thickness, convexity=10, twist=twist)
				gear_shape (
					number_of_teeth,
					pitch_radius = pitch_radius,
					root_radius = root_radius,
					base_radius = base_radius,
					outer_radius = outer_radius,
					half_thick_angle = half_thick_angle,
					involute_facets=involute_facets);

				if (gear_thickness < rim_thickness)
					translate ([0,0,gear_thickness])
					cylinder (r=rim_radius,h=rim_thickness-gear_thickness+1);
			}
			if (gear_thickness > rim_thickness)
				linear_extrude_flat_option(flat=flat, height=gear_thickness)
				circle (r=rim_radius);
			if (flat == false && hub_thickness > gear_thickness)
				translate ([0,0,gear_thickness])
				linear_extrude_flat_option(flat=flat, height=hub_thickness-gear_thickness)
				circle (r=hub_diameter/2, $fn=360);
		}
		translate ([0,0,-1])
		linear_extrude_flat_option(flat =flat, height=2+max(rim_thickness,hub_thickness,gear_thickness))
		circle (r=bore_diameter/2);
		if (circles>0)
		{
			for(i=[0:circles-1])
				rotate([0,0,i*360/circles])
				translate([circle_orbit_diameter/2,0,-1])
				linear_extrude_flat_option(flat =flat, height=max(gear_thickness,rim_thickness)+3)
				circle(r=circle_diameter/2);
		}
	}
}

module linear_extrude_flat_option(flat =false, height = 10, center = false, convexity = 2, twist = 0)
{
	if(flat==false)
	{
		linear_extrude(height = height, center = center, convexity = convexity, twist= twist) children(0);
	}
	else
	{
		children(0);
	}

}

module gear_shape (
	number_of_teeth,
	pitch_radius,
	root_radius,
	base_radius,
	outer_radius,
	half_thick_angle,
	involute_facets)
{
	union()
	{
		rotate (half_thick_angle) circle ($fn=number_of_teeth*2, r=root_radius);

		for (i = [1:number_of_teeth])
		{
			rotate ([0,0,i*360/number_of_teeth])
			{
				involute_gear_tooth (
					pitch_radius = pitch_radius,
					root_radius = root_radius,
					base_radius = base_radius,
					outer_radius = outer_radius,
					half_thick_angle = half_thick_angle,
					involute_facets=involute_facets);
			}
		}
	}
}

module involute_gear_tooth (
	pitch_radius,
	root_radius,
	base_radius,
	outer_radius,
	half_thick_angle,
	involute_facets)
{
	min_radius = max (base_radius,root_radius);

	pitch_point = involute (base_radius, involute_intersect_angle (base_radius, pitch_radius));
	pitch_angle = atan2 (pitch_point[1], pitch_point[0]);
	centre_angle = pitch_angle + half_thick_angle;

	start_angle = involute_intersect_angle (base_radius, min_radius);
	stop_angle = involute_intersect_angle (base_radius, outer_radius);

	res=(involute_facets!=0)?involute_facets:($fn==0)?5:$fn/4;

	union ()
	{
		for (i=[1:res])
		assign (
			point1=involute (base_radius,start_angle+(stop_angle - start_angle)*(i-1)/res),
			point2=involute (base_radius,start_angle+(stop_angle - start_angle)*i/res))
		{
			assign (
				side1_point1=rotate_point (centre_angle, point1),
				side1_point2=rotate_point (centre_angle, point2),
				side2_point1=mirror_point (rotate_point (centre_angle, point1)),
				side2_point2=mirror_point (rotate_point (centre_angle, point2)))
			{
				polygon (
					points=[[0,0],side1_point1,side1_point2,side2_point2,side2_point1],
					paths=[[0,1,2,3,4,0]]);
			}
		}
	}
}

// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance (radius) from it's center.
//source: http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle (base_radius, radius) = sqrt (pow (radius/base_radius, 2) - 1) * 180 / pi;

// Calculate the involute position for a given base radius and involute angle.

function rotated_involute (rotate, base_radius, involute_angle) =
[
	cos (rotate) * involute (base_radius, involute_angle)[0] + sin (rotate) * involute (base_radius, involute_angle)[1],
	cos (rotate) * involute (base_radius, involute_angle)[1] - sin (rotate) * involute (base_radius, involute_angle)[0]
];

function mirror_point (coord) =
[
	coord[0],
	-coord[1]
];

function rotate_point (rotate, coord) =
[
	cos (rotate) * coord[0] + sin (rotate) * coord[1],
	cos (rotate) * coord[1] - sin (rotate) * coord[0]
];

function involute (base_radius, involute_angle) =
[
	base_radius*(cos (involute_angle) + involute_angle*pi/180*sin (involute_angle)),
	base_radius*(sin (involute_angle) - involute_angle*pi/180*cos (involute_angle))
];


// Test Cases
//===============

module test_gears()
{
	translate([17,-15])
	{
		gear (number_of_teeth=17,
			circular_pitch=500,
			circles=8);

		rotate ([0,0,360*4/17])
		translate ([39.088888,0,0])
		{
			gear (number_of_teeth=11,
				circular_pitch=500,
				hub_diameter=0,
				rim_width=65);
			translate ([0,0,8])
			{
				gear (number_of_teeth=6,
					circular_pitch=300,
					hub_diameter=0,
					rim_width=5,
					rim_thickness=6,
					pressure_angle=31);
				rotate ([0,0,360*5/6])
				translate ([22.5,0,1])
				gear (number_of_teeth=21,
					circular_pitch=300,
					bore_diameter=2,
					hub_diameter=4,
					rim_width=1,
					hub_thickness=4,
					rim_thickness=4,
					gear_thickness=3,
					pressure_angle=31);
			}
		}

		translate ([-61.1111111,0,0])
		{
			gear (number_of_teeth=27,
				circular_pitch=500,
				circles=5,
				hub_diameter=2*8.88888889);

			translate ([0,0,10])
			{
				gear (
					number_of_teeth=14,
					circular_pitch=200,
					pressure_angle=5,
					clearance = 0.2,
					gear_thickness = 10,
					rim_thickness = 10,
					rim_width = 15,
					bore_diameter=5,
					circles=0);
				translate ([13.8888888,0,1])
				gear (
					number_of_teeth=11,
					circular_pitch=200,
					pressure_angle=5,
					clearance = 0.2,
					gear_thickness = 10,
					rim_thickness = 10,
					rim_width = 15,
					hub_thickness = 20,
					hub_diameter=2*7.222222,
					bore_diameter=5,
					circles=0);
			}
		}

		rotate ([0,0,360*-5/17])
		translate ([44.444444444,0,0])
		gear (number_of_teeth=15,
			circular_pitch=500,
			hub_diameter=10,
			rim_width=5,
			rim_thickness=5,
			gear_thickness=4,
			hub_thickness=6,
			circles=9);

		rotate ([0,0,360*-1/17])
		translate ([30.5555555,0,-1])
		gear (number_of_teeth=5,
			circular_pitch=500,
			hub_diameter=0,
			rim_width=5,
			rim_thickness=10);
	}
}

module meshing_double_helix ()
{
	test_double_helix_gear ();

	mirror ([0,1,0])
	translate ([58.33333333,0,0])
	test_double_helix_gear (teeth=13,circles=6);
}

module test_double_helix_gear (
	teeth=17,
	circles=8)
{
	//double helical gear
	{
		twist=200;
		height=20;
		pressure_angle=30;

		gear (number_of_teeth=teeth,
			circular_pitch=700,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.2,
			hub_diameter=15,
			bore_diameter=5,
			circles=circles,
			twist=twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=700,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter=15,
			bore_diameter=5,
			circles=circles,
			twist=twist/teeth);
	}
}

module test_backlash ()
{
	backlash = 2;
	teeth = 15;

	translate ([-29.166666,0,0])
	{
		translate ([58.3333333,0,0])
		rotate ([0,0,-360/teeth/4])
		gear (
			number_of_teeth = teeth,
			circular_pitch=700,
			gear_thickness = 12,
			rim_thickness = 15,
			rim_width = 5,
			hub_thickness = 17,
			hub_diameter=15,
			bore_diameter=5,
			backlash = 2,
			circles=8);

		rotate ([0,0,360/teeth/4])
		gear (
			number_of_teeth = teeth,
			circular_pitch=700,
			gear_thickness = 12,
			rim_thickness = 15,
			rim_width = 5,
			hub_thickness = 17,
			hub_diameter=15,
			bore_diameter=5,
			backlash = 2,
			circles=8);
	}

	color([0,0,128,0.5])
	translate([0,0,-5])
	cylinder ($fn=20,r=backlash / 4,h=25);
}

