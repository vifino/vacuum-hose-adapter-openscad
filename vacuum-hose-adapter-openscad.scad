// Hose connector
// version 2024-04-30
// repo https://github.com/ostat/vacuum-hose-adapter-openscad
//
// I give permision to use this script as you want, you are also free to sell models generated using this script. When sharing or selling models generated please provide attribution, with a link to the repo.
//
// I don't approve of you hosting or uploading this script it to any site or 3d modeling site.

use <modules/ub.scad>
include <modules/constants.scad>
include <modules/modules_utility.scad>

include <modules/connector_common.scad>
include <modules/connector_hose.scad>
include <modules/connector_flange.scad>
include <modules/connector_magnetic.scad>
include <modules/connector_nozzle.scad>
include <modules/connector_camlock.scad>
include <modules/connector_centec.scad>
include <modules/connector_dyson.scad>
include <modules/connector_dw735.scad>
include <modules/connector_common_post.scad>

//TODO Ideas
//All pre and post trasition length. so a flat section before and after the taper.abs

/* [Hidden] */
DefaultEnd1Color = "LightPink";
DefaultEnd2Color = "SkyBlue";
DefaultTransitionColor = "LightGreen";

/* [Connector 1] */
//Wall thickness
End1_Wall_Thickness = 2; //0.01
//The style of the end
End1_Style="flange"; // [mag: Magnetic Flange, flange: Flange, hose: Hose connector, dyson: Dyson connector, camlock: CAMLOCK connetor, dw735: Dewalt DW735x, centec: Cen-Tec quick connect]
// Is the measurement the adapter's outside or inside diameter?
End1_Measurement = "inner"; //[inner, outer]
// End 1 diameter of the adapter (mm)
End1_Diameter = 50;  //0.01
//Length of the start connector (including the flange).
End1_Length= 15;  //0.1
//Rotation around the z axis. Userfull for non symeterical connectors.
End1_Rotation= 0;  
//Taper of the start connector, use negative to taper other direction.
End1_Taper = 0;  //0.1

/* [Connector 1 - Hose connector] */
//Thickness of hose stop
End1_StopThickness = 0;  //1
//Length of hose stop
End1_StopLength = 0;  //1
//Should the stop be tapered both sides. Might easier to print.
End1_Stop_Symmetrical = false;
//Number of barbs
End1_Barbs_Count = 0;
//Thickness of the barbs, default is half wall thickness
End1_Barbs_Thickness = 0; //0.1
//Should the barbes be tapered both sides. Might be easier to print.
End1_Barbs_Symmetrical = false;
//End Cap Inner Diameter.
End1_Hose_EndCap_Diameter = 0;  //0.1
//Thickness of endcap.
End1_Hose_EndCap_Thickness = 0;  //0.1

/* [Connector 1 - Flange] */
//Width of Flange added to the connector diamater
End1_Flange_Width = 20;
//Thickness of the flange
End1_Flange_Thickness = 5;
//Position of the screws added to the connector diamater, 0 = middle of flange
End1_Flange_Screw_Position= 0;
//Minium amount of the material around the magnet holes(mm), 0 = End1_Flange_Width / 4
End1_Flange_Screw_Border = 5;  //0.1
//Number of Screw holes flange
End1_Flange_Screw_Count = 4;
//The diameter of the screws (mm)
End1_Flange_Screw_Diameter = 5;  //0.1


/* [Connector 1 - Magnetic Connector] */
//Number of magnets in the connector
End1_Magnets_Count = 8;
//The diameter of the magnets (mm)
End1_Magnet_Diameter = 10.5;  //0.1
//The thickness of the magnets (mm)
End1_Magnet_Thickness = 2.5;  //0.1
//Minium amount of the material around the magnets (mm)
End1_Magnet_Border = 2;  //0.1
// Thickness of the magnet flange (mm)
End1_Magnet_Flange_Thickness = 6;  //0.1
// Include a flange alignment ring
End1_Ring = "no"; //[no: No alignment ring, protruding: protruding ring, recessed: Recessed ring]
// Magnetic ring Twist lock bolt size (draft setting)
End1_Magnet_Twist_Lock_Size = "0";  //["0":none,"3":M3,"3cnc":M3 with CNC Kitchen insert,"4":M4,"4cnc":M4 with CNC Kitchen insert,"5":M5,"5cnc":M5 with CNC Kitchen insert]

/* [Transition] */
// tapered for hose connections, flat for attaching to a device
Transition_Style = "bend+taper"; //[flat, taper+bend: Taper then bend, bend+taper: Bend then taper, organicbend: Tapered bend, hull: Hull for multiple end count, none: no transition]
//Length of the transition between the two ends
Transition_Length = 10;  //1
// Radius of transition bend (mm)
Transition_Bend_Radius = 0;  //1
//Angle of bend through the transition section.
Transition_Angle = 0;  //1
// offset for the connector, not supported on taperedbend.
Transition_Offset = [0,0]; // 0.1
/* [Transition Multiple connector settings] */
// Dupliacte the second connector. Adjust angle and bend radius to make it work.
Transition_End2_Count = 1;  //[1, 2, 3, 4, 5, 6]
// MulitConnector, connector in hull length.
Transition_HullLength = 0; // 0.1
Transition_HullCenterLength = 0;
// MulitConnector, connector in hull offset.
Transition_HullyOffset = 0; // 0.1
// MulitConnector, add center connector.
Transition_HullCenter = false;
// MulitConnector, center connector height. default is 2*lengthInHull
Transition_HullCenterHeight = 0;

/* [Transition Extensions] */
//Length of the pre transition
Transition_Pre_Length = 10;
//Size of the grid in the Pre transition. 0: diameter/6
Transition_Pre_GridSize = 0;  //0.1
//Size of the grid walls in the Pre transition. 0: no grid, -1: uses wall thickness
Transition_Pre_GridWallThickness = 0;  //0.1
//Length of the pre transition
Transition_Post_Length = 0;
//Size of the grid in the Pre transition. 0: diameter/6
Transition_Post_GridSize = 0;  //0.1
//Size of the grid walls in the Pre transition. 0: no grid, -1: uses wall thickness
Transition_Post_GridWallThickness = 0;  //0.1

/* [Transition Support For Angled Pipes] */
// Include a flate section on the transition to assist with printing
Transition_Base_Type="none"; // [none, oval, rectangle]
//Support Base Additional Thickness;
Transition_Base_Thickness=0;
//Support Base Width, Default is half diameter
Transition_Base_Width=0;
// Support Base Length Default is 2/3 diameter
Transition_Base_Length=0;
// Support Base Angle position, default half of Bend Radius;
Transition_Base_Angle=0;

/* [Connector 2] */
//Wall thickness
End2_Wall_Thickness = 2; //0.01
End2_Style="nozzle"; // [mag: Magnetic Flange, flange: Flange, hose: Hose connector, nozzle: Nozzle attachement, dyson: Dyson connector, camlock: CAMLOCK connetor, dw735: Dewalt DW735x, centec: Cen-Tec quick connect, none: None]
// Is the measurement the adapter's outside or inside diameter?
End2_Measurement = "outer"; //[inner, outer]
// End 2 diameter of the adapter (mm)
End2_Diameter = 40;  //0.05
//Length of the pipe coming out of the flange.
End2_Length= 40;  //1
//Rotation around the z axis. Userfull for non symeterical connectors.
End2_Rotation= 0;  
//Taper of the start connector, use negative to taper other direction.
End2_Taper = 0;  //0.1

