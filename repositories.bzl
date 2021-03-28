load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")


def bazel_release_repositories():

    #
    # Buildifier Repositories
    #
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "d1ffd055969c8f8d431e2d439813e42326961d0942bdf734d2c95dc30c369566",
        urls = [
            "https://github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
        ],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
        urls = [
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        ],
    )

    http_archive(
        name = "com_google_protobuf",
        strip_prefix = "protobuf-master",
        urls = ["https://github.com/protocolbuffers/protobuf/archive/master.zip"],
    )

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        strip_prefix = "buildtools-master",
        url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
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
