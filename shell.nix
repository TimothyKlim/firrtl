{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  jdk = openjdk11;
in mkShell {
  name = "firrtl-env";
  nativeBuildInputs = [ jdk ];
  buildInputs = [ sbt protobuf3_6 ];

  shellHook = ''
    export JAVA_HOME=${jdk.home}
    export JAVA_INCLUDE_PATH=${jdk.home}/include
    export JNI_INCLUDE_DIRS=${jdk.home}/include
  '';
}
