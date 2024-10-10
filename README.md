# Feed-Comment-Trigger-to-Flow

Contains metadata to create automations for Chatter Feed Comments declaratively via Flows

## Deploy

<a href="https://github.com/Enclude-Components/Feed-Comment-Trigger-to-Flow/releases/latest">
  <img alt="Install Latest Release"
       src="https://img.shields.io/badge/Install%20Latest%20Release-238636?style=for-the-badge&logoColor=white&logo=DocuSign">
</a>

## Contents

- Apex Classes
    - FeedCommentFlowInvocation.cls
    - FeedCommentFlowInvocation_TEST.cls
    - FeedCommentTrigger.cls
    - FlowInvocationService.cls
    - FlowInvocationService_TEST.cls
    - ObjectIdentifierInvocable.cls
    - ObjectIdentifierInvocable_TEST.cls
- Apex Trigger
    - FeedComment.trigger
- Flow
    - Feed_Comment_Trigger_Flow

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.

## Release

1. Release a Beta Version
```bash
cci flow run release_unlocked_beta --org dev
```

2. Test Deploy the Beta Version
```bash
cci flow run ci_beta --org beta
```

3. Promote to a Production Version
```bash
cci flow run release_unlocked_production --org release
```