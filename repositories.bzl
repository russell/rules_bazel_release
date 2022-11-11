load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")


def bazel_release_repositories():

    #
    # Buildifier Repositories
    #
    load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

    # buildifier is written in Go and hence needs rules_go to be built.
    # See https://github.com/bazelbuild/rules_go for the up to date setup instructions.
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "d6b2513456fe2229811da7eb67a444be7785f5323c6708b38d851d2b51e54d83",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.30.0/rules_go-v0.30.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.30.0/rules_go-v0.30.0.zip",
        ],
    )

    load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies")

    go_rules_dependencies()

    load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains")

    go_register_toolchains(version = "1.17.2")

    http_archive(
        name = "bazel_gazelle",
        sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        ],
    )

    load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

    # If you use WORKSPACE.bazel, use the following line instead of the bare gazelle_dependencies():
    # gazelle_dependencies(go_repository_default_config = "@//:WORKSPACE.bazel")
    gazelle_dependencies()

    http_archive(
        name = "com_google_protobuf",
        sha256 = "3bd7828aa5af4b13b99c191e8b1e884ebfa9ad371b0ce264605d347f135d2568",
        strip_prefix = "protobuf-3.19.4",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v3.19.4.tar.gz",
        ],
    )

    load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

    protobuf_deps()

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        sha256 = "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        strip_prefix = "buildtools-4.2.2",
        urls = [
            "https://github.com/bazelbuild/buildtools/archive/refs/tags/4.2.2.tar.gz",
        ],
    )

    #
    # Stardoc Repositories
    #
    git_repository(
        name = "io_bazel_stardoc",
        remote = "https://github.com/bazelbuild/stardoc.git",
        tag = "0.4.0",
    )

    #
    # Stately Repositories
    #
    http_archive(
        name = "com_github_russell_rules_stately",
        strip_prefix = "rules_stately-main",
        urls = ["https://github.com/russell/rules_stately/archive/main.zip"],
    )

    #
    # Jsonnet
    #
    http_archive(
        name = "io_bazel_rules_jsonnet",
        sha256 = "7f51f859035cd98bcf4f70dedaeaca47fe9fbae6b199882c516d67df416505da",
        strip_prefix = "rules_jsonnet-0.3.0",
        urls = ["https://github.com/bazelbuild/rules_jsonnet/archive/0.3.0.tar.gz"],
    )
