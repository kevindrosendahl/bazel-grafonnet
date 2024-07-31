# bazel-grafonnet

A minimal reproduction of getting [grafonnet](https://github.com/grafana/grafonnet) working with Bazel.

A full description of the required setup can be found in [WORKSPACE](WORKSPACE), but at a high level the workarounds include:

- using Jsonnet version 0.20.0 instead of 0.18.0 that's default pulled in by [rules_jsonnet](https://github.com/bazelbuild/rules_jsonnet)
- using a more recent version of `sigs.k8s.io/yaml`, as the default depended upon version fails to compile
- pulling in [docsonnet](https://github.com/jsonnet-libs/docsonnet) and [xtd](https://github.com/jsonnet-libs/xtd) transitive jsonnet dependencies and setting the proper path for them to be imported
