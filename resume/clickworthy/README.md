# Clickworthy Resume Variants

This folder shows a practical way to maintain multiple SWE resume variants from one shared Typst source using a vendored copy of `clickworthy-resume`.

Files:

- `shared.typ`: common content, visibility helpers, and section builders
- `general.typ`: broad software engineer resume
- `backend.typ`: backend and infrastructure focused resume
- `frontend.typ`: frontend and product engineering focused resume
- `out/`: compiled PDFs
- `../../vendor/clickworthy-resume/`: vendored template source

Why this structure works:

- shared profile data lives in one place
- each resume variant gets a different summary and skills emphasis
- entries are shown or hidden with the template's `hide` flag
- targeted versions do not require commenting content in and out

This repo also includes a pinned Typst tool version in `mise.toml` and a repo-local `mise` wrapper in `./bin/mise`.

The normal workflow is:

```sh
./bin/mise install
./bin/mise run resume:general
./bin/mise run resume:backend
./bin/mise run resume:frontend
./bin/mise run resume:all
```

Notes:

- This is an example scaffold, not your final resume content yet.
- The resume imports the vendored template from this repository, so it does not depend on Typst Universe package downloads at compile time.
- `./bin/mise` bootstraps a pinned `mise` release into `.tools/` and keeps its state under this repository instead of relying on a global install.
- I could not compile or validate rendering locally because networked bootstrap/install was not performed in this workspace.
