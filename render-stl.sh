#!/bin/bash
	# S
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S/preview.stl -o S.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3 -D DXFexport=1
	# M
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M/preview.stl -o M.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4 -D DXFexport=1
	# XL
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL/preview.stl -o XL.echo parametric-3d-rotator.scad -D PartNumber="-1" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL.DXF parametric-3d-rotator.scad -D PartNumber="0" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5 -D DXFexport=1

for i in {0..13}	# part number
do
	D=$(date +%H:%M)
	echo "Render $i.stl    of 13 | $D"
	# S
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o S/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=200 -D TransferRatio=3 -D FirstHeight=15 -D CircularPitch=230 -D BoxThickness=3
	# M
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o M/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=260 -D TransferRatio=3 -D FirstHeight=40 -D CircularPitch=400 -D BoxThickness=4
	# XL
	/home/dan/inst/OpenSCAD-2022.11.27.ai12865-x86_64.AppImage -o XL/$i.stl parametric-3d-rotator.scad -D PartNumber="$i" -D RotatorMountingPointsPitch=280 -D TransferRatio=3 -D FirstHeight=50 -D CircularPitch=500 -D BoxThickness=5
done
exit 0
