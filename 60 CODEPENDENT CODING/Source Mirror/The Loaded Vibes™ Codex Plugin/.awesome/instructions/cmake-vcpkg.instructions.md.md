---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\cmake-vcpkg.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\cmake-vcpkg.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.cmake-vcpkg.instructions.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\cmake-vcpkg.instructions.md'
source_file: 'cmake-vcpkg.instructions.md'
source_sha256: '262c62d2ae53233d2c166e8570fbd9fa4b25537bdac3b59fb6a48a04c7eebace'
generated: true
---

# `cmake-vcpkg.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\cmake-vcpkg.instructions.md`
> SHA-256: `262c62d2ae53233d2c166e8570fbd9fa4b25537bdac3b59fb6a48a04c7eebace`

```markdown
---
description: 'C++ project configuration and package management'
applyTo: '**/*.cmake, **/CMakeLists.txt, **/*.cpp, **/*.h, **/*.hpp'
---

This project uses vcpkg in manifest mode. Please keep this in mind when giving vcpkg suggestions. Do not provide suggestions like vcpkg install library, as they will not work as expected.
Prefer setting cache variables and other types of things through CMakePresets.json if possible.
Give information about any CMake Policies that might affect CMake variables that are suggested or mentioned.
This project needs to be cross-platform and cross-compiler for MSVC, Clang, and GCC.
When providing OpenCV samples that use the file system to read files, please always use absolute file paths rather than file names, or relative file paths. For example, use `video.open("C:/project/file.mp4")`, not `video.open("file.mp4")`.

```