local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.ankaios', 'eclipse-ankaios') {
  settings+: {
    description: "",
    name: "Eclipse Ankaios",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('ank-sdk-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Ankaios Python SDK - provides a convenient Python interface for interacting with the Ankaios platform.",
      gh_pages_build_type: "workflow",
      homepage: "https://eclipse-ankaios.github.io/ank-sdk-python/",
      topics+: [
        "ankaios",
        "automotive",
        "containers",
        "orchestration",
        "python",
        "sdk"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        orgs.newRepoRuleset('main_release_protection') {
          allows_creations: true,
          include_refs+: [
            "refs/heads/release-**",
            "~DEFAULT_BRANCH"
          ],
          required_pull_request+: {
            required_approving_review_count: 1,
            requires_review_thread_resolution: true,
          },
          required_status_checks+: {
            do_not_enforce_on_create: true,
          },
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
        orgs.newEnvironment('pypi'),
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
      homepage: "https://eclipse-ankaios.github.io/ank-sdk-rust/",
      topics+: [
        "ankaios",
        "automotive",
        "containers",
        "orchestration",
        "rust",
        "sdk"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        orgs.newRepoRuleset('main_release_protection') {
          allows_creations: true,
          include_refs+: [
            "refs/heads/release-**",
            "~DEFAULT_BRANCH"
          ],
          required_pull_request+: {
            required_approving_review_count: 1,
            requires_review_thread_resolution: true,
          },
          required_status_checks+: {
            do_not_enforce_on_create: true,
          },
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
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "ankaios",
        "automotive",
        "containers",
        "orchestration"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main'),
      ],
      web_commit_signoff_required: false,
      rulesets: [
        orgs.newRepoRuleset('main_release_protection') {
          allows_creations: true,
          include_refs+: [
            "refs/heads/release-**",
            "~DEFAULT_BRANCH"
          ],
          required_pull_request+: {
            required_approving_review_count: 1,
            requires_review_thread_resolution: true,
          },
          required_status_checks+: {
            do_not_enforce_on_create: true,
            status_checks+: [
              "Build Linux amd64 debian package",
              "Build Linux arm64 debian package",
              "Build and run system tests Linux amd64",
              "Build requirements tracing",
              "Check if documentation has changed",
              "Deploy documentation",
              "Run unit tests Linux amd64"
            ],
          },
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
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}