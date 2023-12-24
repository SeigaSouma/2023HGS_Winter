xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 357;
 4.05407;-3.19310;2.33781;,
 4.05407;-3.18755;-2.34340;,
 4.05407;0.00281;-2.34060;,
 4.05407;-0.00281;2.34061;,
 -4.05405;-3.19310;2.33781;,
 0.00000;-3.19590;4.67844;,
 0.00000;-0.00561;4.68125;,
 -4.05405;-0.00281;2.34061;,
 -4.05405;-3.18755;-2.34340;,
 -4.05405;0.00281;-2.34060;,
 0.00000;-3.19590;4.67844;,
 0.00000;-0.00561;4.68125;,
 0.00000;-3.18470;-4.68399;,
 0.00000;0.00561;-4.68119;,
 4.05407;0.00281;-2.34060;,
 0.00000;0.00561;-4.68119;,
 0.00000;0.00000;0.00000;,
 6.95000;-54.95455;-42.17871;,
 7.75028;-53.73914;-42.17871;,
 7.24354;-56.37988;-42.17871;,
 8.45898;-57.18015;-42.17871;,
 9.17560;-53.44561;-42.17871;,
 9.88431;-56.88659;-42.17871;,
 10.39102;-54.24582;-42.17871;,
 10.68459;-55.67117;-42.17871;,
 11.88051;-49.31729;-42.17871;,
 11.10091;-50.54661;-42.17871;,
 5.98962;-53.37141;-42.17871;,
 6.95457;-48.34254;-42.17871;,
 7.24814;-49.76781;-42.17871;,
 6.28320;-54.79668;-42.17871;,
 2.54859;-54.08015;-42.17871;,
 3.34887;-52.86470;-42.17871;,
 2.84214;-55.50545;-42.17871;,
 4.05759;-56.30574;-42.17871;,
 4.77420;-52.57113;-42.17871;,
 5.48290;-56.01216;-42.17871;,
 -10.19889;-52.81245;-42.17871;,
 -8.44491;-50.75175;-42.17871;,
 -9.98203;-55.50980;-42.17871;,
 -7.92137;-57.26377;-42.17871;,
 -5.74755;-50.53485;-42.17871;,
 -5.22396;-57.04694;-42.17871;,
 -3.68685;-52.28889;-42.17871;,
 -3.46998;-54.98627;-42.17871;,
 -10.08479;-42.05793;-42.17871;,
 -8.02412;-43.81193;-42.17871;,
 -5.14106;-39.52554;-42.17871;,
 -4.91076;-42.22181;-42.17871;,
 2.47011;-68.20539;-42.17871;,
 3.29688;-67.00711;-42.17871;,
 2.73281;-69.63731;-42.17871;,
 3.93105;-70.46405;-42.17871;,
 4.72878;-66.74447;-42.17871;,
 5.36295;-70.20135;-42.17871;,
 5.92702;-67.57117;-42.17871;,
 6.18972;-69.00312;-42.17871;,
 7.00120;-62.56248;-42.17871;,
 7.26390;-63.99437;-42.17871;,
 9.92328;-63.18773;-42.17871;,
 9.10249;-64.39009;-42.17871;,
 -7.01060;-66.94940;-42.17871;,
 -6.59658;-66.15003;-42.17871;,
 -6.73814;-67.80737;-42.17871;,
 -5.93880;-68.22135;-42.17871;,
 -5.73863;-65.87760;-42.17871;,
 -5.08084;-67.94893;-42.17871;,
 -4.93931;-66.29165;-42.17871;,
 -4.66683;-67.14962;-42.17871;,
 -4.34057;-63.16358;-42.17871;,
 -4.74096;-63.97006;-42.17871;,
 -7.70344;-66.03734;-42.17871;,
 -7.43390;-62.88127;-42.17871;,
 -7.16140;-63.73925;-42.17871;,
 -7.43099;-66.89529;-42.17871;,
 -9.77472;-66.69509;-42.17871;,
 -9.36070;-65.89577;-42.17871;,
 -9.50228;-67.55308;-42.17871;,
 -8.70294;-67.96705;-42.17871;,
 -8.50278;-65.62330;-42.17871;,
 -7.84500;-67.69458;-42.17871;,
 -0.01006;-74.68037;-43.78848;,
 -0.01006;-74.68037;-35.40605;,
 -9.44036;-72.15357;-35.40605;,
 -9.44036;-72.15357;-43.78848;,
 -16.34381;-65.25009;-35.40605;,
 -16.34381;-65.25009;-43.78848;,
 -18.87063;-55.81982;-35.40605;,
 -18.87063;-55.81982;-43.78848;,
 -16.34381;-46.38948;-35.40605;,
 -16.34381;-46.38948;-43.78848;,
 -9.44036;-39.48603;-35.40605;,
 -9.44036;-39.48603;-43.78848;,
 -0.01006;-36.95927;-35.40605;,
 -0.01006;-36.95927;-43.78848;,
 9.42022;-39.48603;-35.40605;,
 9.42022;-39.48603;-43.78848;,
 16.32366;-46.38948;-35.40605;,
 16.32366;-46.38948;-43.78848;,
 18.85050;-55.81982;-35.40605;,
 18.85050;-55.81982;-43.78848;,
 18.85050;-55.81982;-43.78848;,
 18.85050;-55.81982;-35.40605;,
 16.32366;-65.25009;-35.40605;,
 16.32366;-65.25009;-43.78848;,
 9.42022;-72.15357;-35.40605;,
 9.42022;-72.15357;-43.78848;,
 -9.44036;-72.15357;-43.78848;,
 -16.34381;-65.25009;-43.78848;,
 -8.17691;-60.53500;-42.76551;,
 -4.72520;-63.98664;-42.76551;,
 18.85050;-55.81982;-43.78848;,
 16.32366;-65.25009;-43.78848;,
 8.15681;-60.53500;-42.76551;,
 9.42022;-55.81982;-42.76551;,
 16.32366;-46.38948;-43.78848;,
 8.15681;-51.10465;-42.76551;,
 9.42022;-39.48603;-43.78848;,
 4.70508;-47.65301;-42.76551;,
 -0.01006;-36.95927;-43.78848;,
 -0.01006;-46.38948;-42.76551;,
 -9.44036;-39.48603;-43.78848;,
 -4.72520;-47.65301;-42.76551;,
 -16.34381;-46.38948;-43.78848;,
 -8.17691;-51.10465;-42.76551;,
 -18.87063;-55.81982;-43.78848;,
 -9.44034;-55.81982;-42.76551;,
 9.42022;-72.15357;-43.78848;,
 -0.01006;-74.68037;-43.78848;,
 -0.01006;-65.25009;-42.76551;,
 4.70508;-63.98664;-42.76551;,
 -8.17691;-60.53500;-42.76551;,
 -9.44034;-55.81982;-42.76551;,
 -7.65598;-55.81982;-44.42616;,
 -6.63163;-59.64277;-44.42616;,
 9.42022;-55.81982;-42.76551;,
 8.15681;-60.53500;-42.76551;,
 6.61151;-59.64277;-44.42616;,
 7.63589;-55.81982;-44.42616;,
 -0.01006;-46.38948;-42.76551;,
 4.70508;-47.65301;-42.76551;,
 3.81291;-49.19822;-44.42616;,
 -0.01006;-48.17391;-44.42616;,
 -8.17691;-51.10465;-42.76551;,
 -6.63163;-51.99683;-44.42616;,
 4.70508;-63.98664;-42.76551;,
 3.81291;-62.44139;-44.42616;,
 -0.01006;-65.25009;-42.76551;,
 -4.72520;-63.98664;-42.76551;,
 -3.83304;-62.44139;-44.42616;,
 -0.01006;-63.46574;-44.42616;,
 8.15681;-51.10465;-42.76551;,
 6.61151;-51.99683;-44.42616;,
 -4.72520;-47.65301;-42.76551;,
 -3.83304;-49.19822;-44.42616;,
 25.04354;-55.81259;-41.71527;,
 17.70687;-73.52356;-41.71527;,
 15.93587;-71.75245;-41.71527;,
 22.53886;-55.81259;-41.71527;,
 -0.00329;-20.39128;-16.66841;,
 -0.00329;-23.08754;-3.11331;,
 23.13647;-32.67206;-3.11331;,
 25.04354;-30.76593;-16.66841;,
 -23.14310;-32.67187;-30.22350;,
 -25.05011;-30.76569;-16.66841;,
 -0.00329;-23.08754;-30.22350;,
 -23.14310;-32.67187;-3.11331;,
 -17.71306;-38.10162;8.37804;,
 -0.00329;-30.76569;8.37791;,
 17.70687;-38.10162;8.37804;,
 -32.72819;-55.81215;-30.22350;,
 -35.42495;-55.81215;-16.66841;,
 -9.58844;-46.22740;16.05647;,
 -0.00329;-42.25706;16.05647;,
 -0.00329;-55.81215;18.75290;,
 9.58224;-46.22740;16.05647;,
 -25.05011;-80.85900;-16.66841;,
 -23.14310;-78.95244;-3.11331;,
 -32.72819;-55.81215;-3.11331;,
 -35.42495;-55.81215;-16.66841;,
 -13.55838;-55.81215;16.05647;,
 13.55220;-55.81259;16.05647;,
 25.04354;-55.81259;8.37791;,
 23.13647;-32.67206;-30.22350;,
 35.41878;-55.81259;-16.66841;,
 32.72199;-55.81259;-30.22350;,
 17.70687;-38.10162;-41.71527;,
 25.04354;-55.81259;-41.71527;,
 -0.00329;-30.76593;-41.71527;,
 32.72199;-55.81259;-3.11331;,
 13.55220;-55.81259;16.05647;,
 -0.00329;-55.81215;18.75290;,
 9.58224;-65.39715;16.05647;,
 35.41878;-55.81259;-16.66841;,
 32.72199;-55.81259;-3.11331;,
 23.13647;-78.95268;-3.11331;,
 25.04354;-80.85900;-16.66841;,
 25.04354;-55.81259;8.37791;,
 17.70687;-73.52356;8.37804;,
 32.72199;-55.81259;-30.22350;,
 23.13647;-78.95268;-30.22341;,
 -0.00329;-80.85900;8.37804;,
 -0.00329;-88.53722;-3.11332;,
 -0.00329;-69.36771;16.05647;,
 25.04354;-55.81259;-41.71527;,
 17.70687;-73.52356;-41.71527;,
 -9.58844;-65.39715;16.05647;,
 -13.55838;-55.81215;16.05647;,
 -17.71306;-73.52334;8.37804;,
 -0.00329;-91.23364;-16.66842;,
 -0.00329;-88.53722;-30.22343;,
 -0.00335;-80.85900;-41.71517;,
 -23.14310;-78.95244;-30.22341;,
 -17.71306;-73.52356;-41.71527;,
 -25.05011;-55.81215;8.37804;,
 -32.72819;-55.81215;-30.22350;,
 -25.05011;-55.81215;-41.71527;,
 -25.05011;-55.81215;-41.71527;,
 -17.71306;-38.10162;-41.71527;,
 -32.72819;-55.81215;-3.11331;,
 -25.05011;-55.81215;8.37804;,
 -22.54541;-55.81218;-41.71527;,
 -15.94207;-39.87270;-41.71527;,
 -15.94207;-39.87270;-39.93778;,
 -22.54541;-55.81218;-39.93778;,
 -17.71306;-38.10162;-41.71527;,
 -0.00329;-30.76593;-41.71527;,
 -0.00327;-33.27060;-41.71527;,
 -0.00335;-80.85900;-41.71517;,
 -17.71306;-73.52356;-41.71527;,
 -15.94207;-71.75245;-41.71527;,
 -0.00333;-78.35438;-41.71519;,
 17.70687;-38.10162;-41.71527;,
 15.93587;-39.87270;-41.71527;,
 -25.05011;-55.81215;-41.71527;,
 -15.94207;-71.75245;-39.93778;,
 -0.00333;-78.35438;-39.93770;,
 -0.00327;-33.27060;-39.93778;,
 15.93587;-71.75245;-39.93778;,
 15.93587;-39.87270;-39.93778;,
 22.53886;-55.81259;-39.93778;,
 -48.09483;-57.26280;-19.76072;,
 -45.04340;-52.02621;-5.33971;,
 -45.04340;-43.36298;-13.26657;,
 -36.35282;-47.58601;6.88448;,
 -36.35282;-31.57955;-7.76128;,
 -45.04340;-42.84200;-24.99800;,
 -36.35282;-30.61692;-29.43627;,
 -45.04340;-63.75675;-5.86080;,
 -36.35282;-69.26244;5.92315;,
 -45.04340;-71.16279;-26.25483;,
 -36.35263;-82.94667;-31.76025;,
 -36.35282;-83.90908;-10.08579;,
 -45.04340;-71.68340;-14.52374;,
 -45.04340;-50.76888;-33.66051;,
 -36.35282;-45.26335;-45.44457;,
 -36.35282;-66.93961;-46.40649;,
 -45.04340;-62.49917;-34.18203;,
 -36.35282;-47.58601;6.88448;,
 -36.35282;-69.26244;5.92315;,
 -36.35282;-31.57955;-7.76128;,
 -36.35282;-83.90908;-10.08579;,
 -36.35282;-30.61692;-29.43627;,
 -36.35263;-82.94667;-31.76025;,
 -36.35282;-45.26335;-45.44457;,
 -36.35282;-66.93961;-46.40649;,
 36.34482;-47.58623;6.88457;,
 45.03542;-52.02621;-5.33971;,
 45.03542;-43.36281;-13.26648;,
 36.34467;-31.57932;-7.76109;,
 48.08736;-57.26280;-19.76061;,
 45.03542;-42.84178;-24.99800;,
 45.03542;-63.75675;-5.86080;,
 36.34482;-30.61692;-29.43617;,
 45.03542;-50.76888;-33.66102;,
 36.34467;-45.26335;-45.44457;,
 45.03542;-62.49917;-34.18203;,
 36.34482;-66.93961;-46.40649;,
 45.03542;-71.16279;-26.25483;,
 36.34482;-82.94624;-31.76025;,
 45.03542;-71.68359;-14.52381;,
 36.34482;-83.90872;-10.08570;,
 36.34482;-69.26244;5.92315;,
 36.34482;-66.93961;-46.40649;,
 36.34482;-82.94624;-31.76025;,
 36.34467;-45.26335;-45.44457;,
 36.34482;-30.61692;-29.43617;,
 36.34482;-83.90872;-10.08570;,
 36.34467;-31.57932;-7.76109;,
 36.34482;-69.26244;5.92315;,
 36.34482;-47.58623;6.88457;,
 -51.42290;-69.86069;-37.61787;,
 -55.66027;-75.49236;-28.27762;,
 -47.07735;-19.17414;-1.96531;,
 -43.49329;-17.82878;-13.30823;,
 43.48506;-27.01115;6.34474;,
 51.41497;-79.04291;-17.96494;,
 55.65244;-75.49275;-28.27781;,
 47.06923;-19.17452;-1.96547;,
 -0.00410;-1.50907;6.28796;,
 -0.00410;-1.50951;-5.68366;,
 43.48506;-17.82896;-13.30830;,
 -51.42290;-79.04269;-17.96482;,
 -43.49329;-27.01071;6.34491;,
 -0.00410;-10.69142;13.96946;,
 51.41497;-69.86091;-37.61808;,
 -49.81806;-70.31663;-37.16487;,
 -42.08713;-19.14755;-13.02030;,
 -45.39422;-20.38428;-2.53068;,
 -53.83275;-75.72089;-28.38449;,
 42.07889;-27.63660;5.14847;,
 45.38608;-20.38448;-2.53080;,
 53.82494;-75.72113;-28.38456;,
 49.81014;-78.98828;-18.60560;,
 -0.00410;-3.35583;-5.68366;,
 -0.00410;-3.35564;5.42524;,
 42.07889;-19.14793;-13.02039;,
 -42.08713;-27.63622;5.14856;,
 -49.81806;-78.98806;-18.60537;,
 -0.00410;-11.87625;12.55321;,
 49.81014;-70.31699;-37.16498;,
 -55.66027;-75.49236;-28.27762;,
 -51.42290;-69.86069;-37.61787;,
 -49.81806;-70.31663;-37.16487;,
 -53.83275;-75.72089;-28.38449;,
 -43.49329;-17.82878;-13.30823;,
 -0.00410;-1.50951;-5.68366;,
 -0.00410;-3.35583;-5.68366;,
 -42.08713;-19.14755;-13.02030;,
 51.41497;-69.86091;-37.61808;,
 55.65244;-75.49275;-28.27781;,
 53.82494;-75.72113;-28.38456;,
 49.81014;-70.31699;-37.16498;,
 43.48506;-27.01115;6.34474;,
 -0.00410;-10.69142;13.96946;,
 -0.00410;-11.87625;12.55321;,
 42.07889;-27.63660;5.14847;,
 -51.42290;-79.04269;-17.96482;,
 -49.81806;-78.98806;-18.60537;,
 43.48506;-17.82896;-13.30830;,
 51.41497;-69.86091;-37.61808;,
 49.81014;-70.31699;-37.16498;,
 42.07889;-19.14793;-13.02039;,
 51.41497;-79.04291;-17.96494;,
 49.81014;-78.98828;-18.60560;,
 -43.49329;-27.01071;6.34491;,
 -51.42290;-79.04269;-17.96482;,
 -49.81806;-78.98806;-18.60537;,
 -42.08713;-27.63622;5.14856;,
 51.41497;-79.04291;-17.96494;,
 49.81014;-78.98828;-18.60560;,
 -51.42290;-69.86069;-37.61787;,
 -49.81806;-70.31663;-37.16487;,
 -4.05405;0.00281;-2.34060;,
 4.05407;-0.00281;2.34061;,
 0.00000;-0.00561;4.68125;,
 -4.05405;-0.00281;2.34061;;
 
 246;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,4,7,9;,
 4;10,0,3,11;,
 4;12,8,9,13;,
 4;1,12,13,2;,
 3;14,15,16;,
 3;17,18,19;,
 3;19,18,20;,
 3;18,21,20;,
 3;20,21,22;,
 3;21,23,22;,
 3;22,23,24;,
 4;25,24,23,26;,
 4;27,28,29,30;,
 3;31,32,33;,
 3;33,32,34;,
 3;32,35,34;,
 3;34,35,36;,
 3;35,27,36;,
 3;36,27,30;,
 4;29,28,25,26;,
 3;37,38,39;,
 3;39,38,40;,
 3;38,41,40;,
 3;40,41,42;,
 3;41,43,42;,
 3;42,43,44;,
 4;41,45,46,43;,
 4;45,47,48,46;,
 3;49,50,51;,
 3;51,50,52;,
 3;50,53,52;,
 3;52,53,54;,
 3;53,55,54;,
 3;54,55,56;,
 4;55,57,58,56;,
 4;57,59,60,58;,
 3;61,62,63;,
 3;63,62,64;,
 3;62,65,64;,
 3;64,65,66;,
 3;65,67,66;,
 3;66,67,68;,
 4;69,68,67,70;,
 4;71,72,73,74;,
 3;75,76,77;,
 3;77,76,78;,
 3;76,79,78;,
 3;78,79,80;,
 3;79,71,80;,
 3;80,71,74;,
 4;73,72,69,70;,
 4;81,82,83,84;,
 4;84,83,85,86;,
 4;86,85,87,88;,
 4;88,87,89,90;,
 4;90,89,91,92;,
 4;92,91,93,94;,
 4;94,93,95,96;,
 4;96,95,97,98;,
 4;98,97,99,100;,
 4;101,102,103,104;,
 4;104,103,105,106;,
 4;106,105,82,81;,
 4;107,108,109,110;,
 4;111,112,113,114;,
 4;115,111,114,116;,
 4;117,115,116,118;,
 4;119,117,118,120;,
 4;121,119,120,122;,
 4;123,121,122,124;,
 4;125,123,124,126;,
 4;127,128,129,130;,
 4;128,107,110,129;,
 4;108,125,126,109;,
 4;112,127,130,113;,
 4;131,132,133,134;,
 4;135,136,137,138;,
 4;139,140,141,142;,
 4;132,143,144,133;,
 4;136,145,146,137;,
 4;147,148,149,150;,
 4;140,151,152,141;,
 4;143,153,154,144;,
 4;145,147,150,146;,
 4;148,131,134,149;,
 4;151,135,138,152;,
 4;153,139,142,154;,
 3;133,144,134;,
 3;134,144,149;,
 3;144,154,149;,
 3;149,154,150;,
 3;154,142,150;,
 3;150,142,146;,
 3;142,141,146;,
 3;146,141,137;,
 3;141,152,137;,
 3;137,152,138;,
 4;155,156,157,158;,
 4;159,160,161,162;,
 4;163,164,159,165;,
 4;166,167,168,160;,
 4;164,166,160,159;,
 4;160,168,169,161;,
 4;170,171,164,163;,
 4;167,172,173,168;,
 3;173,174,175;,
 4;176,177,178,179;,
 3;172,174,173;,
 3;180,174,172;,
 4;169,175,181,182;,
 4;168,173,175,169;,
 4;165,159,162,183;,
 4;183,162,184,185;,
 4;186,183,185,187;,
 4;188,165,183,186;,
 4;161,169,182,189;,
 3;190,191,192;,
 3;175,174,181;,
 4;193,194,195,196;,
 4;194,197,198,195;,
 4;162,161,189,184;,
 4;199,193,196,200;,
 4;195,198,201,202;,
 4;198,192,203,201;,
 4;204,199,200,205;,
 4;197,190,192,198;,
 3;206,191,207;,
 4;202,201,208,177;,
 4;200,196,209,210;,
 4;196,195,202,209;,
 4;211,210,212,213;,
 4;208,206,207,214;,
 3;192,191,203;,
 4;205,200,210,211;,
 4;201,203,206,208;,
 4;213,212,215,216;,
 4;212,176,179,215;,
 4;217,170,163,218;,
 4;177,208,214,178;,
 4;171,219,166,164;,
 4;218,163,165,188;,
 4;209,202,177,176;,
 4;219,220,167,166;,
 4;220,180,172,167;,
 4;210,209,176,212;,
 3;203,191,206;,
 4;221,222,223,224;,
 4;225,226,227,222;,
 4;228,229,230,231;,
 4;226,232,233,227;,
 4;229,234,221,230;,
 4;232,155,158,233;,
 4;234,225,222,221;,
 4;156,228,231,157;,
 3;224,223,235;,
 3;235,223,236;,
 3;223,237,236;,
 3;236,237,238;,
 3;237,239,238;,
 3;238,239,240;,
 4;233,158,240,239;,
 4;157,231,236,238;,
 4;222,227,237,223;,
 4;158,157,238,240;,
 4;230,221,224,235;,
 4;231,230,235,236;,
 4;227,233,239,237;,
 3;241,242,243;,
 4;242,244,245,243;,
 3;241,243,246;,
 4;243,245,247,246;,
 4;248,249,244,242;,
 4;250,251,252,253;,
 4;254,255,256,257;,
 3;241,246,254;,
 4;246,247,255,254;,
 4;257,256,251,250;,
 3;241,257,250;,
 3;241,254,257;,
 3;241,250,253;,
 3;241,248,242;,
 3;241,253,248;,
 4;253,252,249,248;,
 3;258,259,260;,
 3;259,261,260;,
 3;260,261,262;,
 3;261,263,262;,
 3;262,263,264;,
 3;264,263,265;,
 4;266,267,268,269;,
 3;268,270,271;,
 3;267,270,268;,
 3;272,270,267;,
 4;273,271,274,275;,
 4;269,268,271,273;,
 3;274,270,276;,
 3;271,270,274;,
 4;277,276,278,279;,
 4;275,274,276,277;,
 3;280,270,272;,
 4;281,280,272,282;,
 3;276,270,278;,
 4;279,278,280,281;,
 4;282,272,267,266;,
 3;278,270,280;,
 3;283,284,285;,
 3;285,284,286;,
 3;284,287,286;,
 3;286,287,288;,
 3;287,289,288;,
 3;288,289,290;,
 4;291,292,293,294;,
 4;295,296,297,298;,
 4;294,293,299,300;,
 4;300,299,298,301;,
 4;292,302,303,293;,
 4;293,303,304,299;,
 4;299,304,295,298;,
 4;301,298,297,305;,
 4;306,307,308,309;,
 4;310,311,312,313;,
 4;307,314,315,308;,
 4;314,316,311,315;,
 4;309,308,317,318;,
 4;308,315,319,317;,
 4;315,311,310,319;,
 4;316,320,312,311;,
 4;321,322,323,324;,
 4;325,326,327,328;,
 4;329,330,331,332;,
 4;333,334,335,336;,
 4;337,321,324,338;,
 4;339,340,341,342;,
 4;330,343,344,331;,
 4;345,346,347,348;,
 4;349,333,336,350;,
 4;326,339,342,327;,
 4;334,345,348,335;,
 4;351,325,328,352;,
 3;15,353,16;,
 3;354,16,355;,
 3;353,356,16;,
 3;354,14,16;,
 3;356,355,16;;
 
 MeshMaterialList {
  2;
  246;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\boss_bee\\Bee_body.png";
   }
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\boss_bee\\Bee_option.png";
   }
  }
 }
 MeshNormals {
  223;
  -0.500004;-0.000761;0.866023;,
  -1.000000;0.000000;0.000000;,
  -0.499997;0.000761;-0.866027;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;-1.000000;-0.000000;,
  -0.499999;-0.866026;0.000000;,
  -0.866026;-0.499999;0.000000;,
  -1.000000;-0.000001;0.000000;,
  -0.866026;0.499999;0.000000;,
  -0.499997;0.866027;0.000000;,
  0.000000;1.000000;0.000000;,
  0.499997;0.866027;0.000000;,
  0.866026;0.499999;0.000000;,
  1.000000;-0.000001;-0.000000;,
  0.866026;-0.499999;-0.000000;,
  0.500000;-0.866026;-0.000000;,
  -0.000000;-0.311792;-0.950150;,
  -0.155896;-0.270020;-0.950150;,
  -0.270018;-0.155895;-0.950151;,
  -0.311790;-0.000000;-0.950151;,
  -0.270020;0.155897;-0.950150;,
  -0.155897;0.270021;-0.950150;,
  -0.000000;0.311789;-0.950151;,
  0.155896;0.270019;-0.950151;,
  0.270018;0.155897;-0.950151;,
  0.311788;0.000000;-0.950152;,
  0.270016;-0.155895;-0.950152;,
  0.155894;-0.270019;-0.950151;,
  -0.000000;-0.288997;-0.957330;,
  -0.144498;-0.250279;-0.957330;,
  -0.314403;-0.181522;-0.931773;,
  -0.481442;-0.000000;-0.876478;,
  -0.250279;0.144500;-0.957330;,
  -0.144500;0.250280;-0.957329;,
  -0.000000;0.288995;-0.957331;,
  0.144498;0.250278;-0.957330;,
  0.314404;0.181523;-0.931772;,
  0.481440;0.000000;-0.876479;,
  0.250276;-0.144498;-0.957331;,
  0.144497;-0.250278;-0.957330;,
  -0.498489;0.498502;0.709228;,
  -0.652721;0.652738;0.384562;,
  -0.707099;0.707115;0.000000;,
  -0.652722;0.652740;-0.384557;,
  -0.323948;0.323959;-0.888881;,
  -0.000002;0.380624;0.924730;,
  -0.000001;0.704979;0.709228;,
  0.000002;0.923103;0.384552;,
  0.000004;1.000000;0.000000;,
  0.000003;0.923105;-0.384547;,
  0.000001;0.458139;-0.888880;,
  -0.269141;0.269143;0.924730;,
  -0.458137;0.000002;-0.888881;,
  -0.923098;0.000002;-0.384564;,
  0.652723;0.652741;-0.384554;,
  0.707097;0.707116;-0.000000;,
  0.652721;0.652738;0.384561;,
  0.498494;0.498499;0.709227;,
  0.269142;0.269140;0.924730;,
  0.323950;0.323959;-0.888879;,
  0.380625;-0.000002;0.924729;,
  0.704979;-0.000002;0.709228;,
  0.923094;-0.000002;0.384575;,
  1.000000;-0.000002;-0.000000;,
  0.923097;-0.000003;-0.384566;,
  0.458137;-0.000001;-0.888881;,
  -0.000002;0.000002;1.000000;,
  0.269139;-0.269136;0.924732;,
  0.498491;-0.498502;0.709227;,
  0.652719;-0.652742;0.384560;,
  0.707096;-0.707118;-0.000001;,
  0.652721;-0.652745;-0.384551;,
  0.323950;-0.323967;-0.888876;,
  -0.000004;-0.380615;0.924734;,
  -0.000006;-0.704980;0.709227;,
  -0.000003;-0.923103;0.384552;,
  -0.000002;-1.000000;-0.000001;,
  -0.000003;-0.923108;-0.384542;,
  -0.000002;-0.458154;-0.888873;,
  -0.269144;-0.269137;0.924731;,
  -0.498495;-0.498500;0.709225;,
  -0.652724;-0.652734;0.384564;,
  -0.707104;-0.707109;-0.000000;,
  -0.652726;-0.652738;-0.384553;,
  -0.323953;-0.323966;-0.888876;,
  -0.380623;0.000001;0.924730;,
  -0.704975;0.000002;0.709232;,
  -0.923094;0.000002;0.384573;,
  -1.000000;0.000002;-0.000000;,
  0.707089;-0.707125;-0.000000;,
  1.000000;-0.000009;-0.000000;,
  -0.000001;-0.000003;-1.000000;,
  0.000000;-0.000007;-1.000000;,
  0.000001;-0.000003;-1.000000;,
  -0.000001;-0.000001;-1.000000;,
  -0.000002;-0.000001;-1.000000;,
  0.000001;-0.000001;-1.000000;,
  0.000003;0.000000;-1.000000;,
  -0.831460;0.189641;0.522218;,
  -0.924736;0.129914;0.357750;,
  -0.831463;0.503353;0.235170;,
  -0.924736;-0.161106;0.344831;,
  -0.831461;-0.235168;0.503357;,
  -0.924737;0.344829;0.161106;,
  -0.831463;0.522213;-0.189637;,
  -0.924738;0.357747;-0.129914;,
  -0.831457;0.235174;-0.503360;,
  -0.924735;0.161109;-0.344833;,
  -0.831466;-0.189629;-0.522211;,
  -0.924739;-0.129906;-0.357746;,
  -0.831472;-0.503343;-0.235161;,
  -0.924740;-0.344823;-0.161099;,
  -1.000000;0.000000;0.000001;,
  -0.831469;-0.522206;0.189633;,
  -0.924739;-0.357745;0.129913;,
  0.831458;0.189639;0.522220;,
  0.924730;0.344843;0.161115;,
  0.831460;0.503356;0.235174;,
  0.924729;0.129918;0.357767;,
  0.831460;0.522218;-0.189636;,
  0.924731;0.357763;-0.129918;,
  0.924729;0.161111;-0.344847;,
  0.831455;0.235171;-0.503365;,
  1.000000;-0.000001;0.000002;,
  0.924732;-0.129916;-0.357761;,
  0.831462;-0.189635;-0.522216;,
  0.924732;-0.344841;-0.161108;,
  0.831465;-0.503352;-0.235163;,
  0.924730;-0.357765;0.129918;,
  0.831461;-0.522218;0.189634;,
  0.924729;-0.161114;0.344846;,
  0.831459;-0.235172;0.503359;,
  0.721397;0.320842;0.613716;,
  0.883020;0.333149;0.330586;,
  0.721395;0.676587;-0.147713;,
  0.000003;1.000000;0.000004;,
  0.000003;0.905997;0.423283;,
  0.000003;0.641665;0.766985;,
  -0.721395;0.676586;-0.147714;,
  -0.794994;0.549595;0.256769;,
  -0.721398;0.320846;0.613712;,
  0.928281;-0.031640;0.370530;,
  0.928281;0.263893;-0.262021;,
  0.990601;0.123923;0.057897;,
  -0.928284;0.263887;-0.262018;,
  -0.990602;0.123919;0.057894;,
  -0.928285;-0.031640;0.370521;,
  0.928353;-0.263845;0.261813;,
  0.721400;-0.676583;0.147706;,
  0.794996;-0.549590;-0.256773;,
  0.990596;-0.123956;-0.057912;,
  -0.721402;-0.320841;-0.613710;,
  -0.883010;-0.333114;-0.330649;,
  -0.990596;-0.123960;-0.057913;,
  -0.928355;0.031505;-0.370356;,
  -0.000002;-1.000000;0.000207;,
  -0.000002;-0.905995;-0.423288;,
  -0.721401;-0.676582;0.147709;,
  0.721401;-0.320842;-0.613711;,
  0.928354;0.031511;-0.370359;,
  -0.000002;-0.641496;-0.767126;,
  -0.928354;-0.263848;0.261808;,
  -0.000000;0.999999;0.001198;,
  0.500003;-0.000761;0.866024;,
  0.499995;0.000761;-0.866028;,
  0.000000;0.999999;0.001198;,
  -0.000000;0.999999;0.001198;,
  0.053922;0.093396;-0.994168;,
  0.093396;0.053922;-0.994168;,
  -0.107844;0.000000;-0.994168;,
  -0.093396;0.053922;-0.994168;,
  -0.093395;-0.053922;-0.994168;,
  -0.053922;-0.093396;-0.994168;,
  -0.000000;-0.107844;-0.994168;,
  0.053922;-0.093395;-0.994168;,
  0.093395;-0.053922;-0.994168;,
  0.107844;0.000000;-0.994168;,
  -0.053922;0.093396;-0.994168;,
  0.000000;0.107844;-0.994168;,
  0.000002;-0.000001;-1.000000;,
  -0.707096;-0.707118;0.000000;,
  -1.000000;0.000000;0.000000;,
  -0.707092;0.707122;0.000000;,
  0.000005;1.000000;0.000000;,
  0.000004;-1.000000;-0.000000;,
  0.707092;0.707121;0.000000;,
  1.000000;0.000001;0.000003;,
  1.000000;0.000002;0.000002;,
  1.000000;0.000002;-0.000002;,
  1.000000;0.000002;-0.000008;,
  1.000000;0.000001;-0.000012;,
  -1.000000;-0.000007;-0.000007;,
  -1.000000;-0.000002;0.000001;,
  -1.000000;-0.000004;0.000001;,
  -1.000000;-0.000001;0.000001;,
  -1.000000;-0.000002;-0.000001;,
  -1.000000;-0.000002;0.000002;,
  -1.000000;-0.000002;0.000006;,
  -1.000000;-0.000000;0.000010;,
  0.351341;0.936248;0.000006;,
  -0.351268;-0.936275;0.000199;,
  -0.109526;-0.900548;-0.420734;,
  -0.108231;-0.826325;-0.552696;,
  0.298719;0.167058;-0.939606;,
  0.000000;-0.011195;-0.999937;,
  0.108200;-0.826334;-0.552688;,
  0.109492;-0.900553;-0.420733;,
  -0.298730;-0.613471;0.731036;,
  -0.000002;-0.774118;0.633041;,
  -0.108310;-0.954126;-0.279127;,
  -0.298744;0.167053;-0.939598;,
  -0.406716;0.336985;-0.849131;,
  0.108273;-0.954129;-0.279134;,
  0.298721;-0.613471;0.731040;,
  0.406680;-0.435050;0.803332;,
  -0.406693;-0.435053;0.803324;,
  0.406666;0.337002;-0.849148;,
  -0.000000;0.999999;0.001198;,
  0.000000;0.999999;0.001198;,
  -0.000000;0.999999;0.001198;,
  -0.000000;0.999999;0.001198;;
  246;
  4;3,3,3,3;,
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;165,165,165,165;,
  4;2,2,2,2;,
  4;166,166,166,166;,
  3;167,168,164;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  3;5,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  3;5,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  3;4,4,4;,
  4;4,4,4,4;,
  4;6,6,7,7;,
  4;7,7,8,8;,
  4;8,8,9,9;,
  4;9,9,10,10;,
  4;10,10,11,11;,
  4;11,11,12,12;,
  4;12,12,13,13;,
  4;13,13,14,14;,
  4;14,14,15,15;,
  4;15,15,16,16;,
  4;16,16,17,17;,
  4;17,17,6,6;,
  4;169,170,20,19;,
  4;171,172,28,27;,
  4;173,171,27,26;,
  4;174,173,26,25;,
  4;175,174,25,24;,
  4;176,175,24,23;,
  4;177,176,23,22;,
  4;178,177,22,21;,
  4;179,180,18,29;,
  4;180,169,19,18;,
  4;170,178,21,20;,
  4;172,179,29,28;,
  4;20,21,33,32;,
  4;27,28,40,39;,
  4;24,25,37,36;,
  4;21,22,34,33;,
  4;28,29,41,40;,
  4;18,19,31,30;,
  4;25,26,38,37;,
  4;22,23,35,34;,
  4;29,18,30,41;,
  4;19,20,32,31;,
  4;26,27,39,38;,
  4;23,24,36,35;,
  3;33,34,32;,
  3;32,34,31;,
  3;34,35,31;,
  3;31,35,30;,
  3;35,36,30;,
  3;30,36,41;,
  3;36,37,41;,
  3;41,37,40;,
  3;37,38,40;,
  3;40,38,39;,
  4;67,74,93,4;,
  4;50,49,58,57;,
  4;45,44,50,51;,
  4;43,42,48,49;,
  4;44,43,49,50;,
  4;49,48,59,58;,
  4;55,90,44,45;,
  4;42,53,47,48;,
  3;47,68,60;,
  4;84,83,89,90;,
  3;53,68,47;,
  3;87,68,53;,
  4;59,60,62,63;,
  4;48,47,60,59;,
  4;51,50,57,56;,
  4;56,57,65,66;,
  4;61,56,66,67;,
  4;52,51,56,61;,
  4;58,59,63,64;,
  3;62,68,69;,
  3;60,68,62;,
  4;65,64,71,72;,
  4;64,63,70,71;,
  4;57,58,64,65;,
  4;66,65,72,73;,
  4;71,70,76,77;,
  4;70,69,75,76;,
  4;67,66,73,74;,
  4;63,62,69,70;,
  3;81,68,87;,
  4;77,76,82,83;,
  4;73,72,78,79;,
  4;72,71,77,78;,
  4;80,79,85,86;,
  4;82,81,87,88;,
  3;69,68,75;,
  4;74,73,79,80;,
  4;76,75,81,82;,
  4;86,85,55,54;,
  4;85,84,90,55;,
  4;54,55,45,46;,
  4;83,82,88,89;,
  4;90,89,43,44;,
  4;46,45,51,52;,
  4;78,77,83,84;,
  4;89,88,42,43;,
  4;88,87,53,42;,
  4;79,78,84,85;,
  3;75,68,81;,
  4;92,91,91,92;,
  4;46,52,4,4;,
  4;80,86,95,94;,
  4;52,61,4,4;,
  4;86,54,4,95;,
  4;61,67,4,4;,
  4;54,46,4,4;,
  4;74,80,94,93;,
  3;4,181,99;,
  3;99,181,98;,
  3;181,96,98;,
  3;98,96,97;,
  3;96,4,97;,
  3;97,4,5;,
  4;182,183,183,182;,
  4;184,185,185,184;,
  4;91,186,186,91;,
  4;183,184,184,183;,
  4;187,92,92,187;,
  4;185,187,187,185;,
  4;186,182,182,186;,
  3;114,101,105;,
  4;101,100,102,105;,
  3;114,105,107;,
  4;105,102,106,107;,
  4;103,104,100,101;,
  4;113,112,115,116;,
  4;109,108,110,111;,
  3;114,107,109;,
  4;107,106,108,109;,
  4;111,110,112,113;,
  3;114,111,113;,
  3;114,109,111;,
  3;114,113,116;,
  3;114,103,101;,
  3;114,116,103;,
  4;116,115,104,103;,
  3;3,3,3;,
  3;3,188,3;,
  3;3,188,189;,
  3;188,190,189;,
  3;189,190,191;,
  3;191,190,192;,
  4;117,120,118,119;,
  3;118,125,122;,
  3;120,125,118;,
  3;132,125,120;,
  4;121,122,123,124;,
  4;119,118,122,121;,
  3;123,125,126;,
  3;122,125,123;,
  4;127,126,128,129;,
  4;124,123,126,127;,
  3;130,125,132;,
  4;131,130,132,133;,
  3;126,125,128;,
  4;129,128,130,131;,
  4;133,132,120,117;,
  3;128,125,130;,
  3;193,194,195;,
  3;195,194,196;,
  3;194,197,196;,
  3;196,197,198;,
  3;197,199,198;,
  3;198,199,200;,
  4;146,147,141,140;,
  4;134,143,145,135;,
  4;140,141,138,137;,
  4;137,138,201,136;,
  4;147,148,142,141;,
  4;141,142,139,138;,
  4;138,139,134,135;,
  4;136,135,145,144;,
  4;149,150,151,152;,
  4;153,154,155,156;,
  4;150,157,158,151;,
  4;157,159,202,158;,
  4;152,151,160,161;,
  4;151,158,162,160;,
  4;158,154,153,162;,
  4;159,163,155,154;,
  4;203,204,204,203;,
  4;205,206,206,205;,
  4;207,208,208,207;,
  4;209,210,210,209;,
  4;211,203,203,211;,
  4;212,213,213,212;,
  4;208,214,214,208;,
  4;215,216,216,215;,
  4;217,209,209,217;,
  4;206,212,212,206;,
  4;210,215,215,210;,
  4;218,205,205,218;,
  3;168,219,164;,
  3;220,164,221;,
  3;219,222,164;,
  3;220,167,164;,
  3;222,221,164;;
 }
 MeshTextureCoords {
  357;
  0.921703;0.092489;,
  0.897880;0.092489;,
  0.897880;0.080603;,
  0.921703;0.080603;,
  0.826409;0.092489;,
  0.802586;0.092489;,
  0.802586;0.080603;,
  0.826409;0.080603;,
  0.850233;0.092489;,
  0.850233;0.080603;,
  0.945527;0.092489;,
  0.945527;0.080604;,
  0.874056;0.092489;,
  0.874056;0.080603;,
  0.850479;0.050953;,
  0.862390;0.030321;,
  0.874302;0.050953;,
  0.319793;0.808600;,
  0.322161;0.802787;,
  0.322228;0.814386;,
  0.328042;0.816754;,
  0.327947;0.800351;,
  0.333827;0.814319;,
  0.333760;0.802720;,
  0.336196;0.808505;,
  0.335936;0.780618;,
  0.333666;0.786472;,
  0.314403;0.802705;,
  0.314275;0.780618;,
  0.316711;0.786403;,
  0.316839;0.808491;,
  0.300436;0.808586;,
  0.302805;0.802773;,
  0.302872;0.814371;,
  0.308685;0.816740;,
  0.308590;0.800337;,
  0.314470;0.814304;,
  0.283144;0.805941;,
  0.287399;0.801685;,
  0.283144;0.811959;,
  0.287399;0.816214;,
  0.293417;0.801685;,
  0.293417;0.816214;,
  0.297673;0.805941;,
  0.297673;0.811959;,
  0.285313;0.782120;,
  0.289569;0.786376;,
  0.296724;0.777388;,
  0.296754;0.783406;,
  0.320047;0.855690;,
  0.320047;0.849410;,
  0.324487;0.860130;,
  0.330767;0.860130;,
  0.324487;0.844970;,
  0.335207;0.855690;,
  0.330767;0.844970;,
  0.335207;0.849410;,
  0.322311;0.824555;,
  0.326751;0.828995;,
  0.334217;0.819617;,
  0.334248;0.825896;,
  0.299323;0.852957;,
  0.301671;0.847195;,
  0.301738;0.858691;,
  0.307500;0.861039;,
  0.307405;0.844781;,
  0.313234;0.858625;,
  0.313167;0.847129;,
  0.315582;0.852863;,
  0.315324;0.825222;,
  0.313074;0.831024;,
  0.293981;0.847114;,
  0.293855;0.825222;,
  0.296269;0.830956;,
  0.296396;0.852849;,
  0.280138;0.852943;,
  0.282485;0.847181;,
  0.282552;0.858677;,
  0.288314;0.861025;,
  0.288219;0.844767;,
  0.294048;0.858611;,
  0.254039;0.921918;,
  0.267889;0.921918;,
  0.267889;0.905787;,
  0.254039;0.905787;,
  0.267889;0.889657;,
  0.254039;0.889657;,
  0.267889;0.873527;,
  0.254039;0.873527;,
  0.267889;0.857397;,
  0.254039;0.857397;,
  0.267889;0.841267;,
  0.254039;0.841267;,
  0.267889;0.825137;,
  0.254039;0.825137;,
  0.267889;0.809007;,
  0.254039;0.809007;,
  0.267889;0.792877;,
  0.254039;0.792877;,
  0.267889;0.776747;,
  0.254039;0.776747;,
  0.254039;0.970308;,
  0.267889;0.970308;,
  0.267889;0.954178;,
  0.254039;0.954178;,
  0.267889;0.938048;,
  0.254039;0.938048;,
  0.237337;0.874760;,
  0.228050;0.858681;,
  0.215337;0.871410;,
  0.219953;0.879418;,
  0.193417;0.918661;,
  0.211973;0.918673;,
  0.207336;0.901293;,
  0.198092;0.901292;,
  0.177356;0.909373;,
  0.190087;0.896669;,
  0.168090;0.893304;,
  0.185466;0.888661;,
  0.168093;0.874760;,
  0.185461;0.879415;,
  0.177365;0.858697;,
  0.190082;0.871410;,
  0.193426;0.849416;,
  0.198087;0.866784;,
  0.211975;0.849409;,
  0.207332;0.866785;,
  0.228050;0.909402;,
  0.237337;0.893329;,
  0.219960;0.888662;,
  0.215340;0.896669;,
  0.197879;0.969048;,
  0.207824;0.968850;,
  0.206506;0.964159;,
  0.199120;0.964390;,
  0.197381;0.932165;,
  0.188836;0.937380;,
  0.192358;0.940649;,
  0.198710;0.936911;,
  0.221014;0.945698;,
  0.215994;0.937094;,
  0.212533;0.940588;,
  0.216361;0.946904;,
  0.216189;0.963832;,
  0.212869;0.960540;,
  0.184216;0.945981;,
  0.188787;0.947114;,
  0.184299;0.955718;,
  0.189261;0.964209;,
  0.192672;0.960842;,
  0.188910;0.954516;,
  0.207369;0.932179;,
  0.206146;0.936811;,
  0.221014;0.955495;,
  0.216462;0.954215;,
  0.155068;0.813527;,
  0.182710;0.838037;,
  0.184141;0.833634;,
  0.159474;0.811562;,
  0.075088;0.842242;,
  0.075131;0.830023;,
  0.053212;0.827404;,
  0.050499;0.840393;,
  0.100154;0.854564;,
  0.099623;0.840525;,
  0.075061;0.855163;,
  0.097040;0.827554;,
  0.092880;0.814715;,
  0.075166;0.818097;,
  0.057590;0.814655;,
  0.131034;0.854137;,
  0.130063;0.835211;,
  0.086083;0.801579;,
  0.075163;0.804379;,
  0.075073;0.786989;,
  0.064265;0.801598;,
  0.099523;0.914470;,
  0.096797;0.927437;,
  0.124181;0.938028;,
  0.130237;0.920089;,
  0.095222;0.791097;,
  0.055336;0.791512;,
  0.037798;0.801097;,
  0.049895;0.854495;,
  0.019738;0.834844;,
  0.018726;0.853961;,
  0.050054;0.871358;,
  0.023347;0.873350;,
  0.075054;0.870269;,
  0.025730;0.816862;,
  0.055386;0.963142;,
  0.074961;0.967413;,
  0.064180;0.953086;,
  0.019683;0.920089;,
  0.025739;0.938028;,
  0.053123;0.927437;,
  0.050397;0.914470;,
  0.037856;0.953699;,
  0.057511;0.940131;,
  0.018606;0.900971;,
  0.049776;0.900366;,
  0.074960;0.936715;,
  0.074960;0.924839;,
  0.074960;0.950311;,
  0.023175;0.881553;,
  0.049909;0.883480;,
  0.085740;0.953086;,
  0.094534;0.963142;,
  0.092409;0.940131;,
  0.074960;0.912628;,
  0.074960;0.899694;,
  0.074960;0.884540;,
  0.100144;0.900366;,
  0.100011;0.883480;,
  0.112065;0.953699;,
  0.131314;0.900971;,
  0.126745;0.881553;,
  0.126432;0.873350;,
  0.099959;0.871336;,
  0.124195;0.817472;,
  0.112453;0.801988;,
  0.237619;0.774934;,
  0.213631;0.753523;,
  0.212252;0.756750;,
  0.234415;0.776203;,
  0.215082;0.749610;,
  0.179122;0.749761;,
  0.181116;0.754068;,
  0.220236;0.836244;,
  0.241807;0.807613;,
  0.237953;0.806299;,
  0.218043;0.832179;,
  0.155548;0.777180;,
  0.159494;0.778669;,
  0.241807;0.773005;,
  0.235096;0.805312;,
  0.216197;0.828525;,
  0.182424;0.757360;,
  0.185512;0.830256;,
  0.162756;0.780083;,
  0.162834;0.810282;,
  0.300720;0.719846;,
  0.315847;0.713470;,
  0.307083;0.704223;,
  0.332646;0.706614;,
  0.314025;0.687720;,
  0.294231;0.704484;,
  0.287604;0.687707;,
  0.316138;0.726065;,
  0.332646;0.733371;,
  0.294318;0.735464;,
  0.287509;0.751963;,
  0.313755;0.751988;,
  0.307240;0.735225;,
  0.285578;0.713630;,
  0.268763;0.706735;,
  0.268849;0.733465;,
  0.285327;0.726223;,
  0.270501;0.662465;,
  0.287828;0.679794;,
  0.270501;0.637961;,
  0.312335;0.679793;,
  0.287828;0.620634;,
  0.329661;0.662466;,
  0.312333;0.620633;,
  0.329661;0.637962;,
  0.073550;0.733081;,
  0.056751;0.726225;,
  0.047986;0.735472;,
  0.054928;0.751975;,
  0.041624;0.719849;,
  0.035134;0.735212;,
  0.057041;0.713630;,
  0.028508;0.751988;,
  0.026481;0.726065;,
  0.009667;0.732960;,
  0.026231;0.713472;,
  0.009752;0.706230;,
  0.035222;0.704231;,
  0.028413;0.687732;,
  0.048143;0.704470;,
  0.054659;0.687708;,
  0.073550;0.706324;,
  0.028731;0.620634;,
  0.011404;0.637961;,
  0.053236;0.620633;,
  0.070564;0.637962;,
  0.011404;0.662465;,
  0.070564;0.662466;,
  0.028731;0.679794;,
  0.053237;0.679793;,
  0.089968;0.698574;,
  0.089968;0.706731;,
  0.131437;0.706731;,
  0.131437;0.698574;,
  0.198174;0.714889;,
  0.239643;0.714889;,
  0.239643;0.706731;,
  0.198174;0.706731;,
  0.164805;0.706731;,
  0.164805;0.698574;,
  0.198174;0.698574;,
  0.089968;0.714889;,
  0.131437;0.714889;,
  0.164805;0.714889;,
  0.239643;0.698574;,
  0.089822;0.696468;,
  0.131430;0.696468;,
  0.131430;0.689321;,
  0.089822;0.689321;,
  0.198392;0.682173;,
  0.198392;0.689321;,
  0.240000;0.689321;,
  0.240000;0.682173;,
  0.164911;0.696468;,
  0.164911;0.689321;,
  0.198392;0.696468;,
  0.131430;0.682173;,
  0.089822;0.682173;,
  0.164911;0.682173;,
  0.240000;0.696468;,
  0.231622;0.673227;,
  0.239765;0.673227;,
  0.239765;0.671869;,
  0.231622;0.671869;,
  0.131025;0.665545;,
  0.164545;0.665545;,
  0.164545;0.664186;,
  0.131025;0.664186;,
  0.090530;0.673150;,
  0.098673;0.673150;,
  0.098673;0.671793;,
  0.090530;0.671793;,
  0.131025;0.656484;,
  0.164544;0.656484;,
  0.164544;0.655125;,
  0.131025;0.655125;,
  0.223478;0.673227;,
  0.223478;0.671869;,
  0.198065;0.665545;,
  0.239722;0.665545;,
  0.239722;0.664186;,
  0.198065;0.664186;,
  0.106816;0.673150;,
  0.106816;0.671793;,
  0.198064;0.656484;,
  0.239721;0.656484;,
  0.239721;0.655125;,
  0.198064;0.655125;,
  0.089368;0.656484;,
  0.089368;0.655125;,
  0.089368;0.665545;,
  0.089368;0.664186;,
  0.886214;0.030321;,
  0.862390;0.071584;,
  0.886214;0.071585;,
  0.898125;0.050953;;
 }
}