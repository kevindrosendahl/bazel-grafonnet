load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library")

jsonnet_library(
    name="grafana_grafonnet",
    visibility = ["//visibility:public"],
    srcs = glob(["**/*.libsonnet"]),
    deps = [
        "@jsonnet_libs_docsonnet",
        "@jsonnet_libs_xtd",
    ]
)
