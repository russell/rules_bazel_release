local master_branch = std.extVar("MASTER_BRANCH");
local next_branch = std.extVar("NEXT_BRANCH");

{
  name: 'Release',
  on: {
    push: {
      branches: [
        master_branch,
      ],
    },
  },
  jobs: {
    release: {
      name: 'Release',
      'runs-on': 'ubuntu-latest',
      steps: [
        {
          name: 'Checkout',
          uses: 'actions/checkout@v1',
        },
        {
          name: 'Setup Node.js',
          uses: 'actions/setup-node@v1',
          with: {
            'node-version': 16,
          },
        },
        {
          name: 'Release',
          env: {
            GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}',
          },
          run: 'npx semantic-release\n',
        },
      ],
    },
  },
}
