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
 42;
 0.63386;0.00000;-3.52209;,
 0.63386;4.17152;-3.52209;,
 14.40036;4.53520;-4.07636;,
 14.40036;0.00000;-4.07636;,
 0.00000;0.00002;3.44356;,
 0.00000;4.68904;3.44356;,
 0.00000;4.68904;0.00000;,
 0.00000;0.00002;0.00000;,
 14.40036;0.00000;4.07636;,
 14.40036;4.53520;4.07636;,
 0.63386;4.17152;3.52209;,
 0.63386;0.00000;3.52209;,
 15.05278;5.09782;0.00000;,
 15.05278;5.09782;3.74378;,
 15.05278;0.00002;3.74378;,
 15.05278;0.00002;0.00000;,
 0.63386;4.79597;0.00000;,
 0.63386;4.79597;3.06351;,
 14.40036;5.55070;3.33059;,
 14.40036;5.55070;0.00000;,
 14.40036;-5.55070;3.33059;,
 0.63386;-4.79595;3.06351;,
 0.63386;-4.79595;-0.00000;,
 14.40036;-5.55070;-0.00000;,
 15.05278;5.09782;-3.74377;,
 15.05278;0.00002;-3.74377;,
 0.00000;4.68904;-3.44356;,
 0.00000;0.00002;-3.44356;,
 0.00000;-4.68902;-3.44356;,
 0.63386;-4.17152;-3.52209;,
 14.40036;-4.53518;-4.07636;,
 15.05278;-5.09780;-3.74377;,
 15.05278;-5.09780;3.74378;,
 14.40036;-4.53518;4.07636;,
 0.63386;-4.17152;3.52209;,
 0.00000;-4.68902;3.44356;,
 0.63386;4.79597;-3.06351;,
 14.40036;5.55070;-3.33059;,
 15.05278;-5.09780;-0.00000;,
 14.40036;-5.55070;-3.33059;,
 0.63386;-4.79595;-3.06351;,
 0.00000;-4.68902;-0.00000;;
 
 40;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,17,18,19;,
 4;20,21,22,23;,
 4;3,2,24,25;,
 4;24,2,1,26;,
 4;26,1,0,27;,
 4;28,29,30,31;,
 4;11,10,5,4;,
 4;5,10,9,13;,
 4;13,9,8,14;,
 4;32,33,34,35;,
 4;19,18,13,12;,
 4;13,18,17,5;,
 4;5,17,16,6;,
 4;26,36,37,24;,
 4;32,20,23,38;,
 4;31,39,40,28;,
 4;22,21,35,41;,
 4;35,21,20,32;,
 4;32,38,15,14;,
 4;8,33,32,14;,
 4;34,33,8,11;,
 4;35,34,11,4;,
 4;41,35,4,7;,
 4;0,29,28,27;,
 4;30,29,0,3;,
 4;31,30,3,25;,
 4;28,41,7,27;,
 4;6,26,27,7;,
 4;16,36,26,6;,
 4;37,36,16,19;,
 4;24,37,19,12;,
 4;25,24,12,15;,
 4;38,31,25,15;,
 4;23,39,31,38;,
 4;22,40,39,23;,
 4;28,40,22,41;;
 
 MeshMaterialList {
  1;
  40;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
    "data\\TEXTURE\\player\\init\\init_UV.jpg";
   }
  }
 }
 MeshNormals {
  44;
  0.140623;-0.447816;-0.882998;,
  0.140623;0.447818;-0.882997;,
  -0.073799;-0.436063;-0.896885;,
  -0.073799;0.436065;-0.896884;,
  -0.073799;-0.436062;0.896885;,
  -1.000000;0.000000;0.000000;,
  0.140619;-0.447815;0.883000;,
  0.886068;0.463554;0.000000;,
  0.131310;-0.119947;-0.984058;,
  0.131310;0.119946;-0.984058;,
  -0.067561;0.116593;-0.990879;,
  -0.067561;-0.116594;-0.990879;,
  -0.067561;-0.116592;0.990879;,
  -0.067561;0.116591;0.990879;,
  0.131306;0.119944;0.984059;,
  0.131306;-0.119944;0.984059;,
  0.171242;0.966654;0.190412;,
  0.171242;0.966653;-0.190414;,
  -0.091097;0.979131;0.181669;,
  -0.091097;0.979131;-0.181671;,
  0.171249;-0.966652;0.190416;,
  0.171249;-0.966651;-0.190418;,
  -0.091098;-0.979130;-0.181674;,
  -0.091098;-0.979130;0.181672;,
  0.454170;0.000000;-0.890915;,
  1.000000;0.000000;0.000000;,
  0.213927;0.000000;0.976850;,
  -0.081661;0.000000;0.996660;,
  -0.122952;0.000000;-0.992413;,
  -0.081661;0.000000;-0.996660;,
  0.213933;0.000000;-0.976848;,
  -0.166346;-0.986067;0.000000;,
  -0.110719;0.993852;0.000000;,
  0.272520;0.962150;0.000000;,
  0.886073;-0.463545;-0.000000;,
  0.272529;-0.962147;-0.000000;,
  -0.110719;-0.993852;0.000000;,
  -0.073800;0.436065;0.896884;,
  -0.122952;0.000000;0.992413;,
  0.140619;0.447817;0.882998;,
  0.454159;0.000000;0.890921;,
  -0.166346;0.986067;0.000000;,
  0.886068;0.463554;0.000000;,
  0.886073;-0.463545;-0.000000;;
  40;
  4;29,10,9,30;,
  4;5,5,5,5;,
  4;26,14,13,27;,
  4;7,7,25,25;,
  4;32,18,16,33;,
  4;20,23,36,35;,
  4;30,9,1,24;,
  4;1,9,10,3;,
  4;3,10,29,28;,
  4;2,11,8,0;,
  4;27,13,37,38;,
  4;37,13,14,39;,
  4;39,14,26,40;,
  4;6,15,12,4;,
  4;33,16,7,7;,
  4;39,16,18,37;,
  4;41,18,32,41;,
  4;3,19,17,1;,
  4;34,20,35,34;,
  4;0,21,22,2;,
  4;36,23,31,31;,
  4;4,23,20,6;,
  4;34,34,25,25;,
  4;26,15,6,40;,
  4;12,15,26,27;,
  4;4,12,27,38;,
  4;5,5,5,5;,
  4;29,11,2,28;,
  4;8,11,29,30;,
  4;0,8,30,24;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;32,19,41,41;,
  4;17,19,32,33;,
  4;42,17,33,7;,
  4;25,42,7,25;,
  4;34,43,25,25;,
  4;35,21,43,34;,
  4;36,22,21,35;,
  4;31,22,36,31;;
 }
 MeshTextureCoords {
  42;
  0.120153;0.848652;,
  0.120153;0.793691;,
  0.253918;0.788899;,
  0.253918;0.848652;,
  0.113994;0.848652;,
  0.113994;0.786872;,
  0.113994;0.786872;,
  0.113994;0.848652;,
  0.253918;0.848652;,
  0.253918;0.788899;,
  0.120153;0.793691;,
  0.120153;0.848652;,
  0.260257;0.781487;,
  0.260257;0.781487;,
  0.260257;0.848652;,
  0.260257;0.848652;,
  0.120153;0.785464;,
  0.120153;0.785464;,
  0.253918;0.775520;,
  0.253918;0.775520;,
  0.253918;0.921783;,
  0.120153;0.911839;,
  0.120153;0.911839;,
  0.253918;0.921783;,
  0.260257;0.781487;,
  0.260257;0.848652;,
  0.113994;0.786872;,
  0.113994;0.848652;,
  0.113994;0.910431;,
  0.120153;0.903612;,
  0.253918;0.908404;,
  0.260257;0.915817;,
  0.260257;0.915817;,
  0.253918;0.908404;,
  0.120153;0.903612;,
  0.113994;0.910431;,
  0.120153;0.785464;,
  0.253918;0.775520;,
  0.260257;0.915817;,
  0.253918;0.921783;,
  0.120153;0.911839;,
  0.113994;0.910431;;
 }
}