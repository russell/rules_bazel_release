load("@com_github_russell_rules_stately//stately:defs.bzl", "project_installed_files")
load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json",)

def semantic_release():
    jsonnet_to_json(
        name = ".github/workflows/semantic-release.yml",
        src = "@com_github_russell_rules_bazel_release//semantic_release:semantic-release.jsonnet",
        outs = [".github/workflows/semantic-release.yml"],
        ext_strs = {
            "MASTER_BRANCH": "main",
            "NEXT_BRANCH": "next",
        },
    )

    jsonnet_to_json(
        name = ".releaserc.json",
        src = "@com_github_russell_rules_bazel_release//semantic_release:releaserc.jsonnet",
        outs = [".releaserc.json"],
        ext_strs = {
            "MASTER_BRANCH": "main",
            "NEXT_BRANCH": "next",
        },
    )

    project_installed_files(
        name="deploy_semantic_release",
        srcs = [":.releaserc.json", ":.github/workflows/semantic-release.yml"],
    )
