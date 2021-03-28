load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
load("@com_github_russell_rules_stately//stately:deps.bzl", "stately_repositories")
load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_repositories")
load("@jsonnet_go//bazel:repositories.bzl", "jsonnet_go_repositories")
load("@jsonnet_go//bazel:deps.bzl", "jsonnet_go_dependencies")

def bazel_release_dependencies():
    go_rules_dependencies()

    go_register_toolchains()

    # If you use WORKSPACE.bazel, use the following line instead of the bare gazelle_dependencies():
    # gazelle_dependencies(go_repository_default_config = "@//:WORKSPACE.bazel")
    gazelle_dependencies()

    protobuf_deps()

    stardoc_repositories()

    stately_repositories()

    jsonnet_go_repositories()

    jsonnet_go_dependencies()
