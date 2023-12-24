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
 133;
 -9.39462;78.83079;-29.71189;,
 29.71064;78.83079;-29.71189;,
 29.71064;50.64079;-29.71189;,
 -9.39462;50.64079;-29.71189;,
 -29.71218;50.64079;-29.71189;,
 -9.39462;-0.52615;-29.71189;,
 -29.71218;-0.52615;-29.71189;,
 29.71064;-0.52615;-29.71189;,
 29.71064;78.83079;-29.71189;,
 29.71064;78.83079;29.71094;,
 29.71064;50.64079;29.71094;,
 29.71064;50.64079;-29.71189;,
 29.71064;-0.52615;29.71094;,
 29.71064;-0.52615;-29.71189;,
 29.71064;78.83079;29.71094;,
 -9.39462;78.83079;29.71094;,
 -9.39462;50.64079;29.71094;,
 29.71064;50.64079;29.71094;,
 -9.39462;-0.52615;29.71094;,
 29.71064;-0.52615;29.71094;,
 -29.71218;50.64079;29.71094;,
 -29.71218;-0.52615;29.71094;,
 -9.39462;78.83079;29.71094;,
 -9.39462;78.83079;-29.71189;,
 -29.71218;50.64079;-29.71189;,
 -29.71218;50.64079;29.71094;,
 -29.71218;-0.52615;-29.71189;,
 -29.71218;-0.52615;29.71094;,
 -9.39462;78.83079;29.71094;,
 29.71064;78.83079;29.71094;,
 29.71064;78.83079;-29.71189;,
 -9.39462;78.83079;-29.71189;,
 -29.71218;-0.52615;-29.71189;,
 -9.39462;-0.52615;-29.71189;,
 -9.39462;-0.52615;29.71094;,
 -29.71218;-0.52615;29.71094;,
 29.71064;-0.52615;-29.71189;,
 29.71064;-0.52615;29.71094;,
 1.35145;87.47766;-23.99851;,
 17.92345;87.47766;-23.99851;,
 17.92345;83.84387;-23.99851;,
 1.35145;83.84387;-23.99851;,
 17.92345;78.76055;-23.99851;,
 1.35145;78.76055;-23.99851;,
 23.81978;83.84387;-23.99851;,
 23.81978;78.76055;-23.99851;,
 23.81978;83.84387;-23.99851;,
 23.81978;83.84387;-6.83510;,
 23.81978;78.76055;-6.83510;,
 23.81978;78.76055;-23.99851;,
 17.92345;87.47766;-6.83510;,
 1.35145;87.47766;-6.83510;,
 1.35145;83.84387;-6.83510;,
 17.92345;83.84387;-6.83510;,
 23.81978;83.84387;-6.83510;,
 17.92345;78.76055;-6.83510;,
 23.81978;78.76055;-6.83510;,
 1.35145;78.76055;-6.83510;,
 1.35145;87.47766;-6.83510;,
 1.35145;87.47766;-23.99851;,
 1.35145;83.84387;-23.99851;,
 1.35145;83.84387;-6.83510;,
 1.35145;78.76055;-23.99851;,
 1.35145;78.76055;-6.83510;,
 17.92345;87.47766;-23.99851;,
 1.35145;87.47766;-23.99851;,
 23.81978;83.84387;-6.83510;,
 23.81978;83.84387;-23.99851;,
 1.35145;78.76055;-23.99851;,
 17.92345;78.76055;-23.99851;,
 23.81978;78.76055;-23.99851;,
 23.81978;83.84387;-6.83510;,
 23.81978;83.84387;-23.99851;,
 26.00166;100.56383;-22.65828;,
 26.59095;100.56383;-22.65828;,
 26.59095;78.53934;-22.65828;,
 26.00166;78.53934;-22.65828;,
 26.59095;100.56383;-22.65828;,
 26.59095;100.56383;-22.06901;,
 26.59095;78.53934;-22.06901;,
 26.59095;78.53934;-22.65828;,
 26.59095;100.56383;-22.06901;,
 26.00166;100.56383;-22.06901;,
 26.00166;78.53934;-22.06901;,
 26.59095;78.53934;-22.06901;,
 26.00166;100.56383;-22.06901;,
 26.00166;100.56383;-22.65828;,
 26.00166;78.53934;-22.65828;,
 26.00166;78.53934;-22.06901;,
 26.59095;100.56383;-22.65828;,
 26.00166;100.56383;-22.65828;,
 26.00166;78.53934;-22.65828;,
 26.59095;78.53934;-22.65828;,
 26.00166;91.98550;-14.97455;,
 26.59095;91.98550;-14.97455;,
 26.59095;91.98550;-29.75274;,
 26.00166;91.98550;-29.75274;,
 26.59095;91.98550;-14.97455;,
 26.59095;91.39610;-14.97455;,
 26.59095;91.39610;-29.75274;,
 26.59095;91.98550;-29.75274;,
 26.59095;91.39610;-14.97455;,
 26.00166;91.39610;-14.97455;,
 26.00166;91.39610;-29.75274;,
 26.59095;91.39610;-29.75274;,
 26.00166;91.39610;-14.97455;,
 26.00166;91.98550;-14.97455;,
 26.00166;91.98550;-29.75274;,
 26.00166;91.39610;-29.75274;,
 26.59095;91.98550;-14.97455;,
 26.00166;91.98550;-14.97455;,
 26.00166;91.98550;-29.75274;,
 26.59095;91.98550;-29.75274;,
 32.63382;99.31341;-14.21240;,
 33.08849;99.31341;-14.58723;,
 19.95879;99.31341;-30.51489;,
 19.50403;99.31341;-30.14009;,
 33.08849;99.31341;-14.58723;,
 33.08849;98.72402;-14.58723;,
 19.95879;98.72402;-30.51489;,
 19.95879;99.31341;-30.51489;,
 33.08849;98.72402;-14.58723;,
 32.63382;98.72402;-14.21240;,
 19.50403;98.72402;-30.14009;,
 19.95879;98.72402;-30.51489;,
 32.63382;98.72402;-14.21240;,
 32.63382;99.31341;-14.21240;,
 19.50403;99.31341;-30.14009;,
 19.50403;98.72402;-30.14009;,
 33.08849;99.31341;-14.58723;,
 32.63382;99.31341;-14.21240;,
 19.50403;99.31341;-30.14009;,
 19.95879;99.31341;-30.51489;;
 
 48;
 4;0,1,2,3;,
 4;4,3,5,6;,
 4;3,2,7,5;,
 4;8,9,10,11;,
 4;11,10,12,13;,
 4;14,15,16,17;,
 4;17,16,18,19;,
 4;16,20,21,18;,
 4;22,23,24,25;,
 4;25,24,26,27;,
 4;28,29,30,31;,
 4;32,33,34,35;,
 4;33,36,37,34;,
 3;15,20,16;,
 3;0,3,4;,
 4;38,39,40,41;,
 4;41,40,42,43;,
 4;40,44,45,42;,
 4;46,47,48,49;,
 4;50,51,52,53;,
 4;54,53,55,56;,
 4;53,52,57,55;,
 4;58,59,60,61;,
 4;61,60,62,63;,
 4;58,50,64,65;,
 4;50,66,67,64;,
 4;68,69,55,63;,
 4;69,70,48,55;,
 3;71,50,53;,
 3;72,40,39;,
 4;73,74,75,76;,
 4;77,78,79,80;,
 4;81,82,83,84;,
 4;85,86,87,88;,
 4;85,78,89,90;,
 4;91,92,79,88;,
 4;93,94,95,96;,
 4;97,98,99,100;,
 4;101,102,103,104;,
 4;105,106,107,108;,
 4;105,98,109,110;,
 4;111,112,99,108;,
 4;113,114,115,116;,
 4;117,118,119,120;,
 4;121,122,123,124;,
 4;125,126,127,128;,
 4;125,118,129,130;,
 4;131,132,119,128;;
 
 MeshMaterialList {
  5;
  48;
  0,
  0,
  0,
  1,
  1,
  0,
  0,
  0,
  1,
  1,
  2,
  2,
  2,
  0,
  0,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\building001.jpg";
   }
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\building001.jpg";
   }
  }
  Material {
   0.460800;0.460800;0.460800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  20;
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -0.455687;0.890140;0.000000;,
  -0.951644;0.307204;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  0.873112;0.487519;0.000000;,
  0.000000;0.000000;1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;0.000000;,
  0.771626;0.000000;-0.636077;,
  -1.000000;0.000000;0.000000;,
  0.272656;0.962112;0.000000;,
  -0.771624;0.000000;0.636078;,
  0.636111;0.000000;0.771597;,
  -0.636005;0.000000;-0.771685;;
  48;
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;3,3,4,4;,
  4;4,4,5,5;,
  4;3,6,6,3;,
  4;7,7,7,7;,
  4;7,7,7,7;,
  3;2,2,2;,
  3;0,0,0;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;9,9,11,11;,
  4;10,10,10,10;,
  4;10,10,10,10;,
  4;10,10,10,10;,
  4;15,15,15,15;,
  4;15,15,15,15;,
  4;12,16,16,12;,
  4;16,9,9,16;,
  4;13,13,13,13;,
  4;13,13,13,13;,
  3;10,10,10;,
  3;8,8,8;,
  4;8,8,8,8;,
  4;11,11,11,11;,
  4;10,10,10,10;,
  4;15,15,15,15;,
  4;12,12,12,12;,
  4;13,13,13,13;,
  4;12,12,12,12;,
  4;11,11,11,11;,
  4;13,13,13,13;,
  4;15,15,15,15;,
  4;10,10,10,10;,
  4;8,8,8,8;,
  4;12,12,12,12;,
  4;14,14,14,14;,
  4;13,13,13,13;,
  4;17,17,17,17;,
  4;18,18,18,18;,
  4;19,19,19,19;;
 }
 MeshTextureCoords {
  133;
  0.483791;0.387587;,
  0.551261;0.387587;,
  0.551261;0.436225;,
  0.483791;0.436225;,
  0.448736;0.436225;,
  0.483791;0.524506;,
  0.448736;0.524506;,
  0.551261;0.524506;,
  0.448737;0.387594;,
  0.551261;0.387594;,
  0.551261;0.436231;,
  0.448737;0.436231;,
  0.551261;0.524510;,
  0.448737;0.524510;,
  0.551261;0.387587;,
  0.483791;0.387587;,
  0.483791;0.436225;,
  0.551261;0.436225;,
  0.483791;0.524506;,
  0.551261;0.524506;,
  0.448736;0.436225;,
  0.448736;0.524506;,
  0.551261;0.387594;,
  0.448737;0.387594;,
  0.448737;0.436231;,
  0.551261;0.436231;,
  0.448737;0.524510;,
  0.551261;0.524510;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.500000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;0.500000;,
  1.000000;1.000000;,
  0.000000;0.500000;,
  1.000000;0.500000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.500000;0.500000;,
  0.000000;0.500000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;0.500000;,
  0.000000;0.500000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.500000;1.000000;,
  0.000000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;0.000000;,
  0.500000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.250000;,
  1.000000;0.250000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}