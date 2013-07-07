addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.2.0")

addSbtPlugin("me.lessis" % "np" % "0.2.0")

addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.9.0")

resolvers += Resolver.url("sbt-plugin-releases",
  url("http://scalasbt.artifactoryonline.com/scalasbt/sbt-plugin-releases/"))(
    Resolver.ivyStylePatterns)
