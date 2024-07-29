load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# base jsonnet rules
http_archive(
    name = "io_bazel_rules_jsonnet",
    sha256 = "e09b3c086ee9a38ee0cedbff96719700bd0121d7884d0193664aff5ea320128d",
    strip_prefix = "rules_jsonnet-0.6.0",
    urls = ["https://github.com/bazelbuild/rules_jsonnet/releases/download/0.6.0/rules_jsonnet-0.6.0.tar.gz"],
)

# dependency of rules_jsonnet
http_archive(
    name = "bazel_skylib",
    sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
    ],
)

# jsonnet and go-jsonnet version 0.20 required to support some of the standard
# library methods used by grafonnet
http_archive(
    name = "jsonnet",
    strip_prefix = "jsonnet-0.20.0",
    urls = [
        "https://github.com/google/jsonnet/archive/v0.20.0.tar.gz",
    ],
)

http_archive(
    name = "google_jsonnet_go",
    strip_prefix = "go-jsonnet-0.20.0",
    urls = ["https://github.com/google/go-jsonnet/archive/refs/tags/v0.20.0.tar.gz"],
)

# Something is wrong with how this go dependency is included,
# so overwrite it with something at works. Without this you get the following:
# compilepkg: missing strict dependencies:
#         /private/var/tmp/_bazel_kevin.rosendahl/062f631884af7b4212cdf62b6a729d52/sandbox/darwin-sandbox/5/execroot/__main__/external/io_k8s_sigs_yaml/yaml.go: import of "gopkg.in/yaml.v2"
# No dependencies were provided.
# Check that imports in Go sources match importpath attributes in deps.
http_archive(
    name = "io_bazel_rules_go",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.45.1/rules_go-v0.45.1.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.45.1/rules_go-v0.45.1.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.1")

http_archive(
    name = "bazel_gazelle",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@bazel_gazelle//:deps.bzl", "go_repository")

go_repository(
    name = "io_k8s_sigs_yaml",
    importpath = "sigs.k8s.io/yaml",
    sum = "h1:Mk1wCc2gy/F0THH0TAp1QYyJNzRm2KCLy3o5ASXVI5E=",
    version = "v1.4.0",
)

# jsonnet deps
load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_repositories")

jsonnet_repositories()

load("@google_jsonnet_go//bazel:repositories.bzl", "jsonnet_go_repositories")

jsonnet_go_repositories()

load("@google_jsonnet_go//bazel:deps.bzl", "jsonnet_go_dependencies")

# Supply go_sdk_version=None due to https://github.com/google/go-jsonnet/issues/619
jsonnet_go_dependencies(go_sdk_version = None)

# grafonnet itself
http_archive(
    name = "grafana_grafonnet",
    # grafonnet is expected to be imported as github.com/grafana/grafonnet,
    # so add the prefix https://github.com/bazelbuild/rules_jsonnet/issues/154
    add_prefix = "github.com/grafana/grafonnet",
    build_file = "//:grafonnet.BUILD",
    strip_prefix = "grafonnet-119d65363dff84a1976bba609f2ac3a8f450e760",
    # HEAD of main on 6/6/24
    urls = ["https://github.com/grafana/grafonnet/archive/119d65363dff84a1976bba609f2ac3a8f450e760.tar.gz"],
)

# transitive dependency of grafonnet, without this you get the following:
# RUNTIME ERROR: couldn't open import "github.com/jsonnet-libs/xtd/main.libsonnet": no match locally or in the Jsonnet library paths
http_archive(
    name = "jsonnet_libs_docsonnet",
    add_prefix = "github.com/jsonnet-libs/docsonnet",
    build_file = "//:docsonnet.BUILD",
    strip_prefix = "docsonnet-6ac6c69685b8c29c54515448eaca583da2d88150",
    # HEAD of main on 7/3/24
    urls = ["https://github.com/jsonnet-libs/docsonnet/archive/6ac6c69685b8c29c54515448eaca583da2d88150.tar.gz"],
)

# transitive dependency of grafonnet, without this you get the following:
# RUNTIME ERROR: couldn't open import "github.com/jsonnet-libs/xtd/main.libsonnet": no match locally or in the Jsonnet library paths
http_archive(
    name = "jsonnet_libs_xtd",
    add_prefix = "github.com/jsonnet-libs/xtd",
    build_file = "//:xtd.BUILD",
    strip_prefix = "xtd-63d430b69a95741061c2f7fc9d84b1a778511d9c",
    # HEAD of main on 7/3/24
    urls = ["https://github.com/jsonnet-libs/xtd/archive/63d430b69a95741061c2f7fc9d84b1a778511d9c.tar.gz"],
)
