#!/bin/bash
	# S
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S/preview.stl -o S.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3 -D AntMountScrewDiameter=6 -D AntWheelHeight=15 -D AntMountScrewHead=10.2 -D MotorMountType=0 -D MotorMountZshift=0 -D MotorAxisDiameter=5 -D MotorShaftFlattening=0.5 -D MotorShaftScrew=0
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3 -D DXFexport=1 -D AntMountScrewDiameter=6 -D AntWheelHeight=15 -D AntMountScrewHead=10.2 -D MotorMountType=0 -D MotorMountZshift=0 -D MotorAxisDiameter=5 -D MotorShaftFlattening=0.5 -D MotorShaftScrew=0
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o Sout.DXF parametric-3d-rotator.scad -D PartNumber="13" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3 -D DXFexport=1 -D AntMountScrewDiameter=6 -D AntWheelHeight=15 -D AntMountScrewHead=10.2 -D MotorMountType=0 -D MotorMountZshift=0 -D MotorAxisDiameter=5 -D MotorShaftFlattening=0.5 -D MotorShaftScrew=0
	# M
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M/preview.stl -o M.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4 -D DXFexport=1 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o Mout.DXF parametric-3d-rotator.scad -D PartNumber="13" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4 -D DXFexport=1 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	# MS
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o MS/preview.stl -o MS.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=320 -D BoxThickness=4 -D AntMountScrewDiameter=6 -D AntWheelHeight=20 -D AntMountScrewHead=10.2 -D AntMountScrewRadius=18.5 -D CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer=300
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o MS.DXF parametric-3d-rotator.scad 						 -D PartNumber="0"  -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=320 -D BoxThickness=4 -D AntMountScrewDiameter=6 -D AntWheelHeight=20 -D AntMountScrewHead=10.2 -D AntMountScrewRadius=18.5 -D CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer=300 -D DXFexport=1
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o MSout.DXF parametric-3d-rotator.scad 					 -D PartNumber="13" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=320 -D BoxThickness=4 -D AntMountScrewDiameter=6 -D AntWheelHeight=20 -D AntMountScrewHead=10.2 -D AntMountScrewRadius=18.5 -D CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer=300 -D DXFexport=1

	# XL
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL/preview.stl -o XL.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5 -D DXFexport=1 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XLout.DXF parametric-3d-rotator.scad -D PartNumber="13" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5 -D DXFexport=1 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2

for i in {0..13}	# part number
do
	D=$(date +%H:%M)
	echo "Render $i.stl    of 13 | $D"
	# S
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3 -D AntMountScrewDiameter=6 -D AntWheelHeight=15 -D AntMountScrewHead=10.2 -D MotorMountType=0 -D MotorMountZshift=0 -D MotorAxisDiameter=5 -D MotorShaftFlattening=0.5 -D MotorShaftScrew=0
	# M
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
	# MS
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o MS/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=320 -D BoxThickness=4 -D AntMountScrewDiameter=6 -D AntWheelHeight=20 -D AntMountScrewHead=10.2 -D AntMountScrewRadius=18.5 -D CircularPitchLimitUnderWhichDisableEndstopAndPotetniometer=300
	# XL
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5 -D AntMountScrewDiameter=8 -D AntWheelHeight=20 -D AntMountScrewHead=13.2
done
exit 0

