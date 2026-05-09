## Resubmission

This is a patch release (1.0.0 -> 1.0.1) addressing the NOTE flagged in
the CRAN check results for marsrad 1.0.0:

> Authors@R field gives a non-standard call: structure("0000-0002-2104-8789", .Names = "ORCID")

The `Authors@R` field has been updated to use the CRAN-allowed
`c(ORCID = "0000-0002-2104-8789")` form, which also resolves the
downstream Author/Maintainer field mismatch reported on r-devel-debian.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments

* local: macOS Sequoia 15.7.2, R 4.5.2
* GitHub Actions (via usethis::use_github_action()):
  - {os: macos-latest,   r: 'release'}
  - {os: windows-latest, r: 'release'}
  - {os: ubuntu-latest,   r: 'devel'}
  - {os: ubuntu-latest,   r: 'release'}
  - {os: ubuntu-latest,   r: 'oldrel-1'}

## Downstream dependencies

There are currently no downstream dependencies for this package.
