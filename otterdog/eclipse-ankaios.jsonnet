local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-ankaios') {
  settings+: {
    description: "",
    name: "Eclipse Ankaios",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('ankaios') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Ankaios provides workload and container orchestration for automotive High Performance Computing (HPC) software.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-ankaios.github.io/ankaios/",
      topics+: [
        "automotive",
        "containers",
        "orchestration",
        "ankaios",
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "Build and run system tests Linux amd64",
            "Run unit tests Linux amd64",
            "Build Linux amd64 debian package",
            "Build Linux arm64 debian package",
            "Build requirements tracing",
            "Check if documentation has changed",
            "Deploy documentation",
          ],
          requires_conversation_resolution: true,
        },
        orgs.newBranchProtectionRule('release-**') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "Build and run system tests Linux amd64",
            "Run unit tests Linux amd64",
            "Build Linux amd64 debian package",
            "Build Linux arm64 debian package",
            "Build requirements tracing",
            "Check if documentation has changed",
            "Deploy documentation",
          ],
          requires_conversation_resolution: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('ank-sdk-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Ankaios Python SDK - provides a convenient Python interface for interacting with the Ankaios platform.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-ankaios.github.io/ank-sdk-python/",
      topics+: [
        "automotive",
        "containers",
        "orchestration",
        "ankaios",
        "sdk",
        "python",
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('ank-sdk-rust') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Ankaios Rust SDK - provides a convenient Rust interface for interacting with the Ankaios platform.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-ankaios.github.io/ank-sdk-rust/",
      topics+: [
        "automotive",
        "containers",
        "orchestration",
        "ankaios",
        "sdk",
        "rust",
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
