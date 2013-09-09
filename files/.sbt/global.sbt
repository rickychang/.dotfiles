import AssemblyKeys._

scalaVersion := "2.10.2"

assemblySettings

seq(npSettings: _*)

(NpKeys.defaults in (Compile, NpKeys.np)) ~= {
  _.copy(org="me.rickychang", version="0.1.0-SNAPSHOT")
}