/*[Connector 2 - Hose connector] */
//Thickness of hose stop
End2_StopThickness = 0;  //1
//Length of hose stop
End2_StopLength = 0;  //1
//Should the stop be tapered both sides. Might easier to print.
End2_Stop_Symmetrical = false;
//Number of barbs
End2_Barbs_Count = 0;
//Thickness of the barbs, default is half wall thickness
End2_Barbs_Thickness = 0; //0.1
//Should the barbes be tapered both sides. Might be easier to print.
End2_Barbs_Symmetrical = false;
//Thickness of endcap, 0 means disabled
End2_Hose_EndCap_Thickness = 0;  //0.1
//End Cap Inner Diameter.
End2_Hose_EndCap_Diameter = 0;  //0.1
//End cap grid size for holes
End2_Hose_EndCap_GridSize = 0;  //0.1
//Thickness of the walls in the end cap
End2_Hose_EndCap_GridWallThickness = 0;  //0.1


/* [Connector 2 - Flange] */
//Width of Flange added to the connector diamater
End2_Flange_Width = 20;
//Thickness of the flange
End2_Flange_Thickness = 5;
//Position of the screws added to the connector diamater, 0 = middle of flange
End2_Flange_Screw_Position= 0;
//Minium amount of the material around the magnets (mm), 0 = End1_Flange_Width / 4
End2_Flange_Screw_Border = 5;  //0.1
//Number of Screw holes flange
End2_Flange_Screw_Count = 4;
//The diameter of the screws (mm)
End2_Flange_Screw_Diameter = 5;  //0.1

/* [Connector 2 - Magnetic Flange] */
//Number of magnets in the flange
End2_Magnets_Count = 6;  //1
//The diameter of the magnets
End2_Magnet_Diameter = 12;  //0.1
//The thickness of the magnets
End2_Magnet_Thickness = 3;  //0.1
//Size of the material around the magnets
End2_Magnet_Border = 2;  //0.1
// Inner diameter of the Magnet flange
End2_Magnet_Flange_Thickness = 10;  //0.1
// Include a flange alignment ring
End2_Ring = "no"; //[no: No alignment ring, protruding: Protruding ring, recessed: Recessed ring]
// Magnetic ring twist lock bolt size (draft setting)
End2_Magnet_Twist_Lock_Size = "0";  //["0":none,"3":M3,"3cnc":M3 with CNC Kitchen insert,"4":M4,"4cnc":M4 with CNC Kitchen insert,"5":M5,"5cnc":M5 with CNC Kitchen insert]


/* [Connector 2 - Nozzle] */
// Is the measurement the adapter's outside or inside diameter?
End2_Nozzle_Shape = "square"; //[square, circle]
End2_Nozzle_Size = [10,5,10]; //0.1
End2_Nozzle_Tip_Wall_Thickness = 0; //0.1
End2_Nozzle_Radius = 0; //0.1
End2_Nozzle_Offset = [0,0]; //0.1
End2_Nozzle_Chamfer_Percentage = 0; //0.1
End2_Nozzle_Chamfer_Angle = 0; //0.1

/* [Alignment Ring] */
//draw just the alignment ring
Draw_Alignment_Ring = "no"; //[end1: Draw end 1, end2: Draw end 2, no: Don't draw]
//Alignment depth in to flange (mm)
Alignment_Depth = 2; //0.1
//Alignment upper width at widest part (mm)
Alignment_Upper_Width = 3; //0.1
//Alignment lower width at narrowest part (mm)
Alignment_Lower_Width = 0.5; //0.1
//Alignment side clearance, to give nice fit (mm).
Alignment_Side_Clearance = 0.25;  //0.01
//Alignment Depth Clearance, to prevent hitting bottom (mm).
Alignment_Depth_Clearance = .75;  //0.01

/* [other] */
//Slice model inhalf to be able to easy see inside
Enable_Debug_Slice = false;
//Will only show if debug is also enabled
Enable_Calipers_Slice = false;
Enable_Help = false;
End1_Color = [DefaultEnd1Color,1];  //0.1
End2_Color = [DefaultEnd2Color,1];  //0.1
Transition_Color = [DefaultTransitionColor,1]; //The color, then the alpha value

/* [Hidden] */
//Detail
$fn=120;

module end_of_customizer_opts() {}

function getColor(colorSetting, defaultColor) = 
  assert(is_list(colorSetting), "colorSetting must be a list")
  assert(len(colorSetting) == 2, "colorSetting be length 2")
  let(
    c = colorSetting[0] == "" ? defaultColor : colorSetting[0],
    a = is_num(colorSetting[1]) && colorSetting[1] >=0 && colorSetting[1] <=1 ? colorSetting[1] : 1) [c,a];

HoseAdapter();//execution point

module adapterAlignmentRing(
  centerDiameter = 0,
  alignmentDepth = 0,
  alignmentUpperWidth = 0,
  alignmentLowerWidth = 0,
  alignmentSideClearance = 0,
  alignmentDepthClearance = 0,
  magnetBorder = 0,
  debug = false,
  showCaliper=false,
  help){

  difference(){
    AlignmentRing(
      centerDiameter = centerDiameter,
      alignmentDepth = alignmentDepth,
      alignmentUpperWidth = alignmentUpperWidth,
      alignmentLowerWidth = alignmentLowerWidth,
      alignmentSideClearance = alignmentSideClearance,
      alignmentDepthClearance = alignmentDepthClearance,
      magnetBorder = magnetBorder);

    if($preview&&debug){
      cubeSziex = centerDiameter+max(alignmentUpperWidth, alignmentLowerWidth);
      cubeSziey = centerDiameter/2+max(alignmentUpperWidth, alignmentLowerWidth);
      cubeSziez = alignmentDepth*2;
      translate([-cubeSziex/2, -cubeSziey, -cubeSziez/2])
        cube([cubeSziex,cubeSziey,cubeSziez]);
      }
    } 
     
    if($preview&&showCaliper){
      color("Gold")
      union(){
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, size = 5,h = 0.1,
          //center=false,
          l=centerDiameter+max(alignmentUpperWidth, alignmentLowerWidth), 
          end=0, in=1, 
          translate= [0,10,0],
          txt2 = "centerDiameter");
        translate([(centerDiameter)/2,0,0])
        rotate([90,90,0])
        Caliper(messpunkt = false, help=0, size = 5,h = 0.1,
          l=(alignmentDepth-alignmentDepthClearance)*2, 
          end=0, in=4,          
          cx= 0,
          translate= [0,5,0],
          txt2 = "alignmentDepth");
        }
    }
  
  HelpTxt("adapterAlignmentRing",[
    "centerDiameter", centerDiameter,
    "magnetBorder", magnetBorder,
    "alignmentDepth", alignmentDepth,
    "alignmentUpperWidth", alignmentUpperWidth,
    "alignmentLowerWidth", alignmentLowerWidth,
    "alignmentSideClearance", alignmentSideClearance,
    "alignmentDepthClearance", alignmentDepthClearance,
    "debug", debug]
    ,help);       
}
          
