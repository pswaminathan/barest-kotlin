load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_PROTO_VERSION = "4.0.0"
http_archive(
    name = "rules_proto",
    sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",
    strip_prefix = "rules_proto-%s" % RULES_PROTO_VERSION,
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/refs/tags/%s.tar.gz" % RULES_PROTO_VERSION,
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/%s.tar.gz" % RULES_PROTO_VERSION,
    ],
)
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

##### Android Setup #####

android_sdk_repository(
    name = "androidsdk",
    api_level = 31,
    build_tools_version = "33.0.0",
)

http_archive(
    name = "io_bazel_rules_kotlin",
    sha256 = "946747acdbeae799b085d12b240ec346f775ac65236dfcf18aa0cd7300f6de78",
    urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v1.7.0-RC-2/rules_kotlin_release.tgz"],
)

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")
kotlin_repositories()

# load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")
# kt_register_toolchains()
register_toolchains("//:kotlin_toolchain")


RULES_JVM_EXTERNAL_TAG = "4.2"
http_archive(
    name = "rules_jvm_external",
    sha256 = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")
maven_artifacts = (
    [
        maven.artifact("junit", "junit", "4.13", testonly = True),
    ]
)

maven_install(
    artifacts = maven_artifacts,
    repositories = [
        "https://dl.google.com/dl/android/maven2/",
        "https://repo.maven.apache.org/maven2/",
        "https://plugins.gradle.org/m2/",
        "https://maven.pkg.jetbrains.space/public/p/compose/dev",
        "https://appboy.github.io/appboy-android-sdk/sdk",
    ]
)
