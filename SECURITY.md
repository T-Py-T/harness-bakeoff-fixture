# Security policy

## Supported versions

Security fixes apply to the current default branch
(`new/phase0-readiness-skeleton`). Older tags and forks are unsupported unless
explicitly noted.

## Reporting a vulnerability

Do not open a public issue that includes credentials, private endpoints, or
exploit details. Prefer GitHub's private vulnerability reporting when the
repository Security tab offers **Report a vulnerability**. If that option is
unavailable, email [`tnt850910@aol.com`](mailto:tnt850910@aol.com) with the
subject prefix `[SECURITY] harness-bakeoff-fixture` before sharing sensitive
details.

Include the affected revision, a minimal reproduction with synthetic data,
expected impact, and any suggested mitigation. The maintainer aims to
acknowledge valid reports within a few business days.

## Repository boundary

This repository is a disposable harness bakeoff fixture (Phase-0 readiness
skeleton). It is not production software and does not host or operate
workloads on behalf of users.

Never commit secrets, decrypted configuration, private endpoints, or
credentials. Treat fixture inputs and outputs as synthetic lab material.