module adapter(
    connector = 2,
    wallThickness = 2,
    style= "hose",
    measurement= "inner",
    innerDiameter,
    innerStartDiameter = 0,
    innerEndDiameter = 0,
    length = 0,
    rotation = 0,
    taper = 0,
    endCapDiameter = 0,
    endCapThickness = 0,
    endCapGridSize = 0,
    endCapGridWallThickness = 0,
    stopThickness = 0,
    stopLength = 0,
    stopSymmetrical = false,
    barbsCount = 0,
    barbsThickness = 0,
    barbsSymmetrical = false,
    magnetCount = 0,
    magnetDiameter = 0,
    magnetThickness = 0,
    magnetBorder = 0,
    magnetFlangeThickness = 0,
    magnetTwistLockSize = 0,
    alignmentRing = 0,
    alignmentDepth = 0,
    alignmentUpperWidth = 0,
    alignmentLowerWidth = 0,
    alignmentSideClearance = 0,
    alignmentDepthClearance = 0,
    flangeWidth = 0,
    flangeThickness = 0,
    flangeScrewPosition = 0,
    flangeScrewBorder = 0,
    flangeScrewCount = 0,
    flangeScrewDiameter = 0,
    transitionAngle = 0,
    nozzleShape = "square",
    nozzleSize = [20,10,50],
    nozzleTipWallThickness = 0,
    nozzleRadius = 5,
    nozzleOffset = [0,0],
    nozzleChamferPercentage = 0,
    nozzleChamferAngle = 0,
    adapterColor = ["blue",1],
    debug = false,
    showCaliper=false,
    help
){
  assert(is_list(adapterColor), "adapterColor must be a list")
  assert(len(adapterColor) == 2, "adapterColor be length 2")
  
  //Create the start connector
  if(length > 0)
  {
    difference()
    {
      color(adapterColor[0], adapterColor[1])
      rotate([0,0,rotation])
      union(){
        if(style == "mag")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          MagneticConnector(
              innerStartDiameter = innerStartDiameter,
              innerEndDiameter = innerEndDiameter,
              length = length,
              wallThickness = wallThickness,
              magnetDiameter = magnetDiameter,
              magnetThickness = magnetThickness,
              magnetBorder = magnetBorder,
              flangeThickness = magnetFlangeThickness,
              magnetCount = magnetCount,
              alignmentRing = alignmentRing,
              alignmentDepth = alignmentDepth,
              alignmentUpperWidth = alignmentUpperWidth,
              alignmentLowerWidth = alignmentLowerWidth,
              alignmentSideClearance = alignmentSideClearance,
              alignmentDepthClearance = alignmentDepthClearance,
              twistLockSize = magnetTwistLockSize);
        }
        else if(style == "flange")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          FlangeConnector(
            innerStartDiameter = innerStartDiameter,
            innerEndDiameter = innerEndDiameter,
            length = length,
            wallThickness = wallThickness,
            flangeThickness = flangeThickness,
            flangeWidth = flangeWidth,
            screwPosition = flangeScrewPosition,
            screwBorder = flangeScrewBorder,
            screwCount = flangeScrewCount,
            screwDiameter = flangeScrewDiameter,
            help = help);
        }

        else if(style == "hose")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          HoseConnector(
            innerStartDiameter = innerStartDiameter,
            innerEndDiameter = innerEndDiameter,
            connectorMeasurement = measurement,
            length = length,
            wallThickness = wallThickness,
            stopLength = stopLength,
            stopWidth = stopThickness,
            stopSymmetrical = stopSymmetrical,
            barbsCount  = barbsCount,
            barbsThickness = barbsThickness,
            barbsSymmetrical = barbsSymmetrical,
            endCapDiameter = endCapDiameter,
            endCapThickness = endCapThickness,
            endCapGridSize = endCapGridSize,
            endCapGridWallThickness = endCapGridWallThickness,
            help = help);
        }
        else if(style == "dyson")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          DysonConnector(
            innerEndDiameter = innerEndDiameter,
            length = length,
            wallThickness = wallThickness,
            IncludeOrientationClip = true);
        }
        else if(style == "camlock")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          CamlockConnector(
            innerEndDiameter = innerEndDiameter,
            length = length,
            wallThickness = wallThickness);
        }
        else if(style == "dw735")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          Dw735Connector(
            innerEndDiameter = innerEndDiameter,
            length = length,
            wallThickness = wallThickness,
            connectorCount = transitionAngle > 0 ? 6 : 1);
        }
        else if(style == "centec")
        {
          translate([0, 0, length+stopLength])
          mirror ([0,0,1])
          CenTecConnector();
        }
        else if(style == "nozzle")
        {
          Nozzle(
            innerStartDiameter = innerStartDiameter,
            length = length,
            wallThickness = wallThickness,
            nozzleShape = nozzleShape,
            nozzleSize = nozzleSize,
            nozzleTipWallThickness = nozzleTipWallThickness,
            nozzleRadius = nozzleRadius,
            nozzleOffset = nozzleOffset,
            nozzleChamferPercentage = nozzleChamferPercentage,
            nozzleChamferAngle = nozzleChamferAngle,
            help = help);
        } else if(style == "none"){
        }
        else {
         assert(false, str("style not supported style: ", style));
        }
      }
      if($preview&&debug){
        cubeSziex = max(innerStartDiameter,innerEndDiameter)*2;
        cubeSziey = max(innerStartDiameter,innerEndDiameter)*1.5;
        cubeSziez = length+stopLength+fudgeFactor*4
          +(style == "nozzle"? nozzleSize.z+fudgeFactor : 0)
          +(style == "mag"? alignmentDepth: 0);
        translate([-cubeSziex/2, -cubeSziey, -fudgeFactor*2])
        cube([cubeSziex,cubeSziey,cubeSziez]);
      }
    } 
  }

  if($preview&&showCaliper){
    color("Gold")
    translate([0, 0, length+stopLength])
    mirror ([0,0,1])
    mirror (connector == 2 ? [1,0,0] : [0,0,0])
    union(){
      endStyle = measurement == "inner" ? 3 : 4;
      addwidth = measurement == "outer" ? wallThickness*2 : 0;
      translate(style == "nozzle" ? [0,0,length] :[0,0,length/2])
      rotate([90,0,0])
       Caliper(messpunkt = false, help=0, size = 7,h = 0.1,
          l=innerDiameter + addwidth, 
          end=endStyle, 
          in=connector == 1 ? 1 : 0, 
          txt2 = str("con", connector, " ", measurement));
      if(innerDiameter != innerStartDiameter){
        translate([0,0,0])
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, size = 5,h = 0.1,
            l=innerStartDiameter + addwidth, 
            end=endStyle, 
            in=connector == 1 ? 1 : 0,
            txt2 = str("con", connector, " start ", measurement));
      }
      if(innerDiameter != innerEndDiameter){
        translate([0,0,length])
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, size = 5,h = 0.1,
            l=innerEndDiameter + addwidth, 
            end=3, 
            in=connector == 1 ? 1 : 0,
            txt2 = str("con", connector, " end ", measurement));     
      }
      
      barWidth = wallThickness*8;
      position = innerDiameter/2 + wallThickness*2;
      translate([(connector == 1 ? position  : -position), 0, length/2])
      rotate([90,0,0])
      Caliper(messpunkt = false, help=0, h = 0.1,
            center=true,
            l=length,
            cx= 0,
            end=0, 
            size = 8,
            in=connector == 1 ? 2 : 3,
            translate= connector == 1 ? [15,0,0] : [-15,0,0],
            txt2 = str("con", connector, " length"));
        
      if(style == "nozzle")
      {
        translate([(connector == 1 ? position  : -position), 0,-nozzleSize.z/2])
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, h = 0.1,
              l=nozzleSize.z,
              cx= 0,
              end=0, 
              size = 8,
              in=connector == 1 ? 2 : 3,
              translate= connector == 1 ? [15,0,0] : [-15,0,0],
              txt2 = str("nozzle ", connector, " length"));
      }     
    }
  }
  HelpTxt("adapter",[
    "connector", connector,
    "wallThickness", wallThickness,
    "style", style,
    "measurement", measurement,
    "innerDiameter", innerDiameter,
    "innerStartDiameter", innerStartDiameter,
    "innerEndDiameter", innerEndDiameter,
    "length", length,
    "rotation", rotation,
    "taper", taper,
    "endCapDiameter", endCapDiameter,
    "endCapThickness", endCapThickness,
    "endCapGridSize", endCapGridSize,
    "endCapGridWallThickness", endCapGridWallThickness,
    "stopThickness", stopThickness,
    "stopLength", stopLength,
    "stopSymmetrical", stopSymmetrical,
    "barbsCount", barbsCount,
    "barbsThickness", barbsThickness,
    "barbsSymmetrical", barbsSymmetrical,
    "magnetCount", magnetCount,
    "magnetDiameter", magnetDiameter,
    "magnetThickness", magnetThickness,
    "magnetBorder", magnetBorder,
    "magnetFlangeThickness", magnetFlangeThickness,
    "alignmentRing", alignmentRing,
    "alignmentDepth", alignmentDepth,
    "alignmentUpperWidth", alignmentUpperWidth,
    "alignmentLowerWidth", alignmentLowerWidth,
    "alignmentSideClearance", alignmentSideClearance,
    "alignmentDepthClearance", alignmentDepthClearance,
    "flangeWidth", flangeWidth,
    "flangeThickness", flangeThickness,
    "flangeScrewPosition", flangeScrewPosition,
    "flangeScrewBorder", flangeScrewBorder,
    "flangeScrewCount", flangeScrewCount,
    "flangeScrewDiameter", flangeScrewDiameter,
    "transitionAngle", transitionAngle,
    "nozzleShape", nozzleShape,
    "nozzleSize", nozzleSize,
    "nozzleTipWallThickness", nozzleTipWallThickness,
    "nozzleRadius", nozzleRadius,
    "nozzleOffset", nozzleOffset,
    "nozzleChamferPercentage", nozzleChamferPercentage,
    "nozzleChamferAngle", nozzleChamferAngle,
    "adapterColor", adapterColor,
    "debug", debug]
    ,help);
}

