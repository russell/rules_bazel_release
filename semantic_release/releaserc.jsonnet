local master_branch = std.extVar("MASTER_BRANCH");
local next_branch = std.extVar("NEXT_BRANCH");

{
  branches: ['main', 'next'],
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    '@semantic-release/github',
  ],
}
