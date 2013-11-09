import AssemblyKeys._ // put this at the top of the file

assemblySettings

seq(npSettings: _*)

(NpKeys.defaults in (Compile, NpKeys.np)) ~= {
  _.copy(org="me.rickychang", version="0.1.0-SNAPSHOT")
}