module transitionExtension(
  connector,
  innerDiameter = 0,
  wallThickness = 0,
  length = 0 ,
  gridSize = 0,
  gridWallThickness = 0,
  transitionColor = ["LightGreen",1],
  debug = false,
  showCaliper=false,
  help){
  assert(is_list(transitionColor), "transitionColor must be a list");
  assert(len(transitionColor) == 2, "transitionColor be length 2");
  assert(is_num(connector) && (connector ==1 || connector ==2), "connector must be 1 or 2");
  assert(is_num(innerDiameter), "innerDiameter must be a number");
  assert(is_num(wallThickness), "wallThickness must be a number");
  assert(is_num(length), "length must be a number");
  assert(is_num(gridSize), "gridSize must be a number");
  assert(is_num(gridWallThickness), "gridWallThickness must be a number");

  //gridWallThickness, -1 use wall thickness
  gridWallThickness = gridWallThickness < 0 
    ? min(wallThickness, length)
    : min(gridWallThickness, length);
    
  //gridWallThickness == 0 will disable grid
  gridSize = gridWallThickness <= 0 
    ? 0 
    : gridSize <=0 
      ? innerDiameter/6 - gridWallThickness
      : gridSize;
  
  if(length > 0)
  {
    difference(){
      color(transitionColor[0], transitionColor[1])
      HoseConnector(
        innerStartDiameter = innerDiameter,
        innerEndDiameter = innerDiameter,
        connectorMeasurement = "inner",
        length,
        endCapThickness = gridWallThickness,
        wallThickness = wallThickness,
        endCapGridSize = gridSize,
        endCapGridWallThickness = gridWallThickness,
        help);
    
      if($preview&&debug){
        cubeSize = [innerDiameter*2,innerDiameter*1.5, length+fudgeFactor*4];
        translate([-cubeSize.x/2, -cubeSize.y, -fudgeFactor*2])
        cube(cubeSize);
      }
    }

    if($preview&&showCaliper){
    /*render on left side
      color("Gold")
      translate(connector == 1 ? [0, 0, length] : [0, 0, length] )
      mirror(connector == 1 ? [0,0,1] : [0,0,1])
      rotate(connector == 1 ? [0,0,180] : [0,0,0])
      union(){
        barWidth = wallThickness*8;
        position = innerDiameter/2 + wallThickness*2;
        translate([(connector == 1 ? position  : -position), 0, length/2])
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, h = 0.1,
              center=true,
              l=length,
              cx= -1,
              end=0, 
              size = 8,
              in=connector == 1 ? 3 : 2,
              translate= connector == 1 ? [15,0,0] : [-15,0,0],
              txt2 = str("Extension ", connector, " length"));
      }
    }
    */
      color("Aquamarine")
      translate(connector == 1 ? [0, 0, 0] : [0, 0, 0] )
      mirror(connector == 1 ? [0,0,0] : [0,0,0])
      rotate(connector == 1 ? [0,0,0] : [0,0,180])
      union(){
        barWidth = wallThickness*8;
        position = innerDiameter/2 + wallThickness*2;
        translate([(connector == 1 ? position  : -position), 0, length/2])
        rotate([90,0,0])
        Caliper(messpunkt = false, help=0, h = 0.1,
              center=true,
              l=length,
              cx=0,
              end=0, 
              size=6,
              in=connector == 1 ? 2 : 3,
              translate= connector == 1 ? [15,0,0] : [-15,0,0],
              txt2 = str("Extension ", connector, " length"));
      }
    }
  }
  HelpTxt("transitionExtension",[
    "innerDiameter", innerDiameter,
    "wallThickness", wallThickness,
    "length", length,
    "gridSize", gridSize,
    "gridWallThickness", gridWallThickness,
    "transitionColor", transitionColor,
    "debug", debug,
    "showCaliper", showCaliper]
    ,help);
}

