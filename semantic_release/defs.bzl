load("@com_github_russell_rules_stately//stately:defs.bzl", "project_installed_files")
load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json",)

def semantic_release(master_branch = "main", next_branch = "next"):
    jsonnet_to_json(
        name = "semantic-release-workflow",
        src = "@com_github_russell_rules_bazel_release//semantic_release:semantic-release.jsonnet",
        outs = [".github/workflows/semantic-release.yml"],
        ext_strs = {
            "MASTER_BRANCH": master_branch,
            "NEXT_BRANCH": next_branch,
        },
    )

    jsonnet_to_json(
        name = "semantic-release-config",
        src = "@com_github_russell_rules_bazel_release//semantic_release:releaserc.jsonnet",
        outs = [".releaserc.json"],
        ext_strs = {
            "MASTER_BRANCH": master_branch,
            "NEXT_BRANCH": next_branch,
        },
    )

    project_installed_files(
        name="deploy_semantic_release",
        srcs = [
            ":semantic-release-config",
            ":semantic-release-workflow"
        ],
    )
