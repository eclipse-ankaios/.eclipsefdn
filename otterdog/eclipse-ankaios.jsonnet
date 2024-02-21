local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-ankaios') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Ankaios",
    readers_can_create_discussions: true,
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
        "orchestration"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "Test and build Linux amd64",
            "Build Linux arm64",
            "Build requirements tracing",
            "Deploy documentation",
            "Check if documentation has changed"
          ],
          requires_conversation_resolution: true,
        },
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