module transition(
  style,
  length,
  connector1InnerEndDiameter,
  connector2InnerStartDiameter,
  connector1WallThickness,
  connector2WallThickness,
  thickness,
  bendRadius,
  angle,
  baseType,
  baseThickness,
  baseWidth,
  baseLength,
  baseAngle,
  connector2Count,
  lengthInHull,
  hullLength,
  hullCenterLength,
  edgeOffset,
  hullCenter,
  centerHeight,
  Offset,
  debug = false,
  transitionColor = ["LightGreen",1],
  showCaliper = false,
  help
){
  assert(is_list(transitionColor), "adapterColor must be a list")
  assert(len(transitionColor) == 2, "adapterColor be length 2")
  
  difference()
  {
    union()
    {
      if(style == "flat")
      {
        transDiameter = min(connector1InnerEndDiameter,  connector2InnerStartDiameter);
        transThickness = abs(connector1InnerEndDiameter - connector2InnerStartDiameter)/2 + max(connector1WallThickness,connector2WallThickness);
        color(transitionColor[0], transitionColor[1])
        StraightPipe(
            diameter = transDiameter,
            length = length,
            wallThickness = transThickness);
      }
      if(style == "organicbend")
      {
          //Bent pipe that tapers through the bend.
          color(transitionColor[0], transitionColor[1])
          TaperedBentPipe(
              bendRadius = bendRadius,
              end1InnerPipeDiameter = connector1InnerEndDiameter,
              end2InnerPipeDiameter = connector2InnerStartDiameter,
              end1WallThickness = connector1WallThickness,
              end2WallThickness = connector2WallThickness,
              pipeAngle = angle,
              baseType = baseType,
              baseThickness = baseThickness,
              baseWidth = baseWidth,
              baseLength = baseLength,
              baseAngle = baseAngle,
              end2Count = connector2Count);
      }
      else if(style == "hull")
      {
        color(transitionColor[0], transitionColor[1])
        BentPipeHull(
            inner1PipeRadius = connector1InnerEndDiameter/2,
            inner2PipeRadius = connector2InnerStartDiameter/2,
            end1WallThickness = connector1WallThickness,
            end2WallThickness = connector2WallThickness,
            pipeAngle = angle,
            end2Count = connector2Count,
            lengthInHull = lengthInHull,
            lengthOutHull = hullLength,
            lengthOutHullCenter = hullCenterLength,
            edgeOffset = edgeOffset,
            addCenter = hullCenter,
            centerHeight= centerHeight
        );
      }
      else if(style == "bend+taper")
      {
        //Tapered transition
        //the bent pipe section, diameter matches connector 1.
        if(angle > 0)
        {
          color(transitionColor[0], transitionColor[1])
          BentPipe(
            bendRadius = bendRadius,
            innerPipeDiameter = connector1InnerEndDiameter,
            wallThickness = connector1WallThickness,
            pipeAngle = angle,
            baseType = baseType,
            baseThickness = baseThickness,
            baseWidth = baseWidth,
            baseLength = baseLength,
            baseAngle = baseAngle,
            end2Count = connector2Count);
        }

        //Tapered section position to the end of the bent pipe
        for (rotation = [0:connector2Count-1])
        {
          //color("SpringGreen")
          color(transitionColor[0], transitionColor[1])
          rotate([0, 0, rotation*(360/connector2Count)])
          translate([-bendRadius, 0, 0])
            rotate([0, -angle, 0])
            translate([bendRadius, 0, 0])
              Pipe(
                diameter1 = connector1InnerEndDiameter,
                diameter2 = connector2InnerStartDiameter,
                length = length,
                wallThickness1 = connector1WallThickness,
                wallThickness2 = connector2WallThickness,
                Offset = Offset);
        }
      }
      else if(style == "taper+bend")
      {
        //Tapered section position to the end of the bent pipe
        //color("SpringGreen")
        color(transitionColor[0], transitionColor[1])
        Pipe(
          diameter1 = connector1InnerEndDiameter,
          diameter2 = connector2InnerStartDiameter,
          length = length,
          wallThickness1 = connector1WallThickness,
          wallThickness2 = connector2WallThickness,
          Offset = Offset);

        if(angle > 0)
        {
          //the bent pipe section, diameter matches connector 2.
          translate([Offset.x, Offset.y, 0])
          color(transitionColor[0], transitionColor[1])
          BentPipe(
            bendRadius = bendRadius,
            innerPipeDiameter = connector2InnerStartDiameter,
            wallThickness = connector2WallThickness,
            pipeAngle = angle,
            zPosition = length,
            baseType = baseType,
            baseThickness = baseThickness,
            baseWidth = baseWidth,
            baseLength = baseLength,
            baseAngle = baseAngle,
            end2Count = connector2Count);
        }
      }
    }
    if($preview&&debug){
      cubeSize = max(connector1InnerEndDiameter,connector2InnerStartDiameter)*3;
      translate([-cubeSize/2, -cubeSize , -fudgeFactor*2])
          cube([cubeSize, cubeSize, cubeSize ]);
      //translate([-100/2, -200, -fudgeFactor*2])
      //    cube([200,200,200]);
    }
  
    if(showCaliper){
    }
  }

  HelpTxt("transition",[
    "style", style,
    "length", length,
    "connector1InnerEndDiameter", connector1InnerEndDiameter,
    "connector2InnerStartDiameter", connector2InnerStartDiameter,
    "connector1WallThickness", connector1WallThickness,
    "connector2WallThickness", connector2WallThickness,
    "thickness", thickness,
    "bendRadius", bendRadius,
    "angle", angle,
    "baseType", baseType,
    "baseThickness", baseThickness,
    "baseWidth", baseWidth,
    "baseLength", baseLength,
    "baseAngle", baseAngle,
    "connector2Count", connector2Count,
    "lengthInHull", lengthInHull,
    "hullLength", hullLength,
    "hullCenterLength", hullCenterLength,
    "edgeOffset", edgeOffset,
    "hullCenter", hullCenter,
    "centerHeight", centerHeight,
    "offset", Offset,
    "debug", debug]
    ,help);   
}
  
module HoseAdapter(
  drawAlignmentRing = Draw_Alignment_Ring,
  alignmentDepth = Alignment_Depth,
  alignmentUpperWidth = Alignment_Upper_Width,
  alignmentLowerWidth = Alignment_Lower_Width,
  alignmentSideClearance = Alignment_Side_Clearance,
  alignmentDepthClearance = Alignment_Depth_Clearance,

  connector1Style = End1_Style,
  connector1WallThickness  = End1_Wall_Thickness,
  connector1Measurement = End1_Measurement,
  connector1Diameter = End1_Diameter,
  connector1Length = End1_Length,
  connector1Rotation = End1_Rotation,
  connector1Taper = End1_Taper,
  connector1EndCapDiameter  = End1_Hose_EndCap_Diameter,
  connector1EndCapThickness = End1_Hose_EndCap_Thickness,
  connector1StopThickness = End1_StopThickness,
  connector1StopLength = End1_StopLength,
  connector1StopSymmetrical = End1_Stop_Symmetrical,
  connector1BarbsCount = End1_Barbs_Count,
  connector1BarbsThickness = End1_Barbs_Thickness,
  connector1BarbsSymmetrical = End1_Barbs_Symmetrical,

  connector1MagnetCount = End1_Magnets_Count,
  connector1MagnetDiameter = End1_Magnet_Diameter,
  connector1MagnetThickness = End1_Magnet_Thickness,
  connector1MagnetBorder = End1_Magnet_Border,
  connector1MagnetFlangeThickness = End1_Magnet_Flange_Thickness,
  connector1MagnetTwistLockSize = End1_Magnet_Twist_Lock_Size,
  connector1Ring = End1_Ring,

  connector1FlangeWidth = End1_Flange_Width,
  connector1FlangeThickness = End1_Flange_Thickness,
  connector1FlangeScrewPosition = End1_Flange_Screw_Position,
  connector1FlangeScrewBorder = End1_Flange_Screw_Border,
  connector1FlangeScrewCount = End1_Flange_Screw_Count,
  connector1FlangeScrewDiameter = End1_Flange_Screw_Diameter,

  transitionStyle = Transition_Style,
  transitionLength = Transition_Length,
  transitionBendRadius = Transition_Bend_Radius,
  transitionAngle = Transition_Angle,
  transitionOffset = Transition_Offset,
  transitionBaseType = Transition_Base_Type,
  transitionBaseThickness = Transition_Base_Thickness,
  transitionBaseWidth = Transition_Base_Width,
  transitionBaseLength = Transition_Base_Length,
  transitionBaseAngle = Transition_Base_Angle,
  transitionEnd2Count = Transition_End2_Count,
  transitionHullLength = Transition_HullLength,
  transitionHullCenterLength = Transition_HullCenterLength,
  transitionHullyOffset = Transition_HullyOffset,
  transitionHullCenter = Transition_HullCenter,
  transitionHullCenterHeight= Transition_HullCenterHeight,
  transitionPreLength = Transition_Pre_Length,
  transitionPreGridSize = Transition_Pre_GridSize,
  transitionPreGridWallThickness = Transition_Pre_GridWallThickness,
  transitionPostLength = Transition_Post_Length,
  transitionPostGridSize = Transition_Post_GridSize,
  transitionPostGridWallThickness = Transition_Post_GridWallThickness,

  connector2Style = End2_Style,
  connector2WallThickness  = End2_Wall_Thickness,
  connector2Measurement = End2_Measurement,
  connector2Diameter = End2_Diameter,
  connector2Length = End2_Length,
  connector2Rotation = End2_Rotation,
  connector2Taper = End2_Taper,
  connector2EndCapDiameter  = End2_Hose_EndCap_Diameter,
  connector2EndCapThickness = End2_Hose_EndCap_Thickness,
  connector2EndCapGridSize  = End2_Hose_EndCap_GridSize,
  connector2EndCapGridWallThickness = End2_Hose_EndCap_GridWallThickness,
  connector2StopThickness = End2_StopThickness,
  connector2StopLength = End2_StopLength,
  connector2StopSymmetrical = End2_Stop_Symmetrical,
  connector2BarbsCount = End2_Barbs_Count,
  connector2BarbsThickness = End2_Barbs_Thickness,
  connector2BarbsSymmetrical = End2_Barbs_Symmetrical,

  connector2MagnetCount = End2_Magnets_Count,
  connector2MagnetDiameter = End2_Magnet_Diameter,
  connector2MagnetThickness = End2_Magnet_Thickness,
  connector2MagnetBorder = End2_Magnet_Border,
  connector2MagnetFlangeThickness = End2_Magnet_Flange_Thickness,
  connector2MagnetTwistLockSize = End2_Magnet_Twist_Lock_Size,
  connector2Ring = End2_Ring,

  connector2FlangeWidth = End2_Flange_Width,
  connector2FlangeThickness = End2_Flange_Thickness,
  connector2FlangeScrewPosition = End2_Flange_Screw_Position,
  connector2FlangeScrewBorder = End2_Flange_Screw_Border,
  connector2FlangeScrewCount = End2_Flange_Screw_Count,
  connector2FlangeScrewDiameter = End2_Flange_Screw_Diameter,
  
  connector2NozzleShape = End2_Nozzle_Shape,
  connector2NozzleSize = End2_Nozzle_Size,
  connector2NozzleTipWallThickness = End2_Nozzle_Tip_Wall_Thickness,
  connector2NozzleRadius = End2_Nozzle_Radius,
  connector2NozzleOffset = End2_Nozzle_Offset,
  connector2NozzleChamferPercentage = End2_Nozzle_Chamfer_Percentage,
  connector2NozzleChamferAngle = End2_Nozzle_Chamfer_Angle,
  sliceDebug = Enable_Debug_Slice,
  showCaliper = Enable_Calipers_Slice,
  end1Color = End1_Color,
  end2Color = End2_Color,
  transitionColor = Transition_Color,
  help = Enable_Help
){
  assert(is_num(connector1Length), "connector1Length must be a number");
  
  $gha=[["connector1",[0,0,0]],["connector2",[0,0,0]],["trasnition",[0,0,0]]];
  
  //Apply defauls and overrides
  connector1Measurement = retriveConnectorSetting(connector1Style, iSettingsMeasurement, connector1Measurement);
  connector1Diameter = retriveConnectorSetting(connector1Style, iSettingsDiameter, connector1Diameter);
  connector1WallThickness = retriveConnectorSetting(connector1Style, iSettingsWallThickness, connector1WallThickness);
  connector1Length = retriveConnectorSetting(connector1Style, iSettingsLength, connector1Length);
  connector1Taper = retriveConnectorSetting(connector1Style, iSettingsTaper, connector1Taper);
    
  connector2Measurement = retriveConnectorSetting(connector2Style, iSettingsMeasurement, connector2Measurement);
  connector2Diameter = let(d2 = retriveConnectorSetting(connector2Style, iSettingsDiameter, connector2Diameter)) 
    //For nozzle, if the diameter is 0, then set it to the D1, this will look nice.
    (connector2Style == "nozzle" && d2 == 0) ? connector1Diameter : d2;
  connector2WallThickness = retriveConnectorSetting(connector2Style, iSettingsWallThickness, connector2WallThickness);
  connector2Length = retriveConnectorSetting(connector2Style, iSettingsLength, connector2Length);
  connector2Taper = retriveConnectorSetting(connector2Style, iSettingsTaper, connector2Taper);
    
  end1InnerDiameter = 
    (connector1Measurement == "inner") ? connector1Diameter : 
    connector1Diameter - connector1WallThickness * 2;
  
  end2InnerDiameter = connector2Measurement == "inner" ? connector2Diameter : connector2Diameter - connector2WallThickness * 2;

  //Apply taper, from small to big
  end1InnerStartDiameter = end1InnerDiameter - connector1Taper / 2;
  end1OuterStartDiameter = end1InnerStartDiameter + connector1WallThickness*2;
  end1InnerEndDiameter = end1InnerDiameter + connector1Taper / 2;
  end1OuterEndDiameter = end1InnerEndDiameter + connector1WallThickness*2;

  //Apply taper, from big to small
  end2InnerStartDiameter = end2InnerDiameter + connector2Taper / 2;
  end2OuterStartDiameter = end2InnerStartDiameter + connector2WallThickness*2;
  end2InnerEndDiameter = end2InnerDiameter - connector2Taper / 2;
  end2OuterEndDiameter = end2InnerEndDiameter + connector2WallThickness*2;

  //If the connector hose is not showm the stop has no thickenss
  connector1StopThickness = (connector1Length <= 0 || connector1Style == "mag" || connector1Style == "flange") ? 0 : connector1StopThickness;
  connector2StopThickness = (connector2Length <= 0 || connector2Style == "mag" || connector2Style == "flange") ? 0 : connector2StopThickness;

  //If the stop has no thickness, it needs no length
  connector1StopLength = (connector1StopThickness > 0 && connector1Style == "hose") ? connector1StopLength : 0;
  connector2StopLength = (connector2StopThickness > 0 && connector2Style == "hose") ? connector2StopLength : 0;


  //Transition settings 
  //Total length of connector 1
      endConnector1 = connector1Length + connector1StopLength;

      // transitionLength is not wanted for sweep
      _transitionAngle = (transitionStyle == "flat") ? 0 : transitionAngle;
      _transitionStyle = _transitionAngle == 0 && transitionStyle == "organicbend" ? "bend+taper" : transitionStyle;
      _transitionLength = _transitionStyle == "organicbend" //|| _transitionStyle == "hull"
        ? 0
        : transitionLength == 0
          ? abs(end1OuterEndDiameter - end2OuterStartDiameter)/2
          : transitionLength;
    
      //Calculate the bend radius
      //organicbend, the '0' value must be max of connector 1 or 2 diameter, plus the wall thickness * 2 otherwise it will clip, then add provided radius.
      //transition the '0' value must be end 1 diameter/2 + wall thickenss *2 to prevent clipping, then addd provided radius.

      //((end2InnerStartDiameter + connector1WallThickness)/ sin(_transitionAngle / 2)/2)/ sin(_transitionAngle) + transitionBendRadius
      taperedAverageDiameter = (max(end1OuterEndDiameter,end2OuterStartDiameter)*2 + min(end1OuterEndDiameter,end2OuterStartDiameter))/3;

      hoseSpacer = connector2WallThickness;
      shapeOverlap = ((end1OuterEndDiameter/2-hoseSpacer)-(cos(_transitionAngle)*end2OuterStartDiameter))/sin(_transitionAngle);
      lengthInHull = _transitionStyle == "hull"
        ? (shapeOverlap > 0 ? 0 : shapeOverlap * -1) + _transitionLength
        : 0;
      transitionCenterHeight = transitionHullCenterHeight == 0 ? lengthInHull * 2 : transitionHullCenterHeight;
  
      edgeOffset = _transitionStyle == "hull"
        ? (shapeOverlap > 50
          ? (end1OuterEndDiameter - end2OuterStartDiameter)/2-shapeOverlap/2 + transitionHullyOffset
          : (end1OuterEndDiameter - end2OuterStartDiameter)/2 + transitionHullyOffset) * cos(_transitionAngle)
        : 0;
      //end hull settings
      bendRadius = _transitionStyle == "organicbend"
        ? transitionEnd2Count > 1
          ? -(taperedAverageDiameter/2)/(cos(_transitionAngle)-1)-taperedAverageDiameter/2 + transitionBendRadius
          : taperedAverageDiameter + transitionBendRadius
        : _transitionStyle == "bend+taper"
          ? transitionEnd2Count > 1
            ? -(end1OuterEndDiameter/2)/(cos(_transitionAngle)-1)-end1OuterEndDiameter/2 + transitionBendRadius
            : end1OuterEndDiameter/2 + transitionBendRadius
          : _transitionStyle == "taper+bend"
            ? transitionEnd2Count > 1
              ? -(end2OuterStartDiameter/2)/(cos(_transitionAngle)-1)-end2OuterStartDiameter/2 + transitionBendRadius
              : end2OuterStartDiameter/2 + transitionBendRadius
            : _transitionStyle == "hull"
              ? 0
              : 0;
      
  if(drawAlignmentRing == "end1" || drawAlignmentRing == "end2")
  {
    adapterAlignmentRing(
      centerDiameter = drawAlignmentRing == "end1" 
        ? end1InnerStartDiameter + connector1MagnetBorder + alignmentUpperWidth
        : end2InnerStartDiameter + connector2MagnetBorder + alignmentUpperWidth,
      alignmentDepth = alignmentDepth,
      alignmentUpperWidth = alignmentUpperWidth,
      alignmentLowerWidth = alignmentLowerWidth,
      alignmentSideClearance = alignmentSideClearance,
      alignmentDepthClearance = alignmentDepthClearance,
      magnetBorder = drawAlignmentRing == "end1" ? connector1MagnetBorder : connector2MagnetBorder,
      debug = sliceDebug,
      showCaliper = showCaliper,
      help = help);
  } else {
    difference()
    {
      union() 
      {
        //End1
        translate([0, 0, connector1Length+connector1StopLength])
        mirror ([0,0,1])
        adapter(
          connector = 1,
          wallThickness = connector1WallThickness,
          style= connector1Style,
          measurement= connector1Measurement,
          innerDiameter = end1InnerDiameter,
          innerStartDiameter = end1InnerStartDiameter,
          innerEndDiameter = end1InnerEndDiameter,
          length = connector1Length,
          rotation = connector1Rotation,
          endCapDiameter = connector1EndCapDiameter,
          endCapThickness = connector1EndCapThickness,
          stopThickness = connector1StopThickness,
          stopLength = connector1StopLength,
          stopSymmetrical = connector1StopSymmetrical,
          barbsCount = connector1BarbsCount,
          barbsThickness = connector1BarbsThickness,
          barbsSymmetrical = connector1BarbsSymmetrical,
          magnetCount = connector1MagnetCount,
          magnetDiameter = connector1MagnetDiameter,
          magnetThickness = connector1MagnetThickness,
          magnetBorder = connector1MagnetBorder,
          magnetFlangeThickness = connector1MagnetFlangeThickness,
          magnetTwistLockSize = connector1MagnetTwistLockSize,
          alignmentRing = connector1Ring,
          alignmentDepth = alignmentDepth,
          alignmentUpperWidth = alignmentUpperWidth,
          alignmentLowerWidth = alignmentLowerWidth,
          alignmentSideClearance = alignmentSideClearance,
          alignmentDepthClearance = alignmentDepthClearance,
          flangeWidth = connector1FlangeWidth,
          flangeThickness = connector1FlangeThickness,
          flangeScrewPosition = connector1FlangeScrewPosition,
          flangeScrewBorder = connector1FlangeScrewBorder,
          flangeScrewCount = connector1FlangeScrewCount,
          flangeScrewDiameter = connector1FlangeScrewDiameter,
          transitionAngle =_transitionAngle,
          adapterColor = getColor(end1Color, DefaultEnd1Color),
          debug = sliceDebug,
          showCaliper = showCaliper,
          help = help);
           
        translate([0, 0, endConnector1])
        transitionExtension(
          connector = 1,
          innerDiameter = end1InnerEndDiameter,
          wallThickness = connector1WallThickness,
          length = transitionPreLength,
          gridSize = transitionPreGridSize,
          gridWallThickness = transitionPreGridWallThickness,
          transitionColor = getColor(transitionColor, DefaultTransitionColor),
          debug = sliceDebug,
          showCaliper = showCaliper,
          help = help);
  
        translate([0, 0, endConnector1 + transitionPreLength])
        transition(
          style = _transitionStyle,
          length = _transitionLength,
          connector1InnerEndDiameter = end1InnerEndDiameter,
          connector2InnerStartDiameter = end2InnerEndDiameter,
          connector1WallThickness = connector1WallThickness,
          connector2WallThickness = connector2WallThickness,
          bendRadius = bendRadius,
          angle = _transitionAngle,
          baseType = transitionBaseType,
          baseThickness = transitionBaseThickness,
          baseWidth = transitionBaseWidth,
          baseLength = transitionBaseLength,
          baseAngle = transitionBaseAngle,
          connector2Count = transitionEnd2Count,
          lengthInHull = lengthInHull,
          hullLength = transitionHullLength,
          hullCenterLength = transitionHullCenterLength,
          edgeOffset = edgeOffset,
          hullCenter = transitionHullCenter,
          centerHeight = transitionCenterHeight,
          Offset = transitionOffset,
          debug = sliceDebug,
          transitionColor = getColor(transitionColor, DefaultTransitionColor),
          showCaliper = showCaliper,
          help = help);

        // Create the end connector
        if(connector2Length > 0)
        {
          preRotation = [
            ((_transitionStyle == "taper+bend") ? transitionOffset.x
              : _transitionStyle == "hull" ? -end1OuterEndDiameter/2
              : 0) - bendRadius,
            ((_transitionStyle == "taper+bend") ? transitionOffset.y : 0),
            ((_transitionStyle == "taper+bend" || _transitionStyle == "flat" || _transitionStyle == "none") ? _transitionLength
              : _transitionStyle == "hull" ? 0
              : 0) + endConnector1 + transitionPreLength];

          postRotation = [
            ((_transitionStyle == "bend+taper") ? transitionOffset.x
              : _transitionStyle == "hull" ? end1OuterEndDiameter/2-edgeOffset
              : 0) + bendRadius,
            ((_transitionStyle == "bend+taper") ? transitionOffset.y : 0),
            ((_transitionStyle == "bend+taper") ? _transitionLength
              : _transitionStyle == "hull" ? max(transitionHullLength,transitionHullLength)+lengthInHull+connector2WallThickness
              : 0)];
          //The max above is a bug.
          
    
          for (rotation = [0:transitionEnd2Count-1])
          {
            if(sliceDebug == false || rotation ==0)
            rotate([0, 0, rotation*(360/transitionEnd2Count)])
            translate(preRotation)
            rotate([0, -_transitionAngle, 0])
            translate(postRotation)
            union(){
              translate([0, 0, transitionPostLength])
              mirror([0,0,1])
              transitionExtension(
                connector = 2,
                innerDiameter = end2InnerStartDiameter,
                wallThickness = connector2WallThickness,
                length = transitionPostLength,
                gridSize = transitionPostGridSize,
                gridWallThickness = transitionPostGridWallThickness,
                transitionColor = getColor(transitionColor, DefaultTransitionColor),
                debug = sliceDebug,
                showCaliper = showCaliper,
                help = help);
                
              translate([0, 0, transitionPostLength])
              adapter(
                connector = 2,
                wallThickness = connector2WallThickness,
                style= connector2Style,
                measurement= connector2Measurement,
                innerDiameter = end2InnerDiameter,
                innerStartDiameter = end2InnerStartDiameter,
                innerEndDiameter = end2InnerEndDiameter,
                length = connector2Length,
                rotation = connector2Rotation,
                endCapDiameter = connector2EndCapDiameter,
                endCapThickness = connector2EndCapThickness,
                endCapGridSize = connector2EndCapGridSize,
                endCapGridWallThickness = connector2EndCapGridWallThickness,
                stopThickness = connector2StopThickness,
                stopLength = connector2StopLength,
                stopSymmetrical = connector2StopSymmetrical,
                barbsCount = connector2BarbsCount,
                barbsThickness = connector2BarbsThickness,
                barbsSymmetrical = connector2BarbsSymmetrical,
                magnetCount = connector2MagnetCount,
                magnetDiameter = connector2MagnetDiameter,
                magnetThickness = connector2MagnetThickness,
                magnetBorder = connector2MagnetBorder,
                magnetFlangeThickness = connector2MagnetFlangeThickness,
                magnetTwistLockSize = connector2MagnetTwistLockSize,
                alignmentRing = connector2Ring,
                alignmentDepth = alignmentDepth,
                alignmentUpperWidth = alignmentUpperWidth,
                alignmentLowerWidth = alignmentLowerWidth,
                alignmentSideClearance = alignmentSideClearance,
                alignmentDepthClearance = alignmentDepthClearance,
                flangeWidth = connector2FlangeWidth,
                flangeThickness = connector2FlangeThickness,
                flangeScrewPosition = connector2FlangeScrewPosition,
                flangeScrewBorder = connector2FlangeScrewBorder,
                flangeScrewCount = connector2FlangeScrewCount,
                flangeScrewDiameter = connector2FlangeScrewDiameter,
                nozzleShape = connector2NozzleShape,
                nozzleSize = connector2NozzleSize,
                nozzleTipWallThickness = connector2NozzleTipWallThickness,
                nozzleRadius = connector2NozzleRadius,
                nozzleOffset = connector2NozzleOffset,
                nozzleChamferPercentage = connector2NozzleChamferPercentage,
                nozzleChamferAngle = connector2NozzleChamferAngle,
                transitionAngle =_transitionAngle,
                adapterColor = getColor(end2Color, DefaultEnd2Color),
                debug = sliceDebug,
                showCaliper = rotation == 0 ? showCaliper : false,
                help = help);
              }
          }

          if(_transitionStyle == "hull" && transitionHullCenter)
          {
            translate([0, 0, endConnector1+transitionLength+connector2StopLength+transitionCenterHeight+transitionHullCenterLength])
            adapter(
              connector = 2,
              wallThickness = connector2WallThickness,
              style= connector2Style,
              measurement= connector2Measurement,
              innerDiameter = end2InnerDiameter,
              innerStartDiameter = end2InnerStartDiameter,
              innerEndDiameter = end2InnerEndDiameter,
              length = connector2Length,
              rotation = connector2Rotation,
              endCapDiameter = connector2EndCapDiameter,
              endCapThickness = connector2EndCapThickness,
              endCapGridSize = connector2EndCapGridSize,
              endCapGridWallThickness = connector2EndCapGridWallThickness,
              stopThickness = connector2StopThickness,
              stopLength = connector2StopLength,
              stopSymmetrical = connector2StopSymmetrical,
              barbsCount = connector2BarbsCount,
              barbsThickness = connector2BarbsThickness,
              barbsSymmetrical = connector2BarbsSymmetrical,
              magnetCount = connector2MagnetCount,
              magnetDiameter = connector2MagnetDiameter,
              magnetThickness = connector2MagnetThickness,
              magnetBorder = connector2MagnetBorder,
              magnetFlangeThickness = connector2MagnetFlangeThickness,
              magnetTwistLockSize = connector2MagnetTwistLockSize,
              alignmentRing = connector1Ring,
              alignmentDepth = alignmentDepth,
              alignmentUpperWidth = alignmentUpperWidth,
              alignmentLowerWidth = alignmentLowerWidth,
              alignmentSideClearance = alignmentSideClearance,
              alignmentDepthClearance = alignmentDepthClearance,
              flangeWidth = connector2FlangeWidth,
              flangeThickness = connector2FlangeThickness,
              flangeScrewPosition = connector2FlangeScrewPosition,
              flangeScrewBorder = connector2FlangeScrewBorder,
              flangeScrewCount = connector2FlangeScrewCount,
              flangeScrewDiameter = connector2FlangeScrewDiameter,
              nozzleShape = connector2NozzleShape,
              nozzleSize = connector2NozzleSize,
              nozzleTipWallThickness = connector2NozzleTipWallThickness,
              nozzleRadius = connector2NozzleRadius,
              nozzleOffset = connector2NozzleOffset,
              nozzleChamferPercentage = connector2NozzleChamferPercentage,
              nozzleChamferAngle = connector2NozzleChamferAngle,
              transitionAngle =_transitionAngle,    
              adapterColor = getColor(end2Color, DefaultEnd2Color), 
              debug = sliceDebug,
              showCaliper = showCaliper,
              help = help);
          }
        }
      }
    }
  }
